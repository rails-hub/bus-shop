class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :mobile
      t.string :company
      t.string :address
      t.string :address_2
      t.string :suite
      t.string :city
      t.integer :state_id
      t.integer :country_id
      t.integer :postal
      t.text :comments

      t.timestamps
    end
  end
end
