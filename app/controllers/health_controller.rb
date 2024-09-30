# frozen_string_literal: true

class HealthController < ActionController::Base
  CHECKS = {
    database:   -> { ActiveRecord::Base.connection.execute("SELECT 1") },
    migrations: -> { ActiveRecord::Migration.check_all_pending! }
  }.freeze

  # Render the health status based on defined checks.
  def index
    render json: results, status: status
  end

  private

  # Return a true or false result for each check being successful or not.
  #
  # @return [Hash] Each check with a true or false value.
  def results
    @results ||= CHECKS.transform_values do |method|
      method.call

      true
    rescue StandardError
      false
    end
  end

  # Return the HTTP status based on results all being successful or not.
  #
  # @return [Symbol] Either :ok or :service_unavailable based on the results.
  def status
    if results.values.all?(&:present?)
      :ok
    else
      :service_unavailable
    end
  end
end
