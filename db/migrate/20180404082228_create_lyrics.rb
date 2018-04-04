class CreateLyrics < ActiveRecord::Migration[5.1]
  def change
    create_table :lyrics do |t|
      t.integer :song_id
      t.integer :singer_id
      t.integer :lyric_type_id
      t.integer :next_lyricid
      t.text :lyric
      t.text :ruby
      t.text :lyric_with_ruby
      t.integer :lyric_order

      t.timestamps
    end
  end
end
