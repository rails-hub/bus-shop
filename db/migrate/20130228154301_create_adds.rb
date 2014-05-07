class CreateAdds < ActiveRecord::Migration
  def change
    create_table :adds do |t|
      t.string :name
      t.string :image
      t.integer :priority
      t.string :url
      t.boolean :status
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
