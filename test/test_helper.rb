require 'simplecov'
SimpleCov.start
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "clearance/test_unit"
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  FactoryGirl.define do
    factory :user do
      email "john@example.com"
      username "slashrocket"
      first_name "John"
      last_initial  "D"
      password "password"
      admin false
    end
  end

  # Add more helper methods to be used by all tests here...
  def assert_valid(record, message = nil)
    message ||= "Expected #{record.inspect} to be valid"
    assert record.valid?, message
  end

  def assert_invalid(record, options = {})
    assert record.invalid?, "Expected #{record.inspect} to
      be invalid"
    options.each do |attribute, message|
      assert_includes record.errors[attribute], message
    end
  end
end
