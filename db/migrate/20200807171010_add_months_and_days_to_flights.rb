class AddMonthsAndDaysToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :month, :integer 
    add_column :flights, :day,   :integer 

  end
end
