# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:suite) do
    Prosopite.rails_logger = true
    Prosopite.raise = true
  end

  config.around do |example|
    Prosopite.scan

    example.run

    Prosopite.finish
  end
end
