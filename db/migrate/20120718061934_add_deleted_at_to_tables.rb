class AddDeletedAtToTables < ActiveRecord::Migration
  def up
  	add_column :buses ,   :deleted_at, :datetime
  	add_column :leads , 	:deleted_at, :datetime
  	add_column :dealers , :deleted_at, :datetime
  	add_column :users , 	:deleted_at, :datetime
  	# add_column : , :deleted_at, :datetime
  end

  def down
  	remove_column :buses,    :deleted_at
  	remove_column :leads , 	 :deleted_at
  	remove_column :dealers , :deleted_at
  	remove_column :users , 	 :deleted_at
  	# remove_column : , 		 :deleted_at
  end
end
