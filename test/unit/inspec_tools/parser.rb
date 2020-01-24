require 'rspec'
require 'parslet/rig/rspec'
require 'parslet'
require 'parslet/convenience'
require 'pp'
require_relative '../test_helper'

class ControlParser < Parslet::Parser
  root :controls

  rule :controls do
    control.repeat(1)
  end

  rule :control do
    header >>
      applicability >>
      description.maybe >>
      rationale.maybe >>
      audit.maybe >>
      remediation.maybe >>
      impact.maybe >>
      default_value.maybe >>
      references.maybe >>
      cis_controls.maybe
  end

  rule :attribute_absent do
    str('Description:').absent? >>
      str('Rationale:').absent? >>
      str('Audit:').absent? >>
      str('Remediation:').absent? >>
      str('Impact:').absent? >>
      str('Default Value:').absent? >>
      str('References:').absent? >>
      str('CIS Controls:').absent? >>
      str('Profile Applicability::').absent? >>
      header.absent?
  end

  rule(:header) do
    newline.maybe >>
      spaces.maybe >>
      (section_num.as(:section_num) >>
      title.as(:title) >>
      score.as(:score)).as(:header) >>
      newline
  end

  rule(:title) do
    (str('(Scored)').absent? >> str('(Not Scored)').absent? >> str('(Not').absent? >> str('(Not ').absent? >> (anyChar | lparn | rparn | newline) | space).repeat(1)
  end

  rule :applicability do
    str('Profile Applicability:') >>
      newline.maybe >>
      lines('Description:').as(:applicability)
  end

  rule :section_num do
    (integer.repeat(1) >>
      dot).repeat(1) >>
      integer.repeat(1) >>
      space
  end

  rule :description do
    str('Description:') >>
      newline.maybe >>
      lines('Rationale:').as(:description)
  end

  rule :rationale do
    str('Rationale:') >>
      newline.maybe >>
      lines('Audit:').as(:rationale)
  end

  rule :audit do
    str('Audit:') >>
      newline.maybe >>
      lines('Remediation:').as(:audit)
  end

  rule :remediation do
    str('Remediation:') >>
      newline.maybe >>
      lines('Impact:').as(:remediation)
  end

  rule :impact do
    str('Impact:') >>
      newline.maybe >>
      lines('Default Value:').as(:impact)
  end

  rule :default_value do
    str('Default Value:') >>
      newline.maybe >>
      lines('References:').as(:default_value)
  end

  rule :references do
    str('References:') >>
      newline.maybe >>
      lines('CIS Controls:').as(:references)
  end

  rule :cis_controls do
    str('CIS Controls:') >>
      newline.maybe >>
      lines("\n").as(:cis_controls)
  end

  rule :blank_line do
    spaces >> newline >> spaces
  end

  rule :newline do
    str("\r").maybe >> str("\n")
  end

  rule :semicolon do
    str(';')
  end

  rule :spaces do
    space.repeat(0)
  end

  rule :space do
    match(/\s/)
  end

  rule :space? do
    space.maybe
  end

  rule :hyphen do
    str('-')
  end

  # @FIXME doesn't the parslet `any` function alreayd take care of this?
  rule :anyChar do
    match('.')
  end

  rule :integer do
    match('[0-9]').repeat(1)
  end

  rule :word do
    match('[a-zA-Z0-9/,\.:\'$-_\"*]').repeat(1)
  end

  rule :words do
    (space? >> word >> (space | dot | hyphen).maybe).repeat(1) >> (newline >> (word >> space).repeat(1)).maybe
  end

  def line_body(_ending)
    (attribute_absent >> any).repeat(1)
  end

  def line(ending)
    line_body(ending)
  end

  def lines(ending)
    line(ending).as(:line).repeat
  end

  rule(:eol?) { str("\n").maybe }
  rule(:eof?) { any.absent? }

  rule :dot do
    str('.')
  end

  rule :real do
    integer.repeat(1) >>
      dot >>
      integer.repeat(1) >>
      dot.absent?
  end

  rule(:score) { lparn >> scored >> rparn }

  rule :lparn do
    str('(')
  end

  rule :rparn do
    str(')')
  end

  rule :scored do
    (str(' Scored') | str('Scored') | str('Not Scored') | (str('Not ') >> newline.maybe) | (str('Not') >> newline.maybe)).repeat
  end
end

RSpec.describe ControlParser do
  let(:parser) { ControlParser.new }
  context 'Parsing real numbers' do
    subject { parser.real }
    it { should parse '1.0' }
    it { should parse '1.12' }
    it { should_not parse '111' }
  end

  context 'Parsing a Header' do
    subject { parser.section_num }
    it { should parse '1.1 ' }
    it { should_not parse '1.1' }
  end

  context 'Parsing App' do
    subject { parser.applicability }
    it {
      should parse 'Profile Applicability: Level 1 Description:'
    }
  end
end

RSpec::Core::Runner.run(['--format', 'progress'])
