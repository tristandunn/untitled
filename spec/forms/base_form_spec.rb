# frozen_string_literal: true

require "rails_helper"

describe BaseForm, type: :form do
  describe "class" do
    subject { described_class }

    it { is_expected.to include(ActiveModel::Model) }
  end
end
