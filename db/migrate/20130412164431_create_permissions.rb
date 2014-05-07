class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :user_id
      t.string :permission
      t.boolean :add_inventory
      t.boolean :edit_inventroy
      t.boolean :dealor_add
      t.boolean :dealor_edit
      t.boolean :lead_add
      t.boolean :lead_edit
      t.boolean :ad_add
      t.boolean :ad_edit

      t.timestamps
    end
  end
end
