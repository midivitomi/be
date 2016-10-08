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

ActiveRecord::Schema.define(version: 20161008152834) do

  create_table "competitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "key",        null: false
    t.integer  "league_id",  null: false
    t.integer  "season_id",  null: false
    t.date     "start_at",   null: false
    t.date     "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_competitions_on_league_id", using: :btree
    t.index ["season_id"], name: "index_competitions_on_season_id", using: :btree
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "competitions_id", null: false
    t.string   "title",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["competitions_id"], name: "index_groups_on_competitions_id", using: :btree
  end

  create_table "leagues", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "key",        null: false
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "key"
    t.integer  "round_id",                   null: false
    t.integer  "pos",                        null: false
    t.integer  "group_id"
    t.integer  "team1_id",                   null: false
    t.integer  "team2_id",                   null: false
    t.datetime "play_at",                    null: false
    t.boolean  "postponed",  default: false, null: false
    t.datetime "play_at_v2"
    t.datetime "play_at_v3"
    t.integer  "ground_id"
    t.integer  "city_id"
    t.boolean  "home",       default: true,  null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["city_id"], name: "index_matches_on_city_id", using: :btree
    t.index ["ground_id"], name: "index_matches_on_ground_id", using: :btree
    t.index ["group_id"], name: "index_matches_on_group_id", using: :btree
    t.index ["round_id"], name: "index_matches_on_round_id", using: :btree
    t.index ["team1_id"], name: "index_matches_on_team1_id", using: :btree
    t.index ["team2_id"], name: "index_matches_on_team2_id", using: :btree
  end

  create_table "rounds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "event_id",   null: false
    t.string   "title",      null: false
    t.string   "title2"
    t.date     "start_at",   null: false
    t.date     "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_rounds_on_event_id", using: :btree
  end

  create_table "seasons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "key",        null: false
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "key",        null: false
    t.string   "title",      null: false
    t.string   "title2"
    t.string   "synonyms"
    t.integer  "country_id", null: false
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_teams_on_city_id", using: :btree
    t.index ["country_id"], name: "index_teams_on_country_id", using: :btree
  end

end
