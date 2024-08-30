class RequestCreationService
  attr_reader :user, :book, :params

  def initialize(user:, book:, params:)
    @user = user
    @book = book
    @params = params
  end

  def call
    request = Request.new(processed_params)
    request.user = user
    request.book = book

    if policy.can_create?
      request.save
    else
      request.errors.add(:base, 'A pending request for this book already exists for this user.')
    end

    request
  end

  private

  def processed_params
    {
      time_start: combine_date('time_start'),
      time_end: combine_date('time_end'),
      address: params[:address]
    }
  end

  def combine_date(field)
    Date.new(
      params["#{field}(1i)"].to_i,
      params["#{field}(2i)"].to_i,
      params["#{field}(3i)"].to_i
    )
  rescue
    nil
  end

  def policy
    @policy ||= RequestPolicy.new(user, book)
  end
end
