class CreateSearchLogSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :search_log_songs do |t|
      t.references :search_log, foreign_key: true
      t.references :song, foreign_key: true

      t.timestamps
    end
  end
end
