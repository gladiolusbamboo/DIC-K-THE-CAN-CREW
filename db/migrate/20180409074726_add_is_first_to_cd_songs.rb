class AddIsFirstToCdSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :cd_songs, :is_first, :boolean
  end
end
