class RemoveSearchLogRefToSongs < ActiveRecord::Migration[5.1]
  def change
    remove_reference :songs, :search_log, foreign_key: true
  end
end
