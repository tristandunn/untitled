# frozen_string_literal: true

require "rails_helper"

describe ApplicationController do
  it { is_expected.to be_a(ActionController::Base) }

  it "includes the authentication helpers" do
    expect(described_class).to include(Authentication)
  end
end
