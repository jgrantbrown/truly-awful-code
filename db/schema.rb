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

ActiveRecord::Schema.define(version: 20170424232320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "accounts", force: :cascade do |t|
    t.citext   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["username"], name: "index_accounts_on_username", unique: true, using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "account_id"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_comments_on_account_id", using: :btree
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "title"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_posts_on_account_id", using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "post_id"
    t.string   "vote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "post_id"], name: "index_votes_on_account_id_and_post_id", unique: true, using: :btree
    t.index ["account_id"], name: "index_votes_on_account_id", using: :btree
    t.index ["post_id"], name: "index_votes_on_post_id", using: :btree
  end

  add_foreign_key "comments", "accounts"
  add_foreign_key "comments", "posts"
  add_foreign_key "posts", "accounts"
  add_foreign_key "votes", "accounts"
  add_foreign_key "votes", "posts"
end
