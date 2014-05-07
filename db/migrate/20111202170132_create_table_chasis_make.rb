class CreateTableChasisMake < ActiveRecord::Migration
  def up
		create_table :chasis_make, :force => true do |t|
		    t.string :name
		    t.timestamps
		  end
  end

  def down
    drop_table :chasis_make
  end
end
