class AddSlugColumnToBusTypesTable < ActiveRecord::Migration
  def change
		add_column :bus_types, :slug, :string
  end
end
