class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: :Airport 
  belongs_to :to_airport, class_name: :Airport
  has_many :bookings
  has_many :passengers, through: :bookings  
  scope :search_month, ->(m) { where("cast(strftime('%m', departure_time) as int) = ?", m) }
  scope :search_day,   ->(d) { where("cast(strftime('%d', departure_time) as int) = ?", d) }

  def flight_date_formatted
    departure_time.strftime("%m/%d/%Y")
  end

end
