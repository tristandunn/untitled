# frozen_string_literal: true

# Run using the `bin/ci` script.

CI.run do
  step "Setup", "bin/setup --skip-server"

  step "Style: Ruby", "bin/rubocop"
  step "Style: ERB", "bin/rails erb:lint"
  step "Style: ERB (Herb)", "yarn lint:erb"
  step "Style: CSS", "yarn lint:css"
  step "Style: JavaScript", "yarn lint"

  step "Security: Gem audit", "bin/bundler-audit"
  step "Security: Importmap vulnerability audit", "bin/importmap audit"
  step "Security: Brakeman code analysis",
       "bin/brakeman --quiet --no-pager --exit-on-warn --exit-on-error"

  step "Tests: JavaScript", "yarn test:coverage"
  step "Tests: Rails", "env CI=1 bin/rails spec"

  # Optional: Set a green GitHub commit status to unblock PR merge. Requires
  # the `gh` CLI and `gh extension install basecamp/gh-signoff`.
  #
  # if success?
  #   step "Signoff: All systems go. Ready for merge and deploy.", "gh signoff"
  # else
  #   failure "Signoff: CI failed. Do not merge or deploy.",
  #           "Fix the issues and try again."
  # end
end
