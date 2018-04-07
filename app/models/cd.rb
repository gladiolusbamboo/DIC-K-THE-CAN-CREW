class Cd < ApplicationRecord
  has_many :cd_songs
  has_many :songs, through: :cd_songs
end
