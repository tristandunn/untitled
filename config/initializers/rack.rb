# frozen_string_literal: true

if Gem::Version.new(Rack.release) > Gem::Version.new("3.1.7") ||
   ActionPack.version > Gem::Version.new("8.0.0.beta1")
  raise "Rack patch to silence a deprecation warning from Rails may no longer be needed."
end

# rubocop:disable all
module Rack
  class Request
    module Helpers
      # Returns the data received in the query string.
      def GET
        rr_query_string = get_header(RACK_REQUEST_QUERY_STRING)
        query_string = self.query_string
        if rr_query_string == query_string
          get_header(RACK_REQUEST_QUERY_HASH)
        else
          query_hash = parse_query(query_string, "&")
          set_header(RACK_REQUEST_QUERY_STRING, query_string)
          set_header(RACK_REQUEST_QUERY_HASH, query_hash)
        end
      end
    end
  end
end
# rubocop:enable all
