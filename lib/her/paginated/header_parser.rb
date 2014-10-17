# -*- encoding : utf-8 -*-
# lib/her/paginated/header_parser.rb
module Her
  module Paginated
    class HeaderParser < Faraday::Response::Middleware
      def on_complete(env)
        @env = env

        pagination = {
          total_count: header("x-total").to_i,
          per_page:    (header("x-per-page") || env.body[:data].count).to_i,
          page:        header("x-page").to_i
        }

        env[:body].merge!(pagination: pagination)
      end

      private

      def header(name)
        @env.response_headers[name]
      end
    end
  end
end
