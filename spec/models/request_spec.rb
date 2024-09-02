# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Request, type: :model do 
  describe 'Request validation' do
    let(:user) { create(:user) }
    let(:book_test) { create(:book) }
    let(:time_start) { Date.new(2024, 2, 3) }
    let(:time_end) { Date.new(2024, 3, 5) }
    let(:phone_number) { '+443213129312' }
    let(:address) { 'st. Nove 21, Nevada' }

    subject(:test_request) { Request.new(time_end: time_end, user: user, book: book_test, time_start: time_start, phone_number: phone_number, address: address) }

    context 'when request is valid' do
      it 'returns true' do
        expect(test_request).to be_valid
      end
    end

    context 'when request user is invalid' do
      it 'returns false' do
        test_request.user = nil
        expect(test_request).not_to be_valid
      end
    end

    context 'when request time is wrong' do
      it 'returns false' do
        test_request.time_end = Date.new(2024, 1, 1)
        expect(test_request).not_to be_valid
      end
    end

    context 'when request status is invalid' do
      it 'returns false' do
        test_request.status = 'wrong'
        expect(test_request).not_to be_valid
      end
    end

    context 'when request book is invalid' do
      it 'returns false' do
        test_request.book = nil
        expect(test_request).not_to be_valid
      end
    end

    context 'when request address is invalid' do
      it 'returns false' do
        test_request.address = nil
        expect(test_request).not_to be_valid
      end
    end
  end
end
