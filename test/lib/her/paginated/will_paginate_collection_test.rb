# -*- encoding : utf-8 -*-
# test/lib/her/paginated/will_paginate_collection_test.rb
require 'test_helper'

describe Her::Paginated::WillPaginateCollection do
  before do
    class Champion
      include Her::Model
      include Her::Paginated::WillPaginateCollection
    end
  end

  it 'should query by will_paginate methods' do
    champions = Champion.paginate(page: 2, per_page: 2)
    champions.total_entries.must_equal 9
    champions.length.must_equal 2
    champions.first.id.must_equal 3
  end

end
