# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class UserSerializer
  include JSONAPI::Serializer
  attributes :email
  has_many :products

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 1.hour
end
