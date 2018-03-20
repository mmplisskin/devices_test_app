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

ActiveRecord::Schema.define(version: 20180320175610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devices", force: :cascade do |t|
    t.string "user_agent", null: false
    t.string "language", null: false
    t.integer "screen_height", null: false
    t.integer "screen_width", null: false
    t.string "time_zone", null: false
    t.boolean "local_storage", null: false
    t.boolean "session_storage", null: false
    t.boolean "cookies", null: false
    t.boolean "indexed_db", null: false
    t.string "uuid_fingerprint", null: false
    t.string "platform", null: false
    t.boolean "mobile", null: false
    t.jsonb "touch_support", default: "{}"
    t.string "app_bundle_id"
    t.string "app_version"
    t.string "model"
    t.string "plugins", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid_fingerprint"], name: "index_devices_on_uuid_fingerprint", unique: true
  end

end
