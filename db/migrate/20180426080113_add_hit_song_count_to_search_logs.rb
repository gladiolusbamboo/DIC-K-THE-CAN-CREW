class AddHitSongCountToSearchLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :search_logs, :hit_song_count, :integer
  end
end
