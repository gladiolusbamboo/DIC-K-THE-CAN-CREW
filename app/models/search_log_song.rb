class SearchLogSong < ApplicationRecord
  belongs_to :search_log
  belongs_to :song
end
