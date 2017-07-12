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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170626075713) do

  create_table "routes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "from"
    t.string "from_countrycode"
    t.string "to"
    t.string "to_countrycode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rou_type"
  end

  create_table "segments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "from"
    t.string "from_lat"
    t.string "from_lng"
    t.string "to"
    t.string "to_lat"
    t.string "to_lng"
    t.string "distance"
    t.string "time"
    t.string "veh_type"
    t.integer "price"
    t.integer "min"
    t.integer "max"
    t.integer "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "from"
    t.string "from_lat"
    t.string "from_lng"
    t.string "to"
    t.string "to_lat"
    t.string "to_lng"
    t.string "distance"
    t.string "time"
    t.integer "price"
    t.integer "min_price"
    t.integer "max_price"
    t.integer "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todoroutes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "from"
    t.string "to"
    t.integer "rou_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rou_type"
  end

end
