# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
