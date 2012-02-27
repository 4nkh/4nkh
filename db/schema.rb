# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101218205005) do

  create_table "folios", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "position"
  end

  create_table "movies", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "position"
    t.string   "flv_file_name"
    t.string   "flv_content_type"
    t.integer  "flv_file_size"
    t.datetime "flv_updated_at"
    t.integer  "duration",             :default => 0
    t.string   "resolution"
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.string   "tag_type"
    t.string   "url"
    t.string   "photo"
    t.string   "title"
    t.text     "body"
    t.string   "model"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string  "name"
    t.integer "posts_count", :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "phone"
    t.string   "location"
    t.date     "dob"
    t.string   "email"
    t.string   "tag_type"
    t.text     "par1"
    t.text     "par2"
    t.text     "par3"
    t.text     "par4"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.boolean  "is_admin",           :default => false
    t.integer  "posts_count",        :default => 0
    t.integer  "movies_count",       :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "demo_file_name"
    t.string   "demo_content_type"
    t.integer  "demo_file_size"
    t.datetime "demo_updated_at"
  end

end
