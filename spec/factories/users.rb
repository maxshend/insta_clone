# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@mail.com" }
    password { Faker::Internet.password(min_length: PasswordValidator::MINIMUM_LENGTH) }
    password_confirmation { password }
    active { true }
    approved { true }
    confirmed { true }
    role { :client }
  end
end
