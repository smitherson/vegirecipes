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

ActiveRecord::Schema.define(version: 20140612100751) do

  create_table "products", force: true do |t|
    t.string   "name",                                        null: false
    t.decimal  "protein",            precision: 10, scale: 0, null: false
    t.decimal  "fat",                precision: 10, scale: 0, null: false
    t.decimal  "fiber",              precision: 10, scale: 0, null: false
    t.decimal  "calories",           precision: 10, scale: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "carbs"
  end

  create_table "products_for_recipes", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.text     "instructions",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "name"
    t.time     "prep_time"
    t.integer  "complexity"
  end

end
