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

ActiveRecord::Schema[7.1].define(version: 2023_12_30_160131) do
  create_table "fake_set_types", force: :cascade do |t|
    t.string "parent"
    t.string "type_generator"
    t.integer "position"
    t.integer "fake_set_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fake_set_id"], name: "index_fake_set_types_on_fake_set_id"
  end

  create_table "fake_sets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_fake_sets_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "user_agent"
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "types_generators", force: :cascade do |t|
    t.string "name"
    t.text "arguments"
    t.integer "types_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["types_list_id"], name: "index_types_generators_on_types_list_id"
  end

  create_table "types_lists", force: :cascade do |t|
    t.string "parent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "published", default: false
    t.index ["parent"], name: "index_types_lists_on_parent"
  end

# Could not dump table "types_lists_search_idx" because of following StandardError
#   Unknown type '' for column 'parent'

# Could not dump table "types_lists_search_idx_config" because of following StandardError
#   Unknown type '' for column 'k'

  create_table "types_lists_search_idx_data", force: :cascade do |t|
    t.binary "block"
  end

  create_table "types_lists_search_idx_docsize", force: :cascade do |t|
    t.binary "sz"
    t.integer "origin"
  end

# Could not dump table "types_lists_search_idx_idx" because of following StandardError
#   Unknown type '' for column 'segid'

# Could not dump table "types_lists_search_idx_instance" because of following StandardError
#   Unknown type '' for column 'term'

# Could not dump table "types_lists_search_idx_row" because of following StandardError
#   Unknown type '' for column 'term'

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "verified", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "fake_set_types", "fake_sets"
  add_foreign_key "fake_sets", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "types_generators", "types_lists"
end
