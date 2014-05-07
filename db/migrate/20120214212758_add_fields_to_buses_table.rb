class AddFieldsToBusesTable < ActiveRecord::Migration
  def up
		add_column :buses, :created_by, :string
		add_column :buses, :last_status_change_by, :string
		add_column :buses, :status_updated_at, :datetime
		add_column :buses, :last_modified_by, :string
  end

  def down
  end
end
