ActiveRecord::Schema.define(version: 2020_11_11_170618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "students", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "course", null: false
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

end
