# frozen_string_literal: true

FactoryBot.define do
  factory :page do
    title { 'MyString' }
    description { 'MyString' }
    cover { nil }
    user { association :user }
    parent { nil }

    trait :with_parent do
      parent { association :page }
    end
  end
end
