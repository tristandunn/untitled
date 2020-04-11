# frozen_string_literal: true

begin
  require "scss_lint/rake_task"

  SCSSLint::RakeTask.new("css:lint")
rescue LoadError # rubocop:disable Lint/SuppressedException
end
