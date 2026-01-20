# frozen_string_literal: true

require "rails_helper"

describe "Templates" do
  let(:paths) { Rails.root.glob("app/views/**/_*.*") }

  let(:views) do
    paths.map do |path|
      {
        line: File.open(path, &:readline).strip,
        path: path.to_s.sub(Rails.root.to_s, "").sub("/", "")
      }
    end
  end

  it "require explicit locals" do
    expect(views).to all(
      match(line: /\A<%# locals: \(.*\) %>\z/, path: String)
    )
  end
end
