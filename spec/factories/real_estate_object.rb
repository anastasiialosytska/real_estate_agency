# frozen_string_literal: true

FactoryBot.define do
  factory :real_estate_object do
    title       { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    area        { Faker::Number.between(from: 40, to: 150) }
    rooms       { Faker::Number.between(from: 1, to: 5) }
    floor       { Faker::Number.between(from: 1, to: 20) }
    price       { Faker::Number.between(from: 100.0, to: 1000.0) }
    category

    trait :invalid do
      title { nil }
    end
  end
end
