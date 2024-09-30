# frozen_string_literal: true

require "rails_helper"

describe HealthController, "#index" do
  subject do
    get :index

    self
  end

  context "with all checks successful" do
    it { is_expected.to respond_with(200) }
  end

  context "with a database error" do
    let(:connection) { instance_double(ActiveRecord::ConnectionAdapters::SQLite3Adapter) }

    before do
      allow(connection).to receive(:execute).with("SELECT 1").and_raise
      allow(ActiveRecord::Base).to receive(:connection).and_return(connection)
    end

    it { is_expected.to respond_with(503) }
  end

  context "with pending migrations" do
    before do
      allow(ActiveRecord::Migration).to receive(:check_all_pending!).and_raise
    end

    it { is_expected.to respond_with(503) }
  end
end
