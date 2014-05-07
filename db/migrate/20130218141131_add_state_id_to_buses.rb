class AddStateIdToBuses < ActiveRecord::Migration
  def change
    add_column :buses, :state_id, :integer
  end
end
