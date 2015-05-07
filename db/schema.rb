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

ActiveRecord::Schema.define(version: 20140602075357) do

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classifications", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "weight"
  end

  create_table "contents", force: true do |t|
    t.integer  "variants_id"
    t.integer  "idd"
    t.integer  "dough"
    t.integer  "size"
    t.integer  "sauce"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coordinates", force: true do |t|
    t.integer  "pizzeria_id"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coordinates", ["pizzeria_id"], name: "index_coordinates_on_pizzeria_id"

  create_table "doughs", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.string   "product_r_keeper"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rkeeper"
    t.boolean  "pizza"
    t.boolean  "executed"
    t.integer  "quantity"
    t.integer  "has_modifier"
  end

  create_table "locations", force: true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pizzas", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price1"
    t.float    "price2"
    t.float    "price3"
    t.string   "view_products_file_name"
    t.string   "view_products_content_type"
    t.integer  "view_products_file_size"
    t.datetime "view_products_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rkeeper1"
    t.string   "rkeeper2"
    t.string   "rkeeper3"
    t.string   "rkeeper4"
    t.string   "rkeeper5"
    t.string   "rkeeper6"
    t.string   "rkeeper7"
    t.string   "rkeeper8"
    t.string   "rkeeper9"
    t.string   "rkeeper10"
    t.string   "rkeeper11"
    t.string   "rkeeper12"
    t.integer  "classification_id"
    t.boolean  "modal_help"
    t.boolean  "sets"
  end

  add_index "pizzas", ["classification_id"], name: "index_pizzas_on_classification_id"

  create_table "pizzeria", force: true do |t|
    t.string   "name"
    t.boolean  "work"
    t.string   "email"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "redirect"
    t.string   "redirect_email"
    t.string   "waiting_time"
  end

  create_table "prices", force: true do |t|
    t.float    "price"
    t.integer  "size_id"
    t.integer  "pizza_id"
    t.integer  "products_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prices", ["pizza_id"], name: "index_prices_on_pizza_id"
  add_index "prices", ["products_id"], name: "index_prices_on_products_id"
  add_index "prices", ["size_id"], name: "index_prices_on_size_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.text     "description"
    t.string   "short_description"
    t.integer  "how_many"
    t.string   "name1"
    t.float    "price1"
    t.string   "name2"
    t.float    "price2"
    t.string   "name3"
    t.float    "price3"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "view_products_file_name"
    t.string   "view_products_content_type"
    t.integer  "view_products_file_size"
    t.datetime "view_products_updated_at"
    t.string   "rkeeper1"
    t.string   "rkeeper2"
    t.string   "rkeeper3"
    t.boolean  "modal_help"
    t.boolean  "has_modifiers"
    t.boolean  "modifier"
    t.integer  "modifier_id"
    t.boolean  "set"
    t.integer  "weight"
  end

  create_table "rkeepers", force: true do |t|
    t.string   "code"
    t.integer  "size_id"
    t.integer  "dough_id"
    t.integer  "sauce_id"
    t.integer  "pizza_id"
    t.integer  "products_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rkeepers", ["dough_id"], name: "index_rkeepers_on_dough_id"
  add_index "rkeepers", ["pizza_id"], name: "index_rkeepers_on_pizza_id"
  add_index "rkeepers", ["products_id"], name: "index_rkeepers_on_products_id"
  add_index "rkeepers", ["sauce_id"], name: "index_rkeepers_on_sauce_id"
  add_index "rkeepers", ["size_id"], name: "index_rkeepers_on_size_id"

  create_table "sauces", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sendforms", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "delayed"
    t.string   "town"
    t.string   "street"
    t.string   "house"
    t.string   "housing"
    t.string   "apartment"
    t.text     "description"
  end

  create_table "sizes", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pizzeria_id"
    t.boolean  "admin"
    t.boolean  "manager"
  end

  add_index "users", ["pizzeria_id"], name: "index_users_on_pizzeria_id"

  create_table "variants", force: true do |t|
    t.boolean  "pizza"
    t.integer  "products_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
