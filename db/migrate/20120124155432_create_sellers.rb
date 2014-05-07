class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :comments
      t.string :postal_code
      t.integer :bus_id
      t.timestamps
    end
  end
end
