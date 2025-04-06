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

ActiveRecord::Schema[7.2].define(version: 2025_04_06_174848) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beatboxers", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "country", null: false
    t.string "style", null: false
    t.string "achievements"
    t.integer "sex", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.bigint "user_id"
    t.index ["user_id"], name: "index_beatboxers_on_user_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "beatboxer_id"
    t.index ["beatboxer_id"], name: "index_bookmarks_on_beatboxer_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "beatboxer_id"
    t.index ["beatboxer_id"], name: "index_comments_on_beatboxer_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", null: false
    t.string "youtube_video"
    t.string "body", null: false
    t.bigint "user_id"
    t.bigint "beatboxer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beatboxer_id"], name: "index_posts_on_beatboxer_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "beatboxers", "users"
  add_foreign_key "bookmarks", "beatboxers"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "comments", "beatboxers"
  add_foreign_key "comments", "users"
  add_foreign_key "posts", "beatboxers"
  add_foreign_key "posts", "users"
end
