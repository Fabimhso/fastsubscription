FactoryBot.define do
  factory :plan do
    name { "MyString" }
    description { "MyText" }
    price { "9.99" }
    features { "MyText" }
    active { false }
  end
end
