# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/devise'

RSpec.describe CommentsController, type: :controller do
  describe 'POST #create' do 
    login_user
    let(:test_book) { create(:book) }
    let(:comment_attributes) { { caption: 'This is a test comment' } }
    
    context 'successful request' do
      it 'redirects to the book page' do
        expect {
          post :create, params: { book_id: test_book.id, comment: comment_attributes }
        }.to change(Comment, :count).by(1)

        expect(response).to redirect_to(book_path(test_book))
      end
    end

    context 'bad response with invalid parameters' do
      it 'does not create a comment and redirects with an alert' do
        invalid_attributes = { caption: '' }

        expect {
          post :create, params: { book_id: test_book.id, comment: invalid_attributes }
        }.not_to change(Comment, :count)

        expect(response).to redirect_to(book_path(test_book))
        expect(flash[:alert]).to match(/Request creation failed:/)
      end
    end
  end
end
