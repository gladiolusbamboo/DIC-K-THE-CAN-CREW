class RemoveSongRefToSearchLogs < ActiveRecord::Migration[5.1]
  def change
    remove_reference :search_logs, :song, foreign_key: true
  end
end
