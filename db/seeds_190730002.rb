cd_name =        'だからどうした!'

cd = Cd.find_by(name: cd_name)

song_name = '恥じゃない'
song = Song.find_by(name: song_name)

if song
  CdSong.create(
    cd_id: cd.id,
    song_id: song.id
  )
else
  p '見つからない -> ' + name
end
