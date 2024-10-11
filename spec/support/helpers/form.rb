# frozen_string_literal: true

RSpec.configure do |config|
  config.include Shoulda::Matchers::ActiveModel, type: :form
end
