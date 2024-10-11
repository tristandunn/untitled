# frozen_string_literal: true

module Middleware
  class Backdoor
    # Initial the middleware.
    #
    # @param [Class] app The Rack application.
    # @return [void]
    def initialize(app)
      @app = app
    end

    # Update the session with account ID and remove them from the parameters,
    # when present.
    #
    # @param [Hash] env The request environment.
    # @return [void]
    def call(env)
      request = Rack::Request.new(env)
      request.session.update({
        account_id: request.params.delete("account")&.to_i
      }.compact)

      env["QUERY_STRING"] = request.params.presence

      @app.call(env)
    end
  end
end
