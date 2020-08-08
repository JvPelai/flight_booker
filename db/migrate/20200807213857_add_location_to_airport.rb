class AddLocationToAirport < ActiveRecord::Migration[5.2]
  def change
    add_column :airports, :location, :string
    add_column :flights,  :year, :integer
  end
end
