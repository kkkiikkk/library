class BooksController < ApplicationController
  def index
    @books = Book.all

    if params[:search].present?
      @books = @books.where(name: /#{params[:search]}/i)
    end

    if params[:status].present?
      @books = @books.where(status: params[:status])
    end

    if params[:author].present?
      @books = @books.where(author: /#{params[:author]}/i)
    end

    case params[:sort]
    when 'name'
      @books = @books.order_by(name: :asc)
    when 'author'
      @books = @books.order_by(author: :asc)
    when 'likes'
      @books = @books.sort_by { |book| book.likes_count }
    else
      @books = @books.order_by(created_at: :desc)
    end

    @books = @books.page(params[:page]).per(5)
    flash.now[:notice] = 'No books found' if @books.empty?
  end

  def show
    @book = Book.find(params[:id])
    @like_count = @book.likes_count
    @average_rating = @book.average_rating
    @actions = @book.actions
  end
end
