require 'rspec'
require 'parslet/rig/rspec'
require 'parslet'
require 'parslet/convenience'
require 'pp'
require_relative '../test_helper'

class P < Parslet::Parser
  root(:body)
  rule(:body) { elements }
  rule(:elements) { (call | element).repeat(2) }
  rule(:element) { str('bar') }
  rule(:call) { str('baz') >> str('()') }

  P.new.parse_with_debug('bazbar')
end
