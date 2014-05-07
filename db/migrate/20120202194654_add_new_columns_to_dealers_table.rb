class AddNewColumnsToDealersTable < ActiveRecord::Migration
  def change
    add_column :dealers, :first_name, :string
    add_column :dealers, :last_name, :string
  end
end
