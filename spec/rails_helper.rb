# This line requires the `config/environment` file, which bootstraps the Rails environment for testing
require File.expand_path('../config/environment', __dir__)

# This section can include additional configuration or setup for the Rails environment
# For example:
# ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Additional RSpec configuration can be added here
  # For example:
  # config.include Capybara::DSL
  # config.before(:suite) do
  #   DatabaseCleaner.strategy = :transaction
  #   DatabaseCleaner.clean_with(:truncation)
  # end
  # config.before(:each) do
  #   DatabaseCleaner.start
  # end
  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end
end
