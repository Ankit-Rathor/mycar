class BookingMailer < ApplicationMailer
   default from: 'notifications@example.com'

  def new_booking_email(booking)
    @booking = booking
    mail(to: @booking.user.email, subject: 'booking done')
  end
end
