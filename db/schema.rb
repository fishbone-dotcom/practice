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

ActiveRecord::Schema[8.1].define(version: 2026_10_01_103638) do
  create_table "incidents", force: :cascade do |t|
    t.integer "organization_id", null: false
    t.string "title", null: false
    t.string "description", null: false
    t.string "severity", null: false
    t.string "status", null: false
    t.datetime "started_at"
    t.datetime "resolved_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "external_id", null: false
    t.string "external_created_by_id"
    t.index ["external_created_by_id"], name: "index_incidents_on_external_created_by_id"
    t.index ["external_id"], name: "index_incidents_on_external_id", unique: true
    t.index ["organization_id"], name: "index_incidents_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "api_key"
    t.index ["api_key"], name: "index_organizations_on_api_key", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.integer "organization_id", null: false
    t.string "name", null: false
    t.string "email"
    t.string "role", null: false
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "email"], name: "index_users_on_organization_id_and_email", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
  end

  add_foreign_key "incidents", "organizations"
  add_foreign_key "users", "organizations"
end
