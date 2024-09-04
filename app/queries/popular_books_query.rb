class PopularBooksQuery
  def call(relation)
    relation
      .map do |book|
        {
          book: book,
          popularity: book.likes.count + book.comments.count
        }
      end
      .sort_by { |book_info| -book_info[:popularity] }
      .first(5)
      .map { |book_info| book_info[:book] }
  end
end
