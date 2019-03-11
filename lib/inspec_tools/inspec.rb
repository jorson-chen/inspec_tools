require 'date'
require 'json'
require 'cgi'
require 'csv'
require 'yaml'
require 'pp'
require_relative '../happy_mapper_tools/stig_attributes'
require_relative '../happy_mapper_tools/stig_checklist'
require_relative '../happy_mapper_tools/benchmark'
require_relative '../utilities/inspec_util'
require_relative 'csv'

include Socket::Constants

# rubocop:disable Metrics/ClassLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/BlockLength
# rubocop:disable Style/GuardClause

module InspecTools
  class Inspec
    def initialize(inspec_json, metadata = '{}')
      @json = JSON.parse(inspec_json)
      @metadata = JSON.parse(metadata)
    end

    def to_ckl(title = nil, date = nil, cklist = nil)
      @data = Utils::InspecUtil.parse_data_for_ckl(@json)
      @title = generate_title title, @json, date
      @cklist = cklist
      @checklist = HappyMapperTools::StigChecklist::Checklist.new
      if @cklist.nil?
        generate_ckl
      else
        update_ckl
      end
      @checklist.to_xml.encode('UTF-8').gsub('<?xml version="1.0"?>', '<?xml version="1.0" encoding="UTF-8"?>').chomp
    end

    def to_xccdf(attributes, verbose = false)
      @data = Utils::InspecUtil.parse_data_for_xccdf(@json)
      @attribute = attributes
      @attribute = {} if @attribute.eql? false
      @verbose = verbose
      @benchmark = HappyMapperTools::Benchmark::Benchmark.new
      populate_header
      # populate_profiles @todo populate profiles; not implemented now because its use is deprecated
      populate_groups
      @benchmark.to_xml
    end

    ####
    # converts an InSpec JSON to a CSV file
    ###
    def to_csv
      @data = {}
      @data['controls'] = []
      get_all_controls_from_json(@json)
      data = inspec_json_to_array(@data)
      CSV.generate do |csv|
        data.each do |row|
          csv << row
        end
      end
    end

    private

    ###
    #  This method converts an inspec json to an array of arrays
    #
    # @param inspec_json : an inspec profile formatted as a json object
    ###
    def inspec_json_to_array(inspec_json)
      data = []
      headers = {}
      inspec_json['controls'].each do |control|
        control.each do |key, _|
          control['tags'].each { |tag, _| headers[tag] = 0 } if key == 'tags'
          control['results'].each { |result| result.each { |result_key, _| headers[result_key] = 0 } } if key == 'results'
          headers[key] = 0 unless %w{tags results}.include?(key)
        end
      end
      data.push(headers.keys)
      inspec_json['controls'].each do |json_control|
        control = []
        headers.each do |key, _|
          control.push(json_control[key] || json_control['tags'][key] || (json_control['results']&.collect { |result| result[key] }&.join(",\n")) || nil)
        end
        data.push(control)
      end
      data
    end

    def get_all_controls_from_json(json)
      json['profiles']&.each do |profile|
        profile['controls'].each do |control|
          @data['controls'] << control
        end
      end
      if json['profiles'].nil?
        json['controls'].each do |control|
          @data['controls'] << control
        end
      end
    end

    def update_ckl
      @checklist = HappyMapperTools::StigChecklist::Checklist.parse(@cklist.to_s)
      @data.keys.each do |control_id|
        vuln = @checklist.where('Vuln_Num', control_id.to_s)
        vuln.status = Utils::InspecUtil.control_status(@data[control_id])
        vuln.finding_details << Utils::InspecUtil.control_finding_details(@data[control_id], vuln.status)
      end
    end

    def generate_vuln_data(control)
      vuln = HappyMapperTools::StigChecklist::Vuln.new
      stig_data_list = []

      %w{
        Vuln_Num Severity Group_Title Rule_ID Rule_Ver Rule_Title Vuln_Discuss
        Check_Content Fix_Text CCI_REF
      }.each do |param|
        stigdata = HappyMapperTools::StigChecklist::StigData.new
        stigdata.attrib = param
        stigdata.data = control[param.downcase.to_sym]
        stig_data_list.push(stigdata)
      end

      stigdata = HappyMapperTools::StigChecklist::StigData.new
      stigdata.attrib = 'STIGRef'
      stigdata.data = @title
      stig_data_list.push(stigdata)

      vuln.stig_data = stig_data_list
      vuln.status = Utils::InspecUtil.control_status(control)
      vuln.comments = "\nAutomated compliance tests brought to you by the MITRE corporation and the InSpec project.\n\nInspec Profile: #{control[:profile_name]}\nProfile shasum: #{control[:profile_shasum]}"
      vuln.finding_details = Utils::InspecUtil.control_finding_details(control, vuln.status)
      vuln.severity_override = ''
      vuln.severity_justification = ''

      vuln
    end

    def generate_title(title, json, date)
      title ||= "Untitled - Checklist Created from Automated InSpec Results JSON; Profiles: #{json['profiles'].map { |x| x['name'] }.join(' | ')}"
      title + " Checklist Date: #{date || Date.today.to_s}"
    end

    def generate_ckl
      stigs = HappyMapperTools::StigChecklist::Stigs.new
      istig = HappyMapperTools::StigChecklist::IStig.new

      vuln_list = []
      @data.keys.each do |control_id|
        if control_id != :platform
          vuln_list.push(generate_vuln_data(@data[control_id]))
        end
      end

      siData = HappyMapperTools::StigChecklist::SiData.new
      siData.name = "stigid"
      siData.data = ""
      if !@metadata['stigid'].nil?
        siData.data = @metadata['stigid']
      end

      stigInfo = HappyMapperTools::StigChecklist::StigInfo.new
      stigInfo.si_data = siData
      istig.stig_info = stigInfo

      istig.vuln = vuln_list
      stigs.istig = istig
      @checklist.stig = stigs

      hostname = @metadata['hostname']
      if hostname.nil? && @data[:platform].nil?
        hostname = ""
      elsif hostname.nil?
        hostname = @data[:platform][:hostname]
      end

      ip = @metadata['ip']
      mac = @metadata[:mac]

      nics = @data[:platform].nil? ? [] : @data[:platform][:network]
      nicsIPs = []
      nicsMacs = []
      nics.each do |nic|
        nicsIPs.push(*nic[:ips])
        nicsMacs.push(nic[:mac])
      end

      if ip.nil?
        ip = nicsIPs.join(',')
      end

      if mac.nil?
        mac = nicsMacs.join(',')
      end

      fqdn = @metadata['fqdn']
      if fqdn.nil? && @data[:platform].nil?
        fqdn = ""
      elsif fqdn.nil?
        fqdn = @data[:platform][:fqdn]
      end

      asset = HappyMapperTools::StigChecklist::Asset.new
      asset.role = !@metadata['role'].nil? ? @metadata['role'] : 'Workstation'
      asset.type = !@metadata['type'].nil? ? @metadata['type'] : 'Computing'
      asset.host_name = hostname
      asset.host_ip = ip
      asset.host_mac = mac
      asset.host_fqdn = fqdn
      asset.tech_area = !@metadata['tech_area'].nil? ? @metadata['tech_area'] : ''
      asset.target_key = !@metadata['target_key'].nil? ? @metadata['target_key'] : ''
      asset.web_or_database = !@metadata['web_or_databae'].nil? ? @metadata['web_or_database'] : '0'
      asset.web_db_site = !@metadata['web_db_site'].nil? ? @metadata['web_db_site'] : ''
      asset.web_db_instance = !@metadata['web_db_instance'].nil? ? @metadata['web_db_instance'] : ''
      @checklist.asset = asset
    end

    def populate_header
      @benchmark.title = @attribute['benchmark.title']
      @benchmark.id = @attribute['benchmark.id']
      @benchmark.description = @attribute['benchmark.description']
      @benchmark.version = @attribute['benchmark.version']

      @benchmark.status = HappyMapperTools::Benchmark::Status.new
      @benchmark.status.status = @attribute['benchmark.status']
      @benchmark.status.date = @attribute['benchmark.status.date']

      @benchmark.notice = HappyMapperTools::Benchmark::Notice.new
      @benchmark.notice.id = @attribute['benchmark.notice.id']

      @benchmark.plaintext = HappyMapperTools::Benchmark::Plaintext.new
      @benchmark.plaintext.plaintext = @attribute['benchmark.plaintext']
      @benchmark.plaintext.id = @attribute['benchmark.plaintext.id']

      @benchmark.reference = HappyMapperTools::Benchmark::ReferenceBenchmark.new
      @benchmark.reference.href = @attribute['reference.href']
      @benchmark.reference.dc_publisher = @attribute['reference.dc.publisher']
      @benchmark.reference.dc_source = @attribute['reference.dc.source']
    end

    def populate_groups
      group_array = []
      @data['controls'].each do |control|
        group = HappyMapperTools::Benchmark::Group.new
        group.id = control['id']
        group.title = control['gtitle']
        group.description = "<GroupDescription>#{control['gdescription']}</GroupDescription>"

        group.rule = HappyMapperTools::Benchmark::Rule.new
        group.rule.id = control['rid']
        group.rule.severity = control['severity']
        group.rule.weight = control['rweight']
        group.rule.version = control['rversion']
        group.rule.title = control['title'].tr("\n", ' ')
        group.rule.description = "<VulnDiscussion>#{control['desc'].tr("\n", ' ')}</VulnDiscussion><FalsePositives></FalsePositives><FalseNegatives></FalseNegatives><Documentable>false</Documentable><Mitigations></Mitigations><SeverityOverrideGuidance></SeverityOverrideGuidance><PotentialImpacts></PotentialImpacts><ThirdPartyTools></ThirdPartyTools><MitigationControl></MitigationControl><Responsibility></Responsibility><IAControls></IAControls>"

        group.rule.reference = HappyMapperTools::Benchmark::ReferenceGroup.new
        group.rule.reference.dc_publisher = @attribute['reference.dc.publisher']
        group.rule.reference.dc_title = @attribute['reference.dc.title']
        group.rule.reference.dc_subject = @attribute['reference.dc.subject']
        group.rule.reference.dc_type = @attribute['reference.dc.type']
        group.rule.reference.dc_identifier = @attribute['reference.dc.identifier']

        group.rule.ident = HappyMapperTools::Benchmark::Ident.new
        group.rule.ident.system = 'http://iase.disa.mil/cci'
        group.rule.ident.ident = control['cci']

        group.rule.fixtext = HappyMapperTools::Benchmark::Fixtext.new
        group.rule.fixtext.fixref = control['fixref']
        group.rule.fixtext.fixtext = control['fix']

        group.rule.fix = HappyMapperTools::Benchmark::Fix.new
        group.rule.fix.id = control['fixref']

        group.rule.check = HappyMapperTools::Benchmark::Check.new
        group.rule.check.system = control['checkref']
        group.rule.check.content_ref = HappyMapperTools::Benchmark::ContentRef.new
        group.rule.check.content_ref.name = @attribute['content_ref.name']
        group.rule.check.content_ref.href = @attribute['content_ref.href']
        group.rule.check.content = control['check']

        group_array << group
      end
      @benchmark.group = group_array
    end
  end
end
