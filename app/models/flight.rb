class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: :Airport 
  belongs_to :to_airport, class_name: :Airport

  scope :search_month, -> (m) {where("cast(strftime('%m', departure_time) as int) = ?", m) }


  def flight_date_formatted
    departure_time.strftime("%m/%d/%Y")
  end

end
