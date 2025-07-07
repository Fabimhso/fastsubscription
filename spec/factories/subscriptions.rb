FactoryBot.define do
  factory :subscription do
    user { nil }
    plan { nil }
    status { "MyString" }
    stripe_subscription_id { "MyString" }
    current_period_start { "2025-07-06 19:55:00" }
    current_period_end { "2025-07-06 19:55:00" }
  end
end
