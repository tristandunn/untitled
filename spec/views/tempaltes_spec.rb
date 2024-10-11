# frozen_string_literal: true

require "rails_helper"

describe "Templates" do
  let(:paths) { Rails.root.glob("app/views/**/*.*") }

  let(:views) do
    paths.map do |path|
      {
        path: path.to_s.sub(Rails.root.to_s, "").sub("/", ""),
        line: File.open(path, &:readline).strip
      }
    end
  end

  it "require explicit locals" do
    expect(views).to all(
      match(
        path: String,
        line: /\A<%# locals: \(.*\) %>\z/
      )
    )
  end
end
