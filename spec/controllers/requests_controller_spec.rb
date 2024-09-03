# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/devise'

RSpec.describe RequestsController, type: :controller do
  describe 'POST #create' do
    login_user
    let(:book) { create(:book) }
    let(:valid_attributes) do
      {
        "time_start(1i)" => "2024",
        "time_start(2i)" => "12",
        "time_start(3i)" => "25",
        "time_end(1i)" => "2024",
        "time_end(2i)" => "12",
        "time_end(3i)" => "30",
        "address" => "123 Test Street",
        "phone_number" => "123-456-7890"
      }
    end

    let(:invalid_attributes) do
      {
        "time_start(1i)" => "2024",
        "time_start(2i)" => "12",
        "time_start(3i)" => "25",
        "time_end(1i)" => "2024",
        "time_end(2i)" => "12",
        "time_end(3i)" => nil,
        "address" => "",
        "phone_number" => ""
      }
    end

    context 'with valid parameters' do
      it 'creates a new request and redirects to the book page' do
        post :create, params: { book_id: book.id, request: valid_attributes }

        expect(response).to redirect_to(book_path(book))
        expect(flash[:notice]).to match(/Request was successfully created/)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new request and redirects with an alert' do
        expect {
          post :create, params: { book_id: book.id, request: invalid_attributes }
        }.not_to change(Request, :count)

        expect(response).to redirect_to(book_path(book))
        expect(flash[:alert]).to match(/Request creation failed:/)
      end
    end
  end
end
