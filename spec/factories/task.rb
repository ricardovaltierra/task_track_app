FactoryBot.define do
  factory :task do
    name { Faker::Book.title }
    description { Faker::Books::Dune.saying }
    completion { Faker::Number.between(from: 0, to: 30) }
  end
end