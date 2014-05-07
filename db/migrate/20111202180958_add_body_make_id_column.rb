class AddBodyMakeIdColumn < ActiveRecord::Migration
  def up
		add_column :buses, :body_make_id, :integer
  end

  def down
  end
end
