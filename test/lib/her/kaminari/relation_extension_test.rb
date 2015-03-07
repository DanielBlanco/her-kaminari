# -*- encoding : utf-8 -*-
# test/lib/her/kaminari/relation_extension_test.rb
require 'test_helper'

describe Her::Kaminari::RelationExtension do
  before do
    @model = Class.new do
      include Her::Model
      include Her::Kaminari::Collection

      root_element :champion
    end
  end

  describe '.each_page' do
    before { @subject = @model.all.each_page }

    it 'yields each page' do
      @subject.count.must_equal 2
      @subject.map(&:current_page).must_equal [1, 2]
      @subject.map(&:count).must_equal [5, 4]
    end
  end
end
