# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  title      :string
#  price      :decimal(, )
#  published  :boolean
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer          default(0)
#
class Product < ApplicationRecord
  validates :title, :user_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :orders, through: :placements

  scope :filter_by_title, -> (keyword) { where('lower(title) LIKE ?', "%#{keyword.downcase}%") }
  scope :above_or_equal_to_price, -> (price) { where('price >= ?', price) }
  scope :below_or_equal_to_price, -> (price) { where('price <= ?', price) }
  scope :recent, -> { order(:updated_at) }


  def self.search(params = {})
    products = params[:products_ids].present? ? Product.where(id: params[:product_ids]) :
      Product.all

    products = products.filter_by_title(params[:keyword]) if params[:keyword]
    products = products.above_or_equal_to_price(params[:min_price].to_f) if params[:min_price]
    products = products.below_or_equal_to_price(params[:max_price].to_f) if params[:max_price]
    products = products.recent if params[:recent]
    products
  end
end
