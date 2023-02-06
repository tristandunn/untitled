# frozen_string_literal: true

namespace :javascript do
  desc "Run `yarn lint`"
  task :lint do # rubocop:disable Rails/RakeEnvironment
    system("yarn lint") ||
      exit($CHILD_STATUS.exitstatus)
  end

  desc "Run `yarn test`"
  task :test do # rubocop:disable Rails/RakeEnvironment
    success = if ENV["COVERAGE"]
                system("yarn test:coverage")
              else
                system("yarn test")
              end

    success || exit($CHILD_STATUS.exitstatus)
  end

  if ENV["REMOVE_JS_BUILD_YARN_INSTALL"] == "true"
    Rake::Task["javascript:build"].clear

    desc "Build your JavaScript bundle"
    task :build do # rubocop:disable Rails/RakeEnvironment
      unless system("yarn build")
        raise "jsbundling-rails: Command build failed, " \
              "ensure yarn is installed and `yarn build` runs without errors"
      end
    end
  end
end
