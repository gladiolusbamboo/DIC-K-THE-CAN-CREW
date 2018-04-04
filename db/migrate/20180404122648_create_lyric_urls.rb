class CreateLyricUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :lyric_urls do |t|
      t.string :url
      t.references :lyric_website, foreign_key: true

      t.timestamps
    end
  end
end
