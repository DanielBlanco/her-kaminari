# -*- encoding : utf-8 -*-
# lib/her/kaminari/collection.rb
require 'kaminari'
require 'kaminari/models/array_extension'

module Her
  module Kaminari
    module Collection
      def self.included(base)
        base.class_eval do
          # support for kaminari pagination methods
          scope :page, ->(page) { where(page: page || 1) }
          scope :per,  ->(per_page) { where(per_page:  per_page || 50) }
        end
        base.extend(ClassMethods)
        base::Relation.send(:include, Her::Kaminari::RelationExtension)
      end

      module ClassMethods

        # Creates a new paginated collection from API data.
        # This method makes the assumption the collection was already paginated
        # by the API.
        #
        # @return [Kaminari::PaginatableArray] a paginated collection
        def new_collection(parsed_data)
          collection = super(parsed_data)
          pagination = parsed_data[:pagination]
          collection = ::Kaminari::PaginatableArray.new(
            collection,
            total_count: pagination[:total_count],
            limit: pagination[:per_page]
          ).tap do |array|
            array.extend ::Kaminari::PageScopeMethods
            array.singleton_class.class_eval do

              # @return [Integer] our API page number
              define_method :current_page do
                pagination[:page]
              end

              # @return [Integer] our API offset number
              define_method :offset_value do
                pagination[:offset]
              end

            end
          end
          collection
        end

      end
    end
  end
end
