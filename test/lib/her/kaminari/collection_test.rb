# -*- encoding : utf-8 -*-
# test/lib/her/kaminari/collection_test.rb
require 'test_helper'

describe Her::Kaminari::Collection do
  before do
    class Champion
      include Her::Model
      include Her::Kaminari::Collection
    end
  end

  it 'should query by kaminari methods' do
    champions = Champion.page(2).per(2)
    #binding.pry
    champions.size.must_equal 2
    champions.current_page.must_equal 2
    champions.total_count.must_equal 9
    champions.first.id.must_equal 3
  end

end

