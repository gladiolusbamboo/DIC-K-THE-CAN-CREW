class LyricUrlSong < ApplicationRecord
  belongs_to :lyric_url
  belongs_to :song
end
