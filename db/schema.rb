# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130412175208) do

  create_table "adds", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "priority"
    t.string   "url"
    t.boolean  "status"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
    t.string   "size"
  end

  create_table "admins", :force => true do |t|
    t.string   "email",                                                :null => false
    t.string   "encrypted_password",     :limit => 128,                :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "body_makes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bus_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "buses", :force => true do |t|
    t.string   "stock_id"
    t.integer  "bus_type_id"
    t.string   "chasis_model"
    t.string   "body_model"
    t.string   "engine"
    t.float    "mileage"
    t.string   "vin"
    t.string   "fuel_type"
    t.integer  "passengers"
    t.string   "vehicle_length"
    t.string   "exterior_color"
    t.string   "interior_color"
    t.string   "luggage",               :limit => 45
    t.string   "wheelchair_lifts",      :limit => 45
    t.string   "warranty",              :limit => 45
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "year"
    t.integer  "chasis_make_id"
    t.string   "transmission"
    t.string   "location"
    t.integer  "body_make_id"
    t.string   "live"
    t.string   "featured"
    t.string   "status"
    t.boolean  "sold"
    t.string   "sold_price"
    t.string   "status_image"
    t.datetime "sold_date"
    t.string   "vehicle_description"
    t.string   "wholesale_price"
    t.string   "cost"
    t.string   "sale_price"
    t.float    "price"
    t.string   "posted_price"
    t.string   "entertainment"
    t.string   "lavatory"
    t.string   "raised_roof"
    t.string   "wheelchair_capacity"
    t.string   "brakes"
    t.string   "created_by"
    t.string   "last_status_change_by"
    t.datetime "status_updated_at"
    t.string   "last_modified_by"
    t.integer  "seller_id"
    t.integer  "page_hit_id"
    t.datetime "deleted_at"
    t.integer  "state_id"
    t.boolean  "rear_luggage"
  end

  create_table "chasis_make", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chasis_makes", :force => true do |t|
    t.string   "name",       :limit => 45, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "mobile"
    t.string   "company"
    t.string   "address"
    t.string   "address_2"
    t.string   "suite"
    t.string   "city"
    t.integer  "state_id"
    t.integer  "country_id"
    t.integer  "postal"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.text   "comments"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dealers", :force => true do |t|
    t.string   "email",                                                :null => false
    t.string   "encrypted_password",     :limit => 128,                :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "logo"
    t.string   "phone"
    t.string   "company_name"
    t.string   "street_address"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "postal_code"
    t.string   "mobile"
    t.string   "company"
    t.string   "address2"
    t.string   "unit"
    t.datetime "deleted_at"
  end

  add_index "dealers", ["email"], :name => "index_dealers_on_email", :unique => true
  add_index "dealers", ["reset_password_token"], :name => "index_dealers_on_reset_password_token", :unique => true

  create_table "images", :force => true do |t|
    t.integer  "bus_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leads", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "comments"
    t.integer  "bus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company"
    t.string   "country"
    t.string   "province"
    t.string   "state"
    t.string   "city"
    t.string   "mobile"
    t.string   "address"
    t.string   "address2"
    t.string   "unit"
    t.string   "postal"
    t.datetime "deleted_at"
  end

  create_table "main_charts", :force => true do |t|
    t.date     "dates"
    t.integer  "pageviews"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manage_views", :force => true do |t|
    t.boolean "stock_id"
    t.boolean "bus_type"
    t.boolean "chasis_model"
    t.boolean "body_model"
    t.boolean "engine"
    t.boolean "mileage"
    t.boolean "vin"
    t.boolean "fuel_type"
    t.boolean "passengers"
    t.boolean "vehicle_length"
    t.boolean "exterior_color"
    t.boolean "interior_color"
    t.boolean "luggage"
    t.boolean "wheelchair_lifts"
    t.boolean "warranty"
    t.boolean "created_at"
    t.boolean "updated_at"
    t.boolean "year"
    t.boolean "chasis_make"
    t.boolean "transmission"
    t.boolean "location"
    t.boolean "body_make"
    t.boolean "live"
    t.boolean "featured"
    t.boolean "status"
    t.boolean "sold"
    t.boolean "sold_price"
    t.boolean "sold_date"
    t.boolean "wholesale_price"
    t.boolean "cost"
    t.boolean "sale_price"
    t.boolean "price"
    t.boolean "posted_price"
    t.boolean "entertainment"
    t.boolean "raised_roof"
    t.boolean "wheelchair_capacity"
    t.boolean "brakes"
  end

  create_table "page_hits", :force => true do |t|
    t.string   "url"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bus_id"
  end

  create_table "permissions", :force => true do |t|
    t.integer  "user_id"
    t.string   "permission"
    t.boolean  "add_inventory"
    t.boolean  "edit_inventroy"
    t.boolean  "dealor_add"
    t.boolean  "dealor_edit"
    t.boolean  "lead_add"
    t.boolean  "lead_edit"
    t.boolean  "ad_add"
    t.boolean  "ad_edit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ability_delete"
  end

  create_table "sellers", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "comments"
    t.string   "postal_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.string   "province"
    t.string   "city"
    t.string   "company_name"
    t.string   "country"
  end

  create_table "settings", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "setting_type"
    t.string   "value"
  end

  create_table "states", :force => true do |t|
    t.integer  "country_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statistics", :force => true do |t|
    t.date     "date"
    t.integer  "url_id"
    t.integer  "pageviews"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stats", :force => true do |t|
    t.string   "bus_id"
    t.integer  "visits"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                                :null => false
    t.string   "encrypted_password",     :limit => 128,                :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "deleted_at"
  end

end
