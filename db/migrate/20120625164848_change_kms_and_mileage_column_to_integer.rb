class ChangeKmsAndMileageColumnToInteger < ActiveRecord::Migration
  def up
  	change_column :buses, :mileage, :double
  	change_column :buses, :price, :double
  end

  def down
  	change_column :buses, :mileage, :string
  	change_column :buses, :cost, :string
  end
end
