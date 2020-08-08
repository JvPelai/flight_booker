# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.fir




  

Passenger.delete_all
Booking.delete_all
Flight.delete_all
Airport.delete_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

airports = {'SFO' => 'San Francisco', 'NYC' => 'New York', 'STL'=> 'Seattle',
   'AST'=> 'Austin','CGO' => 'Chigago', 'LAS' => 'Los Angeles', 'HKG'=> 'Hong Kong',
  'WDC' => 'Washington D.C', 'TKO' => 'Tokyo', 'SYD' => 'Sydney', 'SPO' => 'São Paulo',
'RJO' => 'Rio de Janeiro', 'BLM' => 'Berlim', 'LSB' => 'Lisboa', 'LDN' => 'London'}

airports.each do |code, location|
  Airport.create(aptcode: code, location: location)
end

6.times do
  i = airports.length
  while i > 1 do
    Flight.create(from_airport_id: i,to_airport_id: i-1, departure_time: Time.now + rand(100000..100000000), duration: rand(2..14))
    i-=1 
  end
  Flight.create(from_airport_id: i,to_airport_id: airports.length, departure_time: Time.now + rand(100000..100000000), duration: rand(2..14))

  2000.times do
    Flight.create(from_airport_id: rand(airports.length),to_airport_id: rand(airports.length), departure_time: Time.now + rand(100000..100000000), duration: rand(2..14))
  end
end

Flight.all.map do |f|
  f.month = f.departure_time.month
  f.day = f.departure_time.day
  f.year = f.departure_time.year 
  f.save 
end
