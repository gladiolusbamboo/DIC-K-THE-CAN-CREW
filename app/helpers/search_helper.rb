module SearchHelper
  def get_unique_songs_sum lyrics_array
    arr = []
    lyrics_array.each do |lyric|
      if !arr.include? lyric.song.id
        arr.push lyric.song.id
      end
    end
    pp arr
    arr.length
  end
end
