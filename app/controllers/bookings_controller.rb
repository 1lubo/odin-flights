# frozen_string_literal: true

class BookingsController < ApplicationController
  def new
    if params[:tickets].blank?
      flash[:danger] = 'You must select the number of passengers in your search
      in order to book a flight.'
      redirect_to root_url
    else
      @booking = Booking.new
      params[:tickets].to_i.times { @booking.passengers.build }
      @flight = Flight.find(params[:flight_id])
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking
      flash[:success] = 'Booking was created successfully.'
    else
      flash[:danger] = @booking.errors.full_messages
      # flash[:warning] = "Failed to create Booking: #{@booking.collect_errors}"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email _destroy])
  end
end
