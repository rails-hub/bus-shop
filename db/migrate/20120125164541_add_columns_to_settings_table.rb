class AddColumnsToSettingsTable < ActiveRecord::Migration
  def change
    add_column :settings, :setting_type, :string
    add_column :settings, :value, :string
  end
end
