class FlightsController < ApplicationController
  FLIGHTS_PER_PAGE = 15
  # GET /flights
  # GET /flights.json
  def index
    @page = params.fetch(:page,0).to_i
    @flights = Flight.all.order(departure_time: :asc).offset(@page*FLIGHTS_PER_PAGE).limit(FLIGHTS_PER_PAGE)
    @airports = Airport.all.pluck(:aptcode,:id)
    @months = Flight.all.map{|f| f.departure_time.month}.uniq!.sort!
    @days = Flight.all.map{|f| f.departure_time.day}.uniq!.sort!
    @available_flights = @flights.where(from_airport_id: params[:from_airport_id])
    .where(to_airport_id: params[:to_airport_id])
    .where(month: params[:month])
    .where(day: params[:day])
  end

 

  private

    
end
