# frozen_string_literal: true

namespace :css do
  desc "Run `yarn lint:css`"
  task :lint do # rubocop:disable Rails/RakeEnvironment
    system "yarn lint:css"
  end
end
