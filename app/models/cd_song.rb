class CdSong < ApplicationRecord
  belongs_to :cd
  belongs_to :song
end
