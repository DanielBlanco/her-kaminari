# -*- encoding : utf-8 -*-
require 'test_helper'

class Champion
  include Her::Model
  include Her::Paginated::KaminariCollection
end
