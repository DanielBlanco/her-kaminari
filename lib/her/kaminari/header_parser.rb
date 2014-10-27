# -*- encoding : utf-8 -*-
# lib/her/paginated/header_parser.rb
module Her
  module Kaminari
    class HeaderParser < Faraday::Response::Middleware

      # @param [Hash] env environment
      def on_complete(env)
        @env = env

        pagination = {
          total_count: header("x-total").to_i,
          per_page:    (header("x-per-page") || env.body[:data].count).to_i,
          page:        header("x-page").to_i,
          offset:      header('x-offset').to_i
          #total_pages: header('x-total-pages').to_i,
          #next_page:   header('x-next-page').to_i,
          #prev_page:   header('x-prev-page').to_i,
        }

        env[:body].merge!(pagination: pagination)
      end

      private

        # Returns a response header value.
        #
        # @param [String] name of the header attribute
        # @return [String] the response header value
        def header(name)
          @env.response_headers[name]
        end
    end
  end
end
