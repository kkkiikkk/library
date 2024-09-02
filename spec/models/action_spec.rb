# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Action, type: :model do 
  describe 'Action validation' do
    let(:user) { create(:user) }
    let(:book_test) { create(:book) }

    subject(:test_action) { Action.new(user: user, book: book_test) }

    context 'when action is valid' do
      it 'returns true' do
        expect(test_action).to be_valid
      end
    end

    context 'when user is invalid' do
      it 'returns false' do
        test_action.user = nil
        expect(test_action).not_to be_valid
      end
    end

    context 'when book is invalid' do
      it 'returns false' do
        test_action.book = nil
        expect(test_action).not_to be_valid
      end
    end
  end
end
