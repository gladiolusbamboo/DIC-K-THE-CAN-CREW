class RemoveIsFirstToCdSongs < ActiveRecord::Migration[5.1]
  def change
    remove_column :cd_songs, :is_first, :boolean
  end
end
