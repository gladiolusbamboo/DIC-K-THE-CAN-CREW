class AddSearchLogSongRefToSearchLogs < ActiveRecord::Migration[5.1]
  def change
    add_reference :search_logs, :search_log_song, foreign_key: true
  end
end
