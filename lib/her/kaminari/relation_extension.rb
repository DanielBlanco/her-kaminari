# -*- encoding : utf-8 -*-
# lib/her/kaminari/relation_extension.rb
module Her
  module Kaminari
    module RelationExtension
      def self.included(base)
        base.class_eval do
          # Iterates through each page.
          #
          # Useful for stitching together an array of all records, across every
          # page. For example:
          #
          #   users = User.all.each_page.flat_map(&:to_a)
          #
          # If there are 3 total pages, it would result in these HTTP requests:
          #
          #   GET /v1/users
          #   GET /v1/users?page=2
          #   GET /v1/users?page=3
          #
          # ...and this array of users (25 records per page):
          #
          #   users.count
          #   # => 75
          #
          # With the exception of the first one, pages are lazily fetched.
          def each_page
            return to_enum(:each_page) unless block_given?

            (current_page..total_pages).each do |number|
              yield (number == current_page) ? self : page(number)
            end
          end
        end
      end
    end
  end
end
