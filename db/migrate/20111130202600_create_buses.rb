class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string      :stock_id
      t.references  :bus_type
      t.string      :chasis_model
      t.string      :body_model
      t.string      :engine
      t.string      :mileage
      t.string      :vin
      t.string      :fuel_type
      t.integer     :passengers
      t.string      :vehice_length
      t.string      :exterior_color
      t.string      :interior_color
      t.boolean     :luggage
      t.boolean     :wheelchair_lifts
      t.boolean     :warranty
      t.timestamps
    end
  end
end
