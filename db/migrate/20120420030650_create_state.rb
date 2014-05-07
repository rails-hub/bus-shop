class CreateState < ActiveRecord::Migration
  def up
    create_table :states do |t|
          t.integer :country_id
          t.string :name
          t.timestamps
    end
  end

  def down
  end
end
