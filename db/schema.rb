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

ActiveRecord::Schema.define(version: 2023_05_08_105215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auth_sessions", primary_key: "uid", id: :string, force: :cascade do |t|
    t.string "user_uid", null: false
    t.string "token", null: false
    t.datetime "last_accessed_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["token"], name: "index_auth_sessions_on_token", unique: true
  end

  create_table "posts", primary_key: "uid", id: :string, force: :cascade do |t|
    t.string "user_uid", null: false
    t.string "title", null: false
    t.string "message", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", primary_key: "uid", id: :string, force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "auth_sessions", "users", column: "user_uid", primary_key: "uid", on_update: :cascade, on_delete: :cascade
  add_foreign_key "posts", "users", column: "user_uid", primary_key: "uid", on_update: :cascade, on_delete: :cascade
end
