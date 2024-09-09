class RequestsController < ApplicationController
  before_action :set_book, only: [:create]
  before_action :set_request, only: [:confirm]

  def create
    request_creation_service = RequestCreationService.new(user: current_user, book: @book, params: request_params)

    @request = request_creation_service.call

    if @request.persisted?
      redirect_to book_path(@book), notice: 'Request was successfully created. Please confirm your request through the email sent to you.'
    else
      redirect_to book_path(@book), alert: "Request creation failed: #{@request.errors.full_messages.join(', ')}"
    end
  end

  def confirm
    if @request.update(confirmed: true)
      redirect_to book_path(@request.book), notice: 'Request confirmed successfully.'
    else
      redirect_to book_path(@request.book), alert: "Failed to confirm the request."
    end
  end

  private

  def request_params
    params.require(:request).permit(:time_start, :time_end, :address, :phone_number)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_request
    @request = Request.find(params[:id])
  end
end
