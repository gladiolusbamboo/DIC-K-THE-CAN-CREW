class RemoveCdIdToSong < ActiveRecord::Migration[5.1]
  def change
    remove_reference :songs, :cd, foreign_key: true
  end
end
