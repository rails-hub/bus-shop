class AddAddressFieldsToToLeads < ActiveRecord::Migration
  def up
    add_column :leads, :address, :string
    add_column :leads, :address2, :string
    add_column :leads, :unit, :string
    add_column :leads, :postal, :string
  end
  def down
    remove_column :leads, :address
    remove_column :leads, :address2
    remove_column :leads, :unit
    remove_column :leads, :postal
  end 
end


