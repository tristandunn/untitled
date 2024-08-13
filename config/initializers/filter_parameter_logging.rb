# frozen_string_literal: true

# Configure parameters to be partially matched (e.g. passw matches password)
# and filtered from the log file. Use this to limit dissemination of sensitive
# information.
#
# See the ActiveSupport::ParameterFilter documentation for supported notations
# and behaviors.
Rails.application.config.filter_parameters += %i(
  _key certificate crypt email otp passw salt secret ssn token
)
