#!/Users/jasdeep/.rvm/rubies/ruby-1.9.2-p290/bin/ruby -w
ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'
require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")

require 'garb'

@buses = Bus.all
pp @buses


