# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  total      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Order < ApplicationRecord
  belongs_to :user
  validates :total, numericality: { greater_than_or_equal_to: 0 }
  validates :total, presence: true

  has_many :placements, dependent: :destroy
  has_many :products, through: :placements

  before_validation :set_total!
  
  def build_placements_with_product_ids_and_quantities(products_ids_and_quantities)
    products_ids_and_quantities.each do |product_id_and_quantity|
      placement = placements.build(
	product_id: product_id_and_quantity[:product_id],
	quantity: product_id_and_quantity[:quantity],
      )
      yield placement if block_given?
    end
  end

  def set_total!
    self.total = self.products.map(&:price).sum 
  end
end
