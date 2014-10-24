# -*- encoding : utf-8 -*-
# lib/her/paginated/will_paginate_collection.rb
require 'will_paginate'
require 'will_paginate/collection'

module Her
  module Paginated
    module WillPaginateCollection
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods

        # Support for will_paginate pagination methods
        #
        # @param [Hash] options to paginate this
        # @option options [Integer] :page the page number
        # @option options [Integer] :per_page the number of records per page
        #
        # @example
        #   Post.paginate(:page => params[:page], :per_page => 30)
        #
        # @return [Her::Model::Relation] what her founds.
        def paginate(options)
          where(page: options[:page] || 1, per_page: options[:per_page] || 50)
        end

        # Creates a new paginated collection.
        #
        # @return [WillPaginate::Collection] a paginated collection
        def new_collection(parsed_data)
          collection = super(parsed_data)
          pagination = parsed_data[:pagination]
          page = pagination[:page]
          per_page = pagination[:per_page]
          total = pagination[:total_count]
          WillPaginate::Collection.create(page, per_page, total) do |pager|
            pager.replace(collection)
          end
        end

      end
    end
  end
end


