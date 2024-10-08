class RequestMailer < ApplicationMailer
  default from: 'ruddnovskiy@gmail.com'

  def request_created(request_id)
    @request = Request.find(request_id)
    @user = @request.user
    mail(to: @user.email, subject: 'Your Request has been created')
  end

  def request_failed(request_id)
    @request = Request.find(request_id)
    @user = @request.user
    mail(to: @user.email, subject: 'Your Request has been failed')
  end

  def request_accepted(request_id)
    @request = Request.find(request_id)
    @user = @request.user
    mail(to: @user.email, subject: 'Your Request has been approved')
  end

  def request_confirmation(request_id)
    @request = Request.find(request_id)
    @user = @request.user
    @book = @request.book
    mail(to: @user.email, subject: 'Confirm your request') do |format|
      format.html { render 'request_confirmation' }
    end
  end
end
