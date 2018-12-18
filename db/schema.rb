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

ActiveRecord::Schema.define(version: 2018_12_17_175307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cells", force: :cascade do |t|
    t.integer "x"
    t.integer "y"
    t.boolean "ship"
    t.integer "player"
    t.boolean "hit"
    t.integer "game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "player_1_name"
    t.string "player_2_name"
    t.string "winner"
  end

  create_table "grid", force: :cascade do |t|
    t.integer "x"
    t.integer "y"
    t.boolean "ship"
  end

  create_table "moves", force: :cascade do |t|
    t.integer "player_id"
    t.integer "x"
    t.integer "y"
    t.boolean "hit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
