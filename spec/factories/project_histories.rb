FactoryBot.define do
  factory :project_history do
    project { nil }
    user { nil }
    action { "MyString" }
    description { "MyText" }
  end
end
