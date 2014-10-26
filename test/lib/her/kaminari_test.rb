# -*- encoding : utf-8 -*-
# test/lib/her/kaminari_test.rb
require 'test_helper'

describe Her::Kaminari do

  it 'must be defined' do
    Her::Kaminari::VERSION.wont_be_nil
  end

end
