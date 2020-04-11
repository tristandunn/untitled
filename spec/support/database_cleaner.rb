# frozen_string_literal: true

require "database_cleaner"

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before do
    is_rack = Capybara.current_driver == :rack_test

    DatabaseCleaner.strategy = is_rack ? :transaction : :truncation
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end
