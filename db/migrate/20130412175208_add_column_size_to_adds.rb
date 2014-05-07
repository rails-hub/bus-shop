class AddColumnSizeToAdds < ActiveRecord::Migration
  def change
    add_column :adds, :size, :string
  end
end
