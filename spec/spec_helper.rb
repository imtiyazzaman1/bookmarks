require 'capybara/rspec'
require 'pg'
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'rspec'
require './app'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

ENV['RACK_ENV'] = 'test'
Capybara.app = BookmarkManager

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::Console
  ]
)
SimpleCov.start
