# frozen_string_literal: true

require "bundler/setup"
require 'pry'
require "call_center"

RSpec.configure do |config|
    # Stub all calls to AWS
  # config.before do
  #   Aws.config.update(stub_responses: true)
  # end

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
