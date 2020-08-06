class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.references      :from_airport, index: true
      t.references      :to_airport, index: true 
      t.datetime        :departure_time
      t.integer         :duration
      t.timestamps
    end
    add_foreign_key :flights, :airports, column: :from_airport_id
    add_foreign_key :flights, :airports, column: :to_airport_id 
  end
end
