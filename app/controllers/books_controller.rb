class BooksController < ApplicationController
  def index
    @books = Book.all

    if params[:search].present?
      @books = @books.where(name: /#{Regexp.escape(params[:search])}/i)
    end

    if params[:status].present?
      if ['in', 'out'].include?(params[:status])
        @books = @books.where(status: params[:status])
      else
        flash.now[:alert] = "#{params[:status]} is not a valid status"
      end
    end

    if params[:author].present?
      @books = @books.where(author: /#{Regexp.escape(params[:author])}/i)
    end

    case params[:sort]
    when 'name'
      @books = @books.order_by(name: :asc)
    when 'author'
      @books = @books.order_by(author: :asc)
    when 'likes'
      @books = @books.sort_by(&:likes_count)
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
