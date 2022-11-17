# frozen_string_literal: true

FactoryBot.define do
  factory :page do
    title { 'MyString' }
    description { 'MyString' }
    cover { nil }
    user { nil }
  end
end
