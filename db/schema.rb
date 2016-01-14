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

ActiveRecord::Schema.define(version: 20160114082925) do

  create_table "labs", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "location"
    t.string   "webpage"
    t.string   "email"
    t.integer  "lab_capacity"
    t.integer  "current_count"
    t.integer  "time_commitment"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "director"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "lab_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "projects", ["lab_id"], name: "index_projects_on_lab_id"

  create_table "publications", force: :cascade do |t|
    t.text     "citation"
    t.integer  "year"
    t.string   "link"
    t.integer  "lab_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "publications", ["lab_id"], name: "index_publications_on_lab_id"

end
