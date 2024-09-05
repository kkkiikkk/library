class BooksController < ApplicationController
  def index
    if params[:search].present?
      @books = Book.where(name: /#{params[:search]}/i)
    else
      @books = Book.all
    end
    flash.now[:notice] = 'No books found' if @books.empty?
  end

  def show
    @book = Book.find(params[:id])
    @like_count = @book.likes_count
    @average_rating = @book.average_rating
    @actions = @book.actions
  end
end
