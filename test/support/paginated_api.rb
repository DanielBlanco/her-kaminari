require 'test_helper'

class PaginatedAPI < Grape::API
  include Grape::Kaminari

  paginate
  get do
    paginate(Kaminari.paginate_array((1..10).to_a))
  end

end
