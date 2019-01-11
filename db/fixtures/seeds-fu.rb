Artist.seed(
  { name: 'UL' },
)

Cd.seed(
    { name: 'ULTRAP', released_at: '2014-03-05' }
)

Lyric.seed(
    { 
        song_id: Song.find_by(name: 'カンケリ').id,
        singer_id: Singer.find_by(name: 'MCU').id,
        lyric_type_id: LyricType.find_by(name: 'VERSE').id,
        lyric: 'lyric' ,
        ruby: 'りりっく',
        lyric_with_ruby: 'lyric(りりっく)',
        lyric_order: 1,
        part_lyric_order: 1,
    }
)

# create_table "lyrics", force: :cascade do |t|
#     t.bigint "song_id"
#     t.bigint "singer_id"
#     t.bigint "lyric_type_id"
#     t.text "lyric"
#     t.text "ruby"
#     t.text "lyric_with_ruby"
#     t.integer "lyric_order"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.integer "part_lyric_order"
#     t.index ["lyric_type_id"], name: "index_lyrics_on_lyric_type_id"
#     t.index ["singer_id"], name: "index_lyrics_on_singer_id"
#     t.index ["song_id"], name: "index_lyrics_on_song_id"
#   end
