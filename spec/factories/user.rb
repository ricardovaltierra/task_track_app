FactoryBot.define do
  factory :user do
    email { Faker::Creature::Dog.name }
    password { Faker::Color.color_name }
  end
end