class AddColumnBusIdToPageHits < ActiveRecord::Migration
  def up
    add_column :page_hits, :bus_id, :integer
  end
  def down
    remove_column :page_hits, :bus_id
  end
end
