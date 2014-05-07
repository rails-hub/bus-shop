class AddSomeColsToBusesTable < ActiveRecord::Migration
  def change
		add_column :buses, :entertainment, :string
		add_column :buses, :lavatory, :string
		add_column :buses, :raised_roof, :string
		add_column :buses, :wheelchair_capacity, :string
		add_column :buses, :brakes, :string
  end
end
