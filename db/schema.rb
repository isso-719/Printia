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

ActiveRecord::Schema.define(version: 20180915083058) do

  create_table "contents", force: :cascade do |t|
    t.string   "img"
    t.string   "img_description"
    t.string   "img_random"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "group_name"
    t.string   "group_update"
    t.string   "group_icon"
    t.string   "group_description"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "mail"
    t.string   "password_digest"
    t.string   "username"
    t.string   "user_icon"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end