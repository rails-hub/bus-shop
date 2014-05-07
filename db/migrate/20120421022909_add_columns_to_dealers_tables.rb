class AddColumnsToDealersTables < ActiveRecord::Migration
  def up
    add_column :dealers, :mobile, :string
    add_column :dealers, :company, :string
  end
  def down
    remove_column :dealers, :mobile
    remove_column :dealers, :company
  end
  
end
