class RequestsController < ApplicationController
  before_action :set_book, only: [:create]

  def create
    request_creation_service = RequestCreationService.new(user: current_user, book: @book, params: request_params)

    @request = request_creation_service.call

    if @request.persisted?
      redirect_to book_path(@book), notice: 'Request was successfully created.'
    else
      redirect_to book_path(@book), alert: "Request creation failed: #{@request.errors.full_messages.join(', ')}"
    end
  end

  private

  def request_params
    params.require(:request).permit(:time_start, :time_end, :address)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
