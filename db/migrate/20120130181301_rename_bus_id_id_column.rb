class RenameBusIdIdColumn < ActiveRecord::Migration
  def up
		rename_column :leads, :bus_id_id, :bus_id
  end

  def down
    rename_column :leads, :bus_id, :bus_id_id
  end
end
