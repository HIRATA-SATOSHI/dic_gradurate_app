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

ActiveRecord::Schema.define(version: 2020_12_05_150131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forms", force: :cascade do |t|
    t.string "number", null: false
    t.string "name", null: false
    t.date "application_date", null: false
    t.integer "classification", null: false
    t.date "month", null: false
    t.date "f_month", null: false
    t.integer "reason", null: false
    t.text "comment"
    t.text "processed_staff"
    t.boolean "cancel", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "staffs_id"
    t.index ["staffs_id"], name: "index_forms_on_staffs_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "department"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

  create_table "students", force: :cascade do |t|
    t.integer "number", null: false
    t.string "name", default: "", null: false
    t.integer "course", null: false
    t.integer "enrollment_status", null: false
    t.integer "site", null: false
    t.integer "school_year"
    t.string "parent_name", null: false
    t.string "phone_number"
    t.string "email_address", null: false
    t.text "live_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "forms", "staffs", column: "staffs_id"
end
