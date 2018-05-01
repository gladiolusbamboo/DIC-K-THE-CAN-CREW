class AddSearchLogSongRefToSongs < ActiveRecord::Migration[5.1]
  def change
    add_reference :songs, :search_log_song, foreign_key: true
  end
end
