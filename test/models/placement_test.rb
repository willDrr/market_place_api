# == Schema Information
#
# Table name: placements
#
#  id         :bigint           not null, primary key
#  order_id   :bigint           not null
#  product_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class PlacementTest < ActiveSupport::TestCase
  setup do
    @placement = placements(:one)
  end

  test 'decreases the product quantity by the placement quantity' do
    product = @placement.product
    
    assert_difference('product.quantity', -@placement.quantity) do
      @placement.decrement_product_quantity!
    end
  end
end
