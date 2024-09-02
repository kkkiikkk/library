class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @like_count = @book.likes_count
    @average_rating = @book.average_rating
    @actions = @book.actions
  end
end
