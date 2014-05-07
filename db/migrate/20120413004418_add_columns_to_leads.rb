class AddColumnsToLeads < ActiveRecord::Migration
  def up
    add_column :leads, :company, :string
    add_column :leads, :country, :string
    add_column :leads, :province, :string 
    add_column :leads, :state, :string
    add_column :leads, :city, :string
  end
  def down
    remove_column :leads, :company
    remove_column :leads, :country
    remove_column :leads, :province
    remove_column :leads, :state
    remove_column :leads, :city
  end
end
