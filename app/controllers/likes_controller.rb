class LikesController < ApplicationController
  before_action :set_book, only: %[create]
  before_action :authenticate_user!

  def create
    like = Like.new(like_params)
    like.user = current_user
    like.book = @book
    if like.save
      redirect_to book_path(@book), notice: 'Request was successfully created.'
    else 
      redirect_to book_path(@book), alert: "Request creation failed: #{like.errors.full_messages.join(', ')}"
    end
  end

  private 
  
  def set_book
    @book = Book.find(params[:book_id])
  end

  def like_params
    params.permit(:rate)
  end
end