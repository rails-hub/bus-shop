class AddSoldDateColumn < ActiveRecord::Migration
  def up
		add_column :buses, :sold_date, :datetime
  end

  def down
  end
end
