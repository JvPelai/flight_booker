class PassengerMailer < ApplicationMailer
  default from: 'odin_airlines@flightbooker.com'

  def thank_you_email
    @passenger = params[:passenger]
    mail(to: @passenger.email, subject: 'Thank you for flying with odin airlines!')
  end
end
