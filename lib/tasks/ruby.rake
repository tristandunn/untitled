# frozen_string_literal: true

suppress(LoadError) do
  require "rspec/core/rake_task"

  namespace :ruby do
    desc "Run all the Ruby tests"
    task test: :spec
  end
end

suppress(LoadError) do
  require "rubocop/rake_task"

  RuboCop::RakeTask.new("ruby:lint") do |task|
    task.options = %w(--parallel)
  end
end

namespace :erb do
  desc "Run `bundle exec erblint`"
  task :lint do # rubocop:disable Rails/RakeEnvironment
    system("bundle exec erblint .") ||
      exit($CHILD_STATUS.exitstatus)
  end
end
