cd_name =        '存在感'
cd = Cd.find_by(name: cd_name)

song_name = '存在感'
song = Song.find_by(name: song_name)

if song && cd
  CdSong.create(
    cd_id: cd.id,
    song_id: song.id
  )
else
  p '見つからない -> ' + name
end
