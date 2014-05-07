class RenameChasisMakeTable < ActiveRecord::Migration
  def up
		rename_table :chasis_make, :chasis_makes
  end

  def down
  end
end
