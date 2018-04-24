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

ActiveRecord::Schema.define(version: 20180424125115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cd_songs", force: :cascade do |t|
    t.bigint "cd_id"
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cd_id"], name: "index_cd_songs_on_cd_id"
    t.index ["song_id"], name: "index_cd_songs_on_song_id"
  end

  create_table "cds", force: :cascade do |t|
    t.string "name"
    t.date "released_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lyric_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lyric_url_songs", force: :cascade do |t|
    t.bigint "lyric_url_id"
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lyric_url_id"], name: "index_lyric_url_songs_on_lyric_url_id"
    t.index ["song_id"], name: "index_lyric_url_songs_on_song_id"
  end

  create_table "lyric_urls", force: :cascade do |t|
    t.string "url"
    t.bigint "lyric_website_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lyric_website_id"], name: "index_lyric_urls_on_lyric_website_id"
  end

  create_table "lyric_websites", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lyrics", force: :cascade do |t|
    t.bigint "song_id"
    t.bigint "singer_id"
    t.bigint "lyric_type_id"
    t.text "lyric"
    t.text "ruby"
    t.text "lyric_with_ruby"
    t.integer "lyric_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "part_lyric_order"
    t.index ["lyric_type_id"], name: "index_lyrics_on_lyric_type_id"
    t.index ["singer_id"], name: "index_lyrics_on_singer_id"
    t.index ["song_id"], name: "index_lyrics_on_song_id"
  end

  create_table "search_logs", force: :cascade do |t|
    t.string "searchword"
    t.string "searchtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "singers", force: :cascade do |t|
    t.string "name"
    t.boolean "is_kick"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.bigint "lyric_url_id"
    t.string "name"
    t.string "lyricist"
    t.string "composer"
    t.string "arranger"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cd_id"
    t.text "note"
    t.index ["cd_id"], name: "index_songs_on_cd_id"
    t.index ["lyric_url_id"], name: "index_songs_on_lyric_url_id"
  end

  add_foreign_key "cd_songs", "cds"
  add_foreign_key "cd_songs", "songs"
  add_foreign_key "lyric_url_songs", "lyric_urls"
  add_foreign_key "lyric_url_songs", "songs"
  add_foreign_key "lyric_urls", "lyric_websites"
  add_foreign_key "lyrics", "lyric_types"
  add_foreign_key "lyrics", "singers"
  add_foreign_key "lyrics", "songs"
  add_foreign_key "songs", "cds"
  add_foreign_key "songs", "lyric_urls"
end
