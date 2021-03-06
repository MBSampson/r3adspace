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

ActiveRecord::Schema.define(version: 20180406222318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ads", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.integer "category_id"
    t.bigint "user_id"
    t.string "published"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean "sold", default: false
    t.integer "quantity"
    t.string "street"
    t.string "city"
    t.string "state"
    t.integer "zipcode"
    t.index ["category_id"], name: "index_ads_on_category_id"
    t.index ["user_id"], name: "index_ads_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "address"
    t.string "state"
    t.integer "zipcode"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "item_quantity"
    t.boolean "completed", default: false
    t.string "buyer_first_name"
    t.string "buyer_last_name"
    t.float "cost"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "sales", force: :cascade do |t|
    t.string "buyer_first_name"
    t.string "buyer_last_name"
    t.boolean "shipped", default: false
    t.string "ad_title"
    t.float "total_amount"
    t.integer "item_quantity"
    t.string "shipping_street"
    t.string "shipping_city"
    t.string "shipping_state"
    t.integer "shipping_zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.float "price"
    t.string "buyer_email", default: ""
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ads", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "sales", "users"
end
