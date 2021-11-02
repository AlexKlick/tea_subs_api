FactoryBot.define do
  factory :tea_subscription do
    title { "MyString" }
    price { 1.5 }
    status { "MyString" }
    frequency { "MyString" }
    customer { nil }
  end
end
