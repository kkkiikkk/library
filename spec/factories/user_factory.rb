# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |_n| "user#{rand(1..100_000_000)}@example.com" }
    password { 'password123' }
    password_confirmation { 'password123' }
  end
end