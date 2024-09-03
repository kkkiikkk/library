# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do 
  describe 'Comment validation' do
    let(:user) { create(:user) }
    let(:book_test) { create(:book) }
    let(:caption) { 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' }
    
    subject(:test_comment) { Comment.new(caption: caption, user: user, book: book_test) }

    context 'when comment is valid' do
      it 'returns true' do
        expect(test_comment).to be_valid
      end
    end

    context 'when caption is invalid' do 
      it 'returns false' do 
        test_comment.caption = nil
        expect(test_comment).not_to be_valid
      end
    end

    context 'when caption is invalid, symbol limit error' do 
      it 'returns false' do 
        test_comment.caption = '1'
        expect(test_comment).not_to be_valid
      end
    end

    context 'when book is invalid' do 
      it 'returns false' do 
        test_comment.book = nil
        expect(test_comment).not_to be_valid
      end
    end

    context 'when user is invalid' do 
      it 'returns false' do 
        test_comment.user = nil
        expect(test_comment).not_to be_valid
      end
    end
  end
end
