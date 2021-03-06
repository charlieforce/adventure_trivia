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

ActiveRecord::Schema.define(version: 20150826221120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adventures", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "title"
    t.boolean  "include_final"
    t.string   "token"
    t.integer  "user_id"
  end

  add_index "adventures", ["user_id"], name: "index_adventures_on_user_id", using: :btree

  create_table "answers", force: :cascade do |t|
    t.text     "content"
    t.boolean  "correct"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "challenges", force: :cascade do |t|
    t.integer  "adventure_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
  end

  add_index "challenges", ["adventure_id"], name: "index_challenges_on_adventure_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text     "content"
    t.string   "answer"
    t.integer  "challenge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "questions", ["challenge_id"], name: "index_questions_on_challenge_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.integer  "adventure_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "reviews", ["adventure_id"], name: "index_reviews_on_adventure_id", using: :btree

  create_table "riddles", force: :cascade do |t|
    t.text     "content"
    t.string   "solution"
    t.string   "hint"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "challenge_id"
  end

  add_index "riddles", ["challenge_id"], name: "index_riddles_on_challenge_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "access_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "adventures", "users"
  add_foreign_key "answers", "questions"
  add_foreign_key "challenges", "adventures"
  add_foreign_key "questions", "challenges"
  add_foreign_key "reviews", "adventures"
  add_foreign_key "riddles", "challenges"
end
