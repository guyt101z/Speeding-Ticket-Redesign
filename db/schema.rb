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

ActiveRecord::Schema.define(version: 20130917204624) do

  create_table "assets", force: true do |t|
    t.integer  "user_id"
    t.string   "location"
    t.integer  "tag_number"
    t.string   "asset_type"
    t.string   "asset_name"
    t.string   "model"
    t.string   "serial_number"
    t.string   "manufacturer"
    t.string   "mac_address1"
    t.string   "mac_address2"
    t.string   "mac_address3"
    t.string   "description"
    t.text     "notes"
    t.text     "other"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", force: true do |t|
    t.integer  "technician_id"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachemnts", force: true do |t|
    t.integer  "asset_id"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "technician_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree

  create_table "installations", force: true do |t|
    t.integer  "asset_id"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", force: true do |t|
    t.integer  "asset_id"
    t.integer  "software_id"
    t.integer  "user_id"
    t.string   "item_name"
    t.string   "part_number"
    t.string   "account_number"
    t.string   "grant_account"
    t.integer  "quantity"
    t.string   "status"
    t.string   "invoice_file_name"
    t.string   "invoice_content_type"
    t.integer  "invoice_file_size"
    t.datetime "invoice_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "softwares", force: true do |t|
    t.string   "title"
    t.string   "version_number"
    t.string   "manufacturer"
    t.string   "license_type"
    t.text     "license_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technicians", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "auth_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.string   "status"
    t.date     "deadline"
    t.boolean  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "location"
    t.string   "phone_number"
    t.string   "department"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
