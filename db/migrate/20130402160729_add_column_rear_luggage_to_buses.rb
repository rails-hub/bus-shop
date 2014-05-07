class AddColumnRearLuggageToBuses < ActiveRecord::Migration
  def change
    add_column :buses, :rear_luggage, :boolean
  end
end
