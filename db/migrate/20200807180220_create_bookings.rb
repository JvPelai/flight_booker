class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references  :flight, index: true
      t.integer     :num_passengers  
      t.timestamps
    end
    add_foreign_key :bookings, :flights, column: :flight_id
  end
end
