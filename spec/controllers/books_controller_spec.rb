# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'GET #index' do 
    context 'succesfull response' do
      it 'returns books' do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET #show' do
    context 'succesfull response' do
      let(:test_book) { create(:book) }

      it 'returns specefic book' do
        get :show, params: { id: test_book.id }
        
        expect(response.status).to eq(200)
      end
    end

    context 'bad response' do
      it 'returns not found expection' do
        expect do
          get :show, params: { id: 10_010_101_010 }
        end.to raise_error(Mongoid::Errors::DocumentNotFound)
      end
    end
  end
end