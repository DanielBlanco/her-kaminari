# -*- encoding : utf-8 -*-
# test/lib/her/paginated_test.rb
require 'test_helper'

describe Her::Paginated::HeaderParser do
  include Rack::Test::Methods

  subject { PaginatedAPI.new }

  def app
    subject
  end

  let(:json) { JSON.parse(last_response.body) }

  it 'must call paginated api' do
    get '/', page: 1, per_page: 3
    json.must_equal [1, 2, 3]
  end

end

