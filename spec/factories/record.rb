FactoryBot.define do
  factory :record do
    percentage { Faker::Number.between(from: 0, to: 100) }
  end
end