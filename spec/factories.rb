#Factory.define :bus do |b|
#  b.sequence(:stock_id)     {|n| "MA6789#{n}" }
#  b.sequence(:body_model)   {|n| "Marathon 104#{n} 45ft XLV11"}
#  b.bus_type_id             "2"
#  b.year                    "2010"
#  b.chasis_make_id          "3"
#  b.sequence(:chasis_model) {|n| "E45#{n}"}
#  b.fuel_type               "Gas"
#  b.mileage                 "450000"
#  b.passengers              "45"
#  b.status                  "new"
#  b.vin                     "MGF8678V"
#  b.sold                    "1"
#  b.sold_price              "21312"
#  b.live                    "yes"
#  b.featured                "yes"
#  b.interior_color          "red"
#  b.exterior_color          "black"
#end