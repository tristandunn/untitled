# frozen_string_literal: true

begin
  require "rspec/core/rake_task"

  namespace :ruby do
    task test: :spec
  end
rescue LoadError # rubocop:disable Lint/SuppressedException
end

begin
  require "rubocop/rake_task"

  RuboCop::RakeTask.new("ruby:lint") do |task|
    task.options = %w(--parallel)
  end
rescue LoadError # rubocop:disable Lint/SuppressedException
end
