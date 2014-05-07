class RenameVehiceLengthColumn < ActiveRecord::Migration
  def up
		rename_column :buses, :vehice_length, :vehicle_length
  end

  def down
  end
end
