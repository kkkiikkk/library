# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/devise'

RSpec.describe LikesController, type: :controller do
  describe 'POST #create' do 
    login_user
    let(:test_book) { create(:book) }
    
    context 'successful request' do
      it 'redirects to the book page' do
        expect {
          post :create, params: { book_id: test_book.id, rate: 3 }
        }.to change(Like, :count).by(1)

        expect(response).to redirect_to(book_path(test_book))
      end
    end

    context 'bad response with invalid parameters' do
      it 'does not create a like and redirects with an alert' do
        expect {
          post :create, params: { book_id: test_book.id, rate: 6 }
        }.not_to change(Like, :count)

        expect(response).to redirect_to(book_path(test_book))
      end
    end
  end
end
