class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string   :name
      t.string   :email
      t.references :booking, index: true
      t.timestamps
    end
    add_foreign_key :passengers, :bookings, column: :booking_id
  end
end
