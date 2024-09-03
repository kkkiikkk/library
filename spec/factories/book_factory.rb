# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    sequence(:name) { |_n| "New Book #{rand(1..100_000_000)}" }
    sequence(:author) { |_n| "New Author" }
    description { 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' }
    status { 'in' }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/images/test_book.jpg')) }
  end
end