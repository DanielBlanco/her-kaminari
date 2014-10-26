# -*- encoding : utf-8 -*-
# test/lib/her/kaminari_test.rb
require 'test_helper'

describe Her::Kaminari::HeaderParser do

  subject { Her::Kaminari::HeaderParser.new }
  let(:body) { { 'data' => [1,2,3,4,5] } }
  let(:headers) { {'x-total'=>5, 'x-page'=> 1, 'x-per-page' => 3} }

  it 'parses pagination headers' do
    env = OpenStruct.new(body: body, response_headers: headers)
    subject.on_complete(env)
    env[:body].tap do |json|
      expected = {total_count: 5, per_page: 3, page: 1}
      json[:pagination].must_equal expected
    end
  end

end

