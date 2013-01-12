require 'rubygems'
require 'bundler/setup'

require File.dirname(__FILE__) + '/../lib/stringed.rb'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end
