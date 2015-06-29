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

ActiveRecord::Schema.define(version: 20150624015318) do

  create_table "admin_profiles", force: :cascade do |t|
    t.string   "name",       limit: 20
    t.string   "contact",    limit: 50
    t.string   "email",      limit: 50
    t.string   "qq",         limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "articles", force: :cascade do |t|
    t.string   "name",       limit: 20
    t.string   "content",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "companies", force: :cascade do |t|
    t.integer  "enterprise_id", limit: 4
    t.string   "name",          limit: 100
    t.string   "state",         limit: 20
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "companies", ["enterprise_id"], name: "index_companies_on_enterprise_id", using: :btree
  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree
  add_index "companies", ["state"], name: "index_companies_on_state", using: :btree

  create_table "enterprise_contacts", force: :cascade do |t|
    t.integer  "enterprise_id", limit: 4
    t.string   "name",          limit: 20
    t.boolean  "gender",        limit: 1,  default: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "enterprise_contacts", ["enterprise_id"], name: "index_enterprise_contacts_on_enterprise_id", using: :btree

  create_table "enterprise_profiles", force: :cascade do |t|
    t.integer  "enterprise_id", limit: 4
    t.string   "name",          limit: 20,    null: false
    t.string   "province",      limit: 6,     null: false
    t.string   "city",          limit: 6,     null: false
    t.string   "district",      limit: 6,     null: false
    t.string   "address",       limit: 50,    null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "shop",          limit: 20
    t.text     "intro",         limit: 65535
  end

  add_index "enterprise_profiles", ["enterprise_id"], name: "index_enterprise_profiles_on_enterprise_id", using: :btree

  create_table "enterprises", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "contacts_count",         limit: 4,   default: 0
  end

  add_index "enterprises", ["email"], name: "index_enterprises_on_email", unique: true, using: :btree
  add_index "enterprises", ["reset_password_token"], name: "index_enterprises_on_reset_password_token", unique: true, using: :btree

  create_table "positions", force: :cascade do |t|
    t.integer  "enterprise_id", limit: 4
    t.string   "name",          limit: 100
    t.string   "state",         limit: 20
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "positions", ["enterprise_id"], name: "index_positions_on_enterprise_id", using: :btree
  add_index "positions", ["name"], name: "index_positions_on_name", using: :btree
  add_index "positions", ["state"], name: "index_positions_on_state", using: :btree

  add_foreign_key "companies", "enterprises"
  add_foreign_key "enterprise_contacts", "enterprises"
  add_foreign_key "enterprise_profiles", "enterprises"
  add_foreign_key "positions", "enterprises"
end
