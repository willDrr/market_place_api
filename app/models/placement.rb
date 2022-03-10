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
class Placement < ApplicationRecord
  belongs_to :order
  belongs_to :product, inverse_of: :placements
end
