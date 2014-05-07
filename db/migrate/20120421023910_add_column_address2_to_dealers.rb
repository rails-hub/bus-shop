class AddColumnAddress2ToDealers < ActiveRecord::Migration
  def up
    add_column :dealers, :address2, :string
    add_column :dealers, :unit, :string
  end
  def down
    remove_column :dealers, :address2
    remove_column :dealers, :unit
  end
end
