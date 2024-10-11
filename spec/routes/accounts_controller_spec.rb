# frozen_string_literal: true

require "rails_helper"

describe AccountsController, type: :routing do
  it { is_expected.to route(:get, "/accounts/new").to(action: :new) }
  it { is_expected.to route(:post, "/accounts").to(action: :create) }
end
