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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140810193639) do

  create_table "line_items", force: true do |t|
    t.integer  "item_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

  add_index "line_items", ["item_id"], name: "index_line_items_on_item_id"
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id"

  create_table "orders", force: true do |t|
    t.integer  "buyer_id"
    t.boolean  "closed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["buyer_id"], name: "index_orders_on_buyer_id"

  create_table "product_tags", force: true do |t|
    t.integer  "product_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "title",         default: ""
    t.integer  "price_cents",   default: 0
    t.text     "description",   default: ""
    t.integer  "seller_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",      default: 0
    t.string   "product_image"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.boolean  "vendor",     default: false
    t.string   "address"
    t.string   "phone",      default: ""
<<<<<<< HEAD
    t.string   "country",    default: ""
    t.string   "zip",        default: ""
    t.string   "city",       default: ""
    t.string   "state",      default: ""
=======
    t.string   "country"
    t.string   "zip"
    t.string   "city",       default: ""
    t.string   "state"
>>>>>>> f5d8d48dc3f7d9502ed47d0f71b71d59cf260264
  end

end
