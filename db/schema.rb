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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180912164409) do

  create_table "appointments", force: :cascade do |t|
    t.integer  "destination_id"
    t.integer  "destination_type_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "appointments", ["destination_id"], name: "index_appointments_on_destination_id"
  add_index "appointments", ["destination_type_id"], name: "index_appointments_on_destination_type_id"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id"

  create_table "destination_types", force: :cascade do |t|
    t.string   "name"
    t.string   "format_name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.string   "name"
    t.string   "format_name"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "url"
    t.string   "name"
    t.string   "format_name"
    t.string   "title"
    t.string   "width"
    t.string   "height"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "destination_id"
    t.integer  "place_id"
  end

  add_index "photos", ["destination_id"], name: "index_photos_on_destination_id"
  add_index "photos", ["place_id"], name: "index_photos_on_place_id"

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "format_name"
    t.float    "lat"
    t.float    "lng"
    t.string   "description"
    t.string   "formatted_address"
    t.string   "formatted_phone_number"
    t.string   "icon"
    t.string   "place_temp_google"
    t.string   "rating"
    t.string   "url"
    t.string   "website"
    t.integer  "destination_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "places", ["destination_id"], name: "index_places_on_destination_id"

end
