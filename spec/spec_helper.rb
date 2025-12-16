require 'yaml'
require_relative '../lib/questionnaire'
require_relative '../lib/printer'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end