class RemoveNextLyricidFromLyrics < ActiveRecord::Migration[5.1]
  def change
    remove_column :lyrics, :next_lyricid, :integer
  end
end
