class HomeController < ApplicationController 
  def index
    relation = Book.all
    @books = PopularBooksQuery.new.call(relation)
  end
end
