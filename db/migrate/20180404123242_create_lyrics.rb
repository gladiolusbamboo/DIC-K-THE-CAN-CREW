class CreateLyrics < ActiveRecord::Migration[5.1]
  def change
    create_table :lyrics do |t|
      t.references :song, foreign_key: true
      t.references :singer, foreign_key: true
      t.references :lyric_type, foreign_key: true
      t.integer :next_lyricid
      t.text :lyric
      t.text :ruby
      t.text :lyric_with_ruby
      t.integer :lyric_order

      t.timestamps
    end
  end
end
