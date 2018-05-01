class Song < ApplicationRecord
  has_many :cd_songs
  has_many :cds, through: :cd_songs
  has_many :lyric_url_songs
  has_many :lyric_urls, through: :lyric_url_songs
  belongs_to :cd
  has_many :search_log_songs
  has_many :search_logs, through: :search_log_songs
end
