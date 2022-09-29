# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_28_094617) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "complaints", force: :cascade do |t|
    t.text "body"
    t.string "subject"
    t.string "complainant_type"
    t.bigint "complainant_id"
    t.string "responder_type"
    t.bigint "responder_id"
    t.string "status", default: "pending"
    t.string "city"
    t.string "barangay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["complainant_type", "complainant_id"], name: "index_complaints_on_complainant"
    t.index ["responder_type", "responder_id"], name: "index_complaints_on_responder"
  end

  create_table "locations", force: :cascade do |t|
    t.string "barangay"
    t.string "city"
    t.string "responder_type"
    t.bigint "responder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["responder_type", "responder_id"], name: "index_locations_on_responder"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "type"
    t.string "contact_number"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
