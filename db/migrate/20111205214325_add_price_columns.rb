class AddPriceColumns < ActiveRecord::Migration
  def up
		add_column :buses, :wholesale_price, :string
		add_column :buses, :cost, :string
		add_column :buses, :sale_price, :string
		add_column :buses, :price, :string
		add_column :buses, :posted_price, :string
  end

  def down
  end
end
