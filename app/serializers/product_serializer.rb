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
class ProductSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :published
  belongs_to :user

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 1.hour
end
