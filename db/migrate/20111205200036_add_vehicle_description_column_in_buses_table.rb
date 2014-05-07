class AddVehicleDescriptionColumnInBusesTable < ActiveRecord::Migration
  def up
		add_column :buses, :vehicle_description, :string
  end

  def down
  end
end
