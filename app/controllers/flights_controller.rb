# frozen_string_literal: true

class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |a| [a.name, a.id] }

    @start = Flight.distinct.pluck(:start).sort
    @start.map! { |s| s.strftime('%b %d %Y') }

    if params[:start].present? && params[:departure_airport_id].present? &&
       params[:arrival_airport_id].present?
      @available_flights = Flight.where(start: params[:start]).where(departure_airport_id: params[:departure_airport_id]).where(arrival_airport_id: params[:arrival_airport_id])
    elsif params[:start].present? && params[:departure_airport_id].present?
      @available_flights = Flight.where(start: params[:start]).where(departure_airport_id: params[:departure_airport_id])
    elsif params[:start].present? && params[:arrival_airport_id].present?
      @available_flights = Flight.where(start: params[:start]).where(arrival_airport_id: params[:arrival_airport_id])
    elsif params[:departure_airport_id].present? && params[:arrival_airport_id].present?
      @available_flights = Flight.where(departure_airport_id: params[:departure_airport_id]).where(arrival_airport_id: params[:arrival_airport_id])
    elsif params[:start].present? && !params[:departure_airport_id].present? &&
          !params[:arrival_airport_id].present?
      @available_flights = Flight.where(start: params[:start])
    elsif !params[:start].present? && params[:departure_airport_id].present? &&
          !params[:arrival_airport_id].present?
      @available_flights = Flight.where(departure_airport_id: params[:departure_airport_id])
    elsif !params[:start].present? && !params[:departure_airport_id].present? &&
          params[:arrival_airport_id].present?
      @available_flights = Flight.where(arrival_airport_id: params[:arrival_airport_id])
    elsif !params[:start].present? && !params[:departure_airport_id].present? &&
          !params[:arrival_airport_id].present?
      @available_flights = nil

    else
      @available_flights = []
    end
    if !@available_flights.nil? && @available_flights.empty?
      flash[:warning] = 'No flights for this selection.'
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:start, :duration, :arrival_airport_id,
                                   :departure_airport_id)
  end
end
