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

ActiveRecord::Schema.define(version: 20160609130232) do

  create_table "admin_users", force: :cascade do |t|
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

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "cart_items", force: :cascade do |t|
    t.integer  "ebook_id",   limit: 4, null: false
    t.integer  "user_id",    limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "cart_items", ["ebook_id"], name: "fk_rails_476f1c8dfb", using: :btree
  add_index "cart_items", ["user_id", "ebook_id"], name: "index_cart_items_on_user_id_and_ebook_id", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "categorisations", force: :cascade do |t|
    t.integer  "ebook_id",    limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "categorisations", ["category_id"], name: "index_categorisations_on_category_id", using: :btree
  add_index "categorisations", ["ebook_id"], name: "index_categorisations_on_ebook_id", using: :btree

  create_table "controllers", force: :cascade do |t|
    t.string   "charges",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ebook_orders", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.integer  "ebook_id",   limit: 4
    t.decimal  "price",                precision: 10
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "ebook_orders", ["ebook_id"], name: "index_ebook_orders_on_ebook_id", using: :btree
  add_index "ebook_orders", ["order_id"], name: "index_ebook_orders_on_order_id", using: :btree

  create_table "ebooks", force: :cascade do |t|
    t.integer  "category_id", limit: 4
    t.string   "ISBN",        limit: 255
    t.string   "title",       limit: 255
    t.string   "author",      limit: 255
    t.text     "description", limit: 65535
    t.float    "price",       limit: 24
    t.string   "pdf",         limit: 255
    t.string   "ebook_image", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "ebooks", ["category_id"], name: "index_ebooks_on_category_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "ebook_id",   limit: 4
    t.integer  "order_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "order_items", ["ebook_id"], name: "fk_rails_ee4edda6dc", using: :btree
  add_index "order_items", ["order_id"], name: "fk_rails_e3cb28f071", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "int_id",     limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "total",                precision: 10, null: false
  end

  add_index "orders", ["int_id"], name: "index_orders_on_int_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "titles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               limit: 255,   default: "email", null: false
    t.string   "uid",                    limit: 255,   default: "",      null: false
    t.string   "encrypted_password",     limit: 255,   default: "",      null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "fullname",               limit: 255
    t.integer  "title_id",               limit: 4
    t.string   "email",                  limit: 255
    t.text     "tokens",                 limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "blocked",                              default: false,   null: false
    t.boolean  "resblock",                             default: false,   null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["title_id"], name: "fk_rails_e9277efd4e", using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  add_foreign_key "cart_items", "ebooks"
  add_foreign_key "cart_items", "users"
  add_foreign_key "categorisations", "categories"
  add_foreign_key "categorisations", "ebooks"
  add_foreign_key "ebook_orders", "ebooks"
  add_foreign_key "ebook_orders", "orders"
  add_foreign_key "order_items", "ebooks"
  add_foreign_key "order_items", "orders"
  add_foreign_key "users", "titles"
end
