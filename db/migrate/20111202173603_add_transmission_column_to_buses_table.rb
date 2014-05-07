class AddTransmissionColumnToBusesTable < ActiveRecord::Migration
  def change
		add_column :buses, :transmission, :string
		add_column :buses, :location, :string
  end
end
