class AddSearchLogRefToSongs < ActiveRecord::Migration[5.1]
  def change
    add_reference :songs, :search_log, foreign_key: true
  end
end
