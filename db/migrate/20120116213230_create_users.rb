class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.database_authenticatable
      t.confirmable
      t.recoverable
      t.trackable
      t.timestamps
      t.string :first_name
      t.string :last_name
    end
  end
end
