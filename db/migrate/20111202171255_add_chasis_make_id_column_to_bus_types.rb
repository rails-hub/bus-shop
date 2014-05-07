class AddChasisMakeIdColumnToBusTypes < ActiveRecord::Migration
  def change
		add_column :buses, :chasis_make_id, :integer
  end
end
