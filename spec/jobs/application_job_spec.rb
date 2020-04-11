# frozen_string_literal: true

require "rails_helper"

describe ApplicationJob, type: :job do
  subject(:klass) { described_class }

  it "inherits from ActiveJob base" do
    expect(klass.superclass).to eq(ActiveJob::Base)
  end
end
