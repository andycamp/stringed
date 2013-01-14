require 'rubygems'
require 'bundler/setup'
require 'pry'

require File.dirname(__FILE__) + '/../lib/stringed.rb'

include Stringed
include Music

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end
