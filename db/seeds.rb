# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.fir

airports = ['SFO', 'NYC', 'STL', 'AST','CGO']

airports.each do |code|
  Airport.create(aptcode: code)
end

i = airports.length
while i > 1 do
  Flight.create(from_airport_id: i,to_airport_id: i-1, departure_time: Time.now.strftime("%m/%d/%Y/%H"),duration: rand(2..8))
  i-=1 
end
Flight.create(from_airport_id: 1,to_airport_id: 5, departure_time: Time.now.strftime("%m/%d/%Y/%H"),duration: rand(2..8))