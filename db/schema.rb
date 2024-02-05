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

ActiveRecord::Schema[7.1].define(version: 2010_12_18_205008) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contents", force: :cascade do |t|
    t.text "par1"
    t.text "par2"
    t.text "par3"
    t.text "par4"
    t.text "par5"
    t.text "par6"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.string "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean "all_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_events_on_post_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "folios", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.text "description"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer "position"
    t.index ["user_id"], name: "index_folios_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.text "description"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer "position"
    t.string "flv_file_name"
    t.string "flv_content_type"
    t.integer "flv_file_size"
    t.datetime "flv_updated_at"
    t.integer "duration", default: 0
    t.string "resolution"
    t.index ["user_id"], name: "index_movies_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "tag_type"
    t.string "url"
    t.string "photo"
    t.string "title"
    t.text "body"
    t.string "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "recorded_url"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "supports", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "subject"
    t.text "description"
    t.boolean "api", default: false
    t.boolean "seo", default: false
    t.boolean "website", default: false
    t.boolean "mobile", default: false
    t.boolean "games", default: false
    t.boolean "hosting", default: false
    t.boolean "design", default: false
    t.boolean "consulting", default: false
    t.boolean "job", default: false
    t.boolean "other", default: false
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.integer "tagger_id"
    t.string "tagger_type"
    t.string "taggable_type"
    t.string "context"
    t.datetime "created_at"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "posts_count", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "phone"
    t.string "location"
    t.date "dob"
    t.string "email"
    t.string "tag_type"
    t.text "par1"
    t.text "par2"
    t.text "par3"
    t.text "par4"
    t.string "password_digest"
    t.string "password_confirmation"
    t.string "persistence_token"
    t.boolean "is_admin", default: false
    t.integer "posts_count", default: 0
    t.integer "movies_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.string "demo_file_name"
    t.string "demo_content_type"
    t.integer "demo_file_size"
    t.datetime "demo_updated_at"
  end

end
