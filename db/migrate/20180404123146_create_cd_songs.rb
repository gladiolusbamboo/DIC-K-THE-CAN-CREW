class CreateCdSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :cd_songs do |t|
      t.references :cd, foreign_key: true
      t.references :song, foreign_key: true

      t.timestamps
    end
  end
end
