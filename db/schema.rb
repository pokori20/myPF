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

ActiveRecord::Schema.define(version: 2022_02_08_080959) do

  create_table "admins", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "employee_id", default: "", null: false
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "offs", force: :cascade do |t|
    t.integer "public_id"
    t.integer "shop_id"
    t.integer "submit_off_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publics", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "employee_id", default: "", null: false
    t.string "name", default: "", null: false
    t.integer "shop_id"
    t.boolean "is_working", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_publics_on_reset_password_token", unique: true
  end

  create_table "shifts", force: :cascade do |t|
    t.integer "shop_id"
    t.string "image_id"
    t.string "year_month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "shop_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submit_offs", force: :cascade do |t|
    t.integer "public_id"
    t.integer "shop_id"
    t.string "year_month"
    t.string "remarks"
    t.date "submited_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
