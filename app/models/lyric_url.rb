class LyricUrl < ApplicationRecord
  belongs_to :lyric_website
  has_many :lyric_url_songs
  has_many :songs, through: :lyric_url_songs
end
