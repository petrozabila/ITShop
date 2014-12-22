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

ActiveRecord::Schema.define(version: 20141221090421) do

  create_table "orders", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_rubrics", force: true do |t|
    t.integer  "product_id"
    t.integer  "rubric_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "product_rubrics", ["product_id"], name: "index_product_rubrics_on_product_id"
  add_index "product_rubrics", ["rubric_id"], name: "index_product_rubrics_on_rubric_id"

  create_table "products", force: true do |t|
    t.string   "title"
    t.decimal  "price",       precision: 8, scale: 2, default: 0.0
    t.text     "description"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rubrics", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "product_rubrics", "products"
  add_foreign_key "product_rubrics", "rubrics"

end
