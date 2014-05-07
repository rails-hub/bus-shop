class AddStatusImageColumnInBusesTable < ActiveRecord::Migration
  def up
		add_column :buses, :status_image, :string
  end

  def down
  end
end
