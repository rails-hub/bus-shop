class AddColumnAbilityDeleteToPermission < ActiveRecord::Migration
  def change
    add_column :permissions, :ability_delete, :boolean
  end
end
