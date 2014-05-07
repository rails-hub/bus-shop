class AddYearColumnToBusTable < ActiveRecord::Migration
  def change
		add_column :buses, :year, :string
  end
end
