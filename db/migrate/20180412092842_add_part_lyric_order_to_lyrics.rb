class AddPartLyricOrderToLyrics < ActiveRecord::Migration[5.1]
  def change
    add_column :lyrics, :part_lyric_order, :integer
  end
end
