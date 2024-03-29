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

ActiveRecord::Schema.define(version: 20210921133410) do

  create_table "mylist_stocks", force: :cascade do |t|
    t.integer  "mylist_id"
    t.integer  "stock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mylists", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string   "code"
    t.string   "client_name"
    t.string   "explain"
    t.string   "market"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "trading_views", force: :cascade do |t|
    t.string   "code"
    t.string   "container_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "stock_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.string   "text"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
