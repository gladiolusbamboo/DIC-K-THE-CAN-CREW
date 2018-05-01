class AddPhraseHitCountToSearchLogSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :search_log_songs, :phrase_hit_count, :integer
  end
end
