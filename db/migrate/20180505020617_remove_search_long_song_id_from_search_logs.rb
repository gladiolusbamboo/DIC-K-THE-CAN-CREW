class RemoveSearchLongSongIdFromSearchLogs < ActiveRecord::Migration[5.1]
  def change
    remove_column :search_logs, :search_log_song_id, :integer
  end
end
