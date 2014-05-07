class AddContactModel < ActiveRecord::Migration
  def up
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :comments
    end
  end

  def down
    drop_table :contacts
  end
end
