# -*- encoding : utf-8 -*-
# test/lib/her/paginated/kaminari_collection_test.rb
require 'test_helper'

describe Her::Paginated::KaminariCollection do
  before do
    class Champion
      include Her::Model
      include Her::Paginated::KaminariCollection
    end
  end

  it 'should query by kaminari methods' do
    champions = Champion.page(2).per(2)
    champions.total_count.must_equal 9
    champions.length.must_equal 2
    champions.first.id.must_equal 3
  end

end

