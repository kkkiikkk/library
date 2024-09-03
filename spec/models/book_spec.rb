# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do 
  describe 'Book validation' do
    let(:description) { 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' }
    let(:name) { 'Test Book' }
    let(:image) { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/images/test_book.jpg')) }
    let(:author) { 'Test author' }
    let(:status) { 'in' }

    subject(:test_book) { Book.new(name: name, image: image, description: description, author: author, status: status) }

    context 'when book is valid' do 
      it 'is valid with valid attributes' do
        expect(test_book).to be_valid
      end
    end

    context 'when book is invalid' do
      it 'is invalid without a name' do
        test_book.name = nil
        expect(test_book).not_to be_valid
        expect(test_book.errors[:name]).to include("can't be blank")
      end

      it 'is invalid with a short description' do
        test_book.description = 'Too short'
        expect(test_book).not_to be_valid
        expect(test_book.errors[:description]).to include('is too short (minimum is 50 characters)')
      end

      it 'is invalid with an unsupported status' do
        test_book.status = 'unknown'
        expect(test_book).not_to be_valid
      end

      it 'is invalid with a null author' do 
        test_book.author = nil
        expect(test_book).not_to be_valid
      end
    end
  end
end
