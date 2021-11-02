FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    address { Faker::Address.street_address + " " +  
    Faker::Address.secondary_address + " " + 
    Faker::Address.city + " " + 
    Faker::Address.state_abbr + " " +
    Faker::Address.zip_code + " " +
    Faker::Address.country
  }
  end
end
