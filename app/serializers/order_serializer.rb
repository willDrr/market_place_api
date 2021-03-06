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
class OrderSerializer
  include JSONAPI::Serializer

  belongs_to :user
  has_many :products

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 1.hour
end
