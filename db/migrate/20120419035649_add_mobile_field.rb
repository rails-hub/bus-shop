class AddMobileField < ActiveRecord::Migration
  def up
     add_column :leads, :mobile, :string
   end
   def down
     remove_column :leads, :mobile
   end
end
