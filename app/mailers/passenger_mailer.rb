# frozen_string_literal: true

class PassengerMailer < ApplicationMailer
  default from: 'OdinAir@booking.com'

  def confirmation_email
    # puts "\n PRINTING PARAMS \n"
    # puts params
    @passenger = Passenger.find(params[:passenger].id)
    puts "\n PRINTING Passenger \n"
    puts @passenger.email
    @booking = @passenger.bookings.last
    puts "\n PRINTING Booking \n"
    puts @booking
    @flight = @booking.flight
    @url = 'https://localhost:3000/bookings/'
    mail(to: @passenger.email, subject: 'Booking Confirmation')
  end
end
