class CreateMainCharts < ActiveRecord::Migration
  def change
    create_table :main_charts do |t|
      t.date :dates
      t.integer :pageviews
      t.timestamps
    end
  end
end
