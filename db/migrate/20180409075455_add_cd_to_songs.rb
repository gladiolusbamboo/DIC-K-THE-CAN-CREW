class AddCdToSongs < ActiveRecord::Migration[5.1]
  def change
    add_reference :songs, :cd, foreign_key: true
  end
end
