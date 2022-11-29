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

ActiveRecord::Schema[7.0].define(version: 2022_11_29_130534) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.string "name"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.integer "duration_in_h"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "journey_accommodations", force: :cascade do |t|
    t.bigint "accommodation_id", null: false
    t.bigint "journey_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_journey_accommodations_on_accommodation_id"
    t.index ["journey_id"], name: "index_journey_accommodations_on_journey_id"
  end

  create_table "journey_dates", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.boolean "selected?", default: false
    t.bigint "journey_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journey_id"], name: "index_journey_dates_on_journey_id"
  end

  create_table "journey_locations", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "journey_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journey_id"], name: "index_journey_locations_on_journey_id"
    t.index ["location_id"], name: "index_journey_locations_on_location_id"
  end

  create_table "journey_members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "budget"
    t.bigint "journey_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journey_id"], name: "index_journey_members_on_journey_id"
    t.index ["user_id"], name: "index_journey_members_on_user_id"
  end

  create_table "journeys", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_journeys_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "zip_code"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "journey_accommodations", "accommodations"
  add_foreign_key "journey_accommodations", "journeys"
  add_foreign_key "journey_dates", "journeys"
  add_foreign_key "journey_locations", "journeys"
  add_foreign_key "journey_locations", "locations"
  add_foreign_key "journey_members", "journeys"
  add_foreign_key "journey_members", "users"
  add_foreign_key "journeys", "users"
end
