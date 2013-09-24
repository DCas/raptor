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

ActiveRecord::Schema.define(version: 20130924050326) do

  create_table "matchups", force: true do |t|
    t.datetime "time"
    t.integer  "home_id"
    t.integer  "away_id"
    t.string   "home_symbol"
    t.string   "away_symbol"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "week"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "twitter_username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.datetime "last_checked"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "player_list"
    t.string   "symbol"
    t.string   "location"
    t.string   "twitter"
  end

  create_table "tweets", force: true do |t|
    t.string   "body"
    t.string   "post_date"
    t.decimal  "sentiment_score"
    t.string   "sentiment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player_id"
    t.integer  "tweet_id"
  end

end
