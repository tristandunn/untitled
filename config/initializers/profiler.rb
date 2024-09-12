# frozen_string_literal: true

if defined?(Rack::MiniProfiler)
  Rack::MiniProfiler.config.backtrace_threshold_ms = 0.1
  Rack::MiniProfiler.config.position = "bottom-right"
end
