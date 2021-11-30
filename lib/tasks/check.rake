# frozen_string_literal: true

desc "Check the code"
task check: ["check:coverage"]

namespace :check do
  desc "Check the code, without coverage"
  task code: %i(
    ruby:test
    javascript:test
    ruby:lint
    javascript:lint
    css:lint
  )

  desc "Check the code, with coverage"
  task :coverage do # rubocop:disable Rails/RakeEnvironment
    ENV["COVERAGE"] = "true"

    Rake::Task["check:code"].invoke
  end
end

desc "Check the code"
task check: ["check:coverage"]
