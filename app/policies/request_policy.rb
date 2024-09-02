class RequestPolicy
  attr_reader :user, :book

  def initialize(user, book)
    @user = user
    @book = book
  end

  def can_create?
    !pending_request_exists?
  end

  private

  def pending_request_exists?
    Request.where(user: user, book: book, status: 'pending').exists?
  end
end
