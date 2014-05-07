class AddColumnsToBusTable < ActiveRecord::Migration
  def change
		add_column :buses, :live, :string
		add_column :buses, :featured, :string
		add_column :buses, :status, :string
		add_column :buses, :sold, :boolean
  end
end
