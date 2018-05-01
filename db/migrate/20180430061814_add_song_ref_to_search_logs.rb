class AddSongRefToSearchLogs < ActiveRecord::Migration[5.1]
  def change
    add_reference :search_logs, :song, foreign_key: true
  end
end
