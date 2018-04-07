class CreateLyricUrlSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :lyric_url_songs do |t|
      t.references :lyric_url, foreign_key: true
      t.references :song, foreign_key: true

      t.timestamps
    end
  end
end
