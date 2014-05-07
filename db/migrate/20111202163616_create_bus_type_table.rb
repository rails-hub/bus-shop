class CreateBusTypeTable < ActiveRecord::Migration
  def up
		create_table :bus_types, :force => true do |t|
		    t.string :name
		    t.timestamps
		  end
  end

  def down
    drop_table :bus_types
  end
end
