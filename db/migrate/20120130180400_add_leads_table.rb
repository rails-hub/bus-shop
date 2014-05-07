class AddLeadsTable < ActiveRecord::Migration
  def up
		create_table :leads, :force => true do |t|
		    t.string :first_name
		    t.string :last_name
		    t.string :email
		    t.string :phone
		    t.string :comments
		    t.references :bus_id
		    t.timestamps
		  end
  end

  def down
    drop_table :leads
  end
end
