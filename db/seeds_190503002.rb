lyric = Lyric.find_by_sql("SELECT * FROM lyrics where lyric LIKE '%ウルトラピー%'")
song = lyric.first.song
if lyric
  song.name = 'ULTRA-P'
  song.save
else
  p '見つからない -> ' + song
end

