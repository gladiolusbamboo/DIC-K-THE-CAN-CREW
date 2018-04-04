class Lyric < ApplicationRecord
  belongs_to :song
  belongs_to :singer
  belongs_to :lyric_type
end
