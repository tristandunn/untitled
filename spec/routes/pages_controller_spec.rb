# frozen_string_literal: true

require "rails_helper"

describe PagesController, type: :routing do
  it { is_expected.to route(:get, "/").to(action: :index) }
end
