# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do 
  describe 'Like validation' do
    let(:user) { create(:user) }
    let(:book_test) { create(:book) }
    let(:rate) { 3 }

    subject(:test_like) { Like.new(rate: rate, user: user, book: book_test) }

    context 'when like is valid' do
      it 'returns true' do
        expect(test_like).to be_valid
      end
    end

    context 'when user is invalid' do
      it 'returns false' do
        test_like.user = nil
        expect(test_like).not_to be_valid
      end
    end

    context 'when book is invalid' do
      it 'returns false' do
        test_like.book = nil
        expect(test_like).not_to be_valid
      end
    end

    context 'when rate is invalid, rate out of range' do
      it 'returns false' do
        test_like.rate = 8
        expect(test_like).not_to be_valid
      end
    end
    
    context 'when rate is invalid, rate is nil' do
      it 'returns false' do
        test_like.rate = nil
        expect(test_like).not_to be_valid
      end
    end
  end
end
