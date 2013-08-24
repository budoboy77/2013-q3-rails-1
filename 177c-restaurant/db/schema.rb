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

ActiveRecord::Schema.define(:version => 20130824194927) do

  create_table "entrees", :force => true do |t|
    t.string  "name"
    t.decimal "price"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "entree_id"
    t.integer  "order_id"
    t.integer  "chair"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
    t.decimal  "line_price"
  end

  create_table "orders", :force => true do |t|
    t.integer  "table_id"
    t.boolean  "has_paid"
    t.decimal  "total_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tables", :force => true do |t|
    t.integer "number_of_chairs"
  end

end
