class TeaSubscriptionSerializer
  include JSONAPI::Serializer
  set_type :tea_subscription

  attributes :title, :price, :status, :frequency
  belongs_to :customer
  set_key_transform :camel
end