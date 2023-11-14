# frozen_string_literal: true

FactoryBot.define do
  factory :agent do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    company_name { Faker::Lorem.characters(number: 10) }
    password { Faker::Internet.password }
  end
end
