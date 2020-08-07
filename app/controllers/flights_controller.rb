class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  # GET /flights
  # GET /flights.json
  def index
    @flights = Flight.all
    @airports = Airport.all.pluck(:aptcode,:id)
    @months = Flight.all.map{|f| f.departure_time.month}.uniq!
    @days = Flight.all.map{|f| f.departure_time.day}.uniq!
  end

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      params.require(:flight).permit(:from_airport,:to_airport,:month,:day)
    end
end
