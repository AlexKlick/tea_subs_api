class CustomerSerializer
  include JSONAPI::Serializer
  set_type :customer

  attributes :first_name, :last_name, :email, :address
  set_key_transform :camel
end