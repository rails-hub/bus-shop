class CreateManageViews < ActiveRecord::Migration
  def up
      create_table :manage_views do |t|
        t.boolean :stock_id
        t.boolean :bus_type
        t.boolean :chasis_model
        t.boolean :body_model
        t.boolean :engine
        t.boolean :mileage
        t.boolean :vin
        t.boolean :fuel_type
        t.boolean :passengers
        t.boolean :vehicle_length
        t.boolean :exterior_color
        t.boolean :interior_color
        t.boolean :luggage
        t.boolean :wheelchair_lifts
        t.boolean :warranty
        t.boolean :created_at
        t.boolean :updated_at
        t.boolean :year
        t.boolean :chasis_make
        t.boolean :transmission
        t.boolean :location
        t.boolean :body_make
        t.boolean :live
        t.boolean :featured
        t.boolean :status
        t.boolean :sold
        t.boolean :sold_price
        t.boolean :sold_date
        t.boolean :wholesale_price
        t.boolean :cost
        t.boolean :sale_price
        t.boolean :price
        t.boolean :posted_price
        t.boolean :entertainment
        t.boolean :raised_roof
        t.boolean :wheelchair_capacity
        t.boolean :brakes
        t.timestamps
    end
  end

  def down
  end
end
