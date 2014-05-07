class AddColumnClientIdToAdds < ActiveRecord::Migration
  def change
    add_column :adds, :client_id, :integer
  end
end
