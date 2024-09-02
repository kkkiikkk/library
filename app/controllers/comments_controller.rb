class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: %[create]

  def create
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.book = @book

    if comment.save
      redirect_to book_path(@book), notice: 'Request was successfully created.'
    else 
      redirect_to book_path(@book), alert: "Request creation failed: #{comment.errors.full_messages.join(', ')}"
    end
  end

  private
  
  def set_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:caption)
  end
end