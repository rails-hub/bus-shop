class AddPageHitColumnToBuses < ActiveRecord::Migration
  def up
    add_column :buses, :page_hit_id, :integer
  end
  def down
     remove_column :buses, :page_hit_id
  end
end
