module Utils
  class InspecUtil
    DATA_NOT_FOUND_MESSAGE = 'N/A'

    def self.parse_inspec_json(json)
      file = JSON.parse(json)
      controls = []
      if file['profiles'].nil?
        controls = file['controls']
      elsif file['profiles'].length == 1
        controls = file['profiles'].last['controls']
      else
        file['profiles'].each do |profile|
          controls.concat(profile['controls'])
        end
      end
      c_data = {}

      controls.each do |control|
        c_id = control['id'].to_sym
        c_data[c_id] = {}
        c_data[c_id]['id']             = control['id']    || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['title']          = control['title'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['desc']           = control['desc'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['severity']       = control['tags']['severity'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['gid']            = control['tags']['gid'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['gtitle']         = control['tags']['gtitle'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['gdescription']   = control['tags']['gdescription'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['rid']            = control['tags']['rid'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['rversion']       = control['tags']['rversion'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['rweight']        = control['tags']['rweight'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['stig_id']        = control['tags']['stig_id'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['cci']            = control['tags']['cci'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['nist']           = control['tags']['nist'] || ['unmapped']
        c_data[c_id]['check']          = control['tags']['check'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['checkref']       = control['tags']['checkref'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['fix']            = control['tags']['fix'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['fixref']         = control['tags']['fixref'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['rationale']      = control['tags']['rationale'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['cis_family']     = control['tags']['cis_family'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['cis_rid']        = control['tags']['cis_rid'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['cis_level']      = control['tags']['cis_level'] || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['impact']         = control['impact'].to_s || DATA_NOT_FOUND_MESSAGE
        c_data[c_id]['code']           = control['code'].to_s || DATA_NOT_FOUND_MESSAGE
      end

      @data['controls'] = c_data.values
    end 
    
    def self.parse_json(json)
      data = {}
      json['profiles'].each do |profile|
        profile['controls'].each do |control|
          c_id = control['id'].to_sym
          data[c_id] = {}
          data[c_id][:vuln_num]       = control['id'] unless control['id'].nil?
          data[c_id][:rule_title]     = control['title'] unless control['title'].nil?
          data[c_id][:vuln_discuss]   = control['desc'] unless control['desc'].nil?
          unless control['tags'].nil?
            data[c_id][:severity]       = control['tags']['severity'] unless control['tags']['severity'].nil?
            data[c_id][:gid]            = control['tags']['gid'] unless control['tags']['gid'].nil?
            data[c_id][:group_title]    = control['tags']['gtitle'] unless control['tags']['gtitle'].nil?
            data[c_id][:rule_id]        = control['tags']['rid'] unless control['tags']['rid'].nil?
            data[c_id][:rule_ver]       = control['tags']['stig_id'] unless control['tags']['stig_id'].nil?
            data[c_id][:cci_ref]        = control['tags']['cci'] unless control['tags']['cci'].nil?
            data[c_id][:nist]           = control['tags']['nist'].join(' ') unless control['tags']['nist'].nil?
            data[c_id][:check_content]  = control['tags']['check'] unless control['tags']['check'].nil?
            data[c_id][:fix_text]       = control['tags']['fix'] unless control['tags']['fix'].nil?
          end
          data[c_id][:impact]         = control['impact'].to_s unless control['impact'].nil?
          data[c_id][:profile_name]   = profile['name'].to_s unless profile['name'].nil?
          data[c_id][:profile_shasum] = profile['sha256'].to_s unless profile['sha256'].nil?

          data[c_id][:status] = []
          data[c_id][:message] = []
          if control.key?('results')
            control['results'].each do |result|
              data[c_id][:status].push(result['status'])
              data[c_id][:message].push(result['skip_message']) if result['status'] == 'skipped'
              data[c_id][:message].push("FAILED -- Test: #{result['code_desc']}\nMessage: #{result['message']}\n") if result['status'] == 'failed'
              data[c_id][:message].push("PASS -- #{result['code_desc']}\n") if result['status'] == 'passed'
            end
          end
          if data[c_id][:impact].to_f.zero?
            data[c_id][:message] = control['desc']
          end
        end
      end
      data
    end
    
    # @!method get_impact(severity)
    #   Takes in the STIG severity tag and converts it to the InSpec #{impact}
    #   control tag.
    #   At the moment the mapping is static, so that:
    #     high => 0.7
    #     medium => 0.5
    #     low => 0.3
    # @param severity [String] the string value you want to map to an InSpec
    # 'impact' level.
    #
    # @return impact [Float] the impact level level mapped to the XCCDF severity
    # mapped to a float between 0.0 - 1.0.
    #
    # @todo Allow for the user to pass in a hash for the desired mapping of text
    # values to numbers or to override our hard coded values.
    #
    def self.get_impact(severity)
      impact = case severity
               when 'low' then 0.3
               when 'medium' then 0.5
               else 0.7
               end
      impact
    end
    
    def self.unpack_inspec_json(directory, inspec_json, seperated = false, output_format)
      unpack_profile(directory, inspec_json, seperated, output_format)
      create_inspec_yml(directory, inspec_json)
    end
    
    private
    
    # @!method print_benchmark_info(info)
    # writes benchmark info to profile inspec.yml file
    #
    def create_inspec_yml(directory, inspec_json)
      benchmark_info =
  "name: #{inspec_json['name']}
  title: #{inspec_json['title']}
  maintainer: #{inspec_json['maintainer']}
  copyright: #{inspec_json['copyright']}
  copyright_email: #{inspec_json['copyright_email']}
  license: #{inspec_json['license']}
  summary: #{inspec_json['summary']}
  version: #{inspec_json['version']}"

      myfile = File.new("#{directory}/inspec.yml", 'w')
      myfile.puts benchmark_info
    end
    
    def unpack_profile(directory, inspec_json, seperated, output_format)
      Dir.mkdir directory.to_s unless Dir.exist?(directory.to_s)
      Dir.mkdir "#{directory}/controls" unless Dir.exist?("#{directory}/controls")
      Dir.mkdir "#{directory}/libaries" unless Dir.exist?("#{directory}/libraries")
      myfile = File.new("#{directory}/README.md", 'w')
      myfile.puts "# Example InSpec Profile\n\nthis example shows the implementation of an InSpec profile."
      if seperated
        if output_format == 'ruby'
          inspec_json['controls'].each do |control|
            file_name = control.id.to_s
            myfile = File.new("#{directory}/controls/#{file_name}.rb", 'w')
            myfile.puts wrap(control.to_ruby, WIDTH) + "\n"
            myfile.close
          end
        else
          inspec_json['controls'].each do |control|
            file_name = control.id.to_s
            myfile = File.new("#{directory}/controls/#{file_name}.rb", 'w')
            PP.pp(control.to_hash, myfile)
            myfile.close
          end
        end
      else
        myfile = File.new("#{directory}/controls/controls.rb", 'w')
        if output_format == 'ruby'
          inspec_json['controls'].each do |control|
            myfile.puts wrap(control.to_ruby, WIDTH) + "\n"
          end
        else
          inspec_json['controls'].each do |control|
            control.desc = control.desc.strip
            PP.pp(control.to_hash, myfile)
          end
        end
        myfile.close
      end
    end
  end
end