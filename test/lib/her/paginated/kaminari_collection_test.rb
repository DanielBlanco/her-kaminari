# -*- encoding : utf-8 -*-
# test/lib/her/paginated_test.rb
require 'test_helper'

describe Her::Paginated::KaminariCollection do
  before do
    class Champion
      include Her::Model
      include Her::Paginated::KaminariCollection
    end
  end
  it 'should query paginate model' do
    champions = Champion.page(1).all
    champions.total_count.must_equal 9
  end
end

