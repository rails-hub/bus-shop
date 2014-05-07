class AddColumnSoldPriceMigration < ActiveRecord::Migration
  def up
		add_column :buses, :sold_price, :string
  end

  def down
  end
end
