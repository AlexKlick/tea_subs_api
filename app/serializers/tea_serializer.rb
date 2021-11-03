class TeaSerializer
  include JSONAPI::Serializer
  set_type :tea

  attributes :title, :description, :temperature, :brew_time
  has_many :tea_subscriptions
  set_key_transform :camel
end
