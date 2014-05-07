class CreateBodyMakes < ActiveRecord::Migration
  def change
    create_table :body_makes do |t|
      t.string    :name
      t.timestamps
    end
  end
end
