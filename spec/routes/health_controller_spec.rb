# frozen_string_literal: true

require "rails_helper"

describe HealthController, type: :routing do
  it { is_expected.to route(:get, "/health").to(action: :index) }
end
