class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.string  :bus_id
      t.integer :visits
      t.date    :date
      t.timestamps
    end
  end
end
