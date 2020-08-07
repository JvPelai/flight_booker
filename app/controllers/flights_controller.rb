class FlightsController < ApplicationController

  # GET /flights
  # GET /flights.json
  def index
    @flights = Flight.all
    @airports = Airport.all.pluck(:aptcode,:id)
    @months = Flight.all.map{|f| f.departure_time.month}.uniq!
    @days = Flight.all.map{|f| f.departure_time.day}.uniq!
    @available_flights = @flights.where(from_airport_id: params[:from_airport_id])
    .where(to_airport_id: params[:to_airport_id])
    .where(month: params[:month])
    .where(day: params[:day])
  end

 

  private

    
end
