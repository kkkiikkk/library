class LikesController < ApplicationController
  before_action :set_book, only: [:create]
  before_action :authenticate_user!

  def create
    like = Like.find_or_initialize_by(user: current_user, book: @book)
    like.rate = like_params[:rate]

    if like.save
      redirect_to book_path(@book)
    else
      redirect_to book_path(@book), alert: "Like creation/update failed: #{like.errors.full_messages.join(', ')}"
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
