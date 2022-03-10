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
  # test "the truth" do
  #   assert true
  # end
end
