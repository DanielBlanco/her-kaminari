# -*- encoding : utf-8 -*-
# lib/her/paginated/collection.rb
module Her
  module Paginated
    module Collection
      def self.included(base)
        base.class_eval do
          # support for kaminari pagination methods
          scope :page, ->(page) { where(page: page || 1) }
          scope :per,  ->(per_page) { where(per_page:  per_page || 50) }
        end
        base.extend(ClassMethods)
      end

      module ClassMethods
        # @return [Kaminari::PaginatableArray] a paginated collection
        def new_collection(parsed_data)
          collection = super(parsed_data)
          pagination = parsed_data[:pagination]
          Kaminari.paginate_array(collection, total_count: pagination[:total_count])
            .page(pagination[:page])
            .per(pagination[:per_page])
        end
      end
    end
  end
end

