class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.references :lyric_url, foreign_key: true
      t.string :name
      t.string :lyricist
      t.string :composer
      t.string :arranger

      t.timestamps
    end
  end
end
