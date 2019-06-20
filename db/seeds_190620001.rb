artist_name =    'KREVA'
cd_name =        '成長の記録　～全曲バンドで録り直し～'
cd_released_at = '2019-06-19'

artist = Artist.find_by(name: artist_name) || Artist.create(name: artist_name)
cd = Cd.find_by(name: cd_name) || Cd.create(name: cd_name, released_at: cd_released_at)
cd.img_name = 'seichounokiroku'
cd.save

name = 'Na Na Na'
song = Song.find_by(name: name)

if song
  CdSong.create(
    cd_id: cd.id,
    song_id: song.id
  )
else
  p '見つからない -> ' + name
end
