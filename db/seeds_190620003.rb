artist_name =    'KREVA'
cd_name =        '成長の記録　～全曲バンドで録り直し～'
cd_released_at = '2019-06-19'

artist = Artist.find_by(name: artist_name) || Artist.create(name: artist_name)
cd = Cd.find_by(name: cd_name) || Cd.create(name: cd_name, released_at: cd_released_at)

name = '基準'
song = Song.find_by(name: name)

if song
  CdSong.create(
    cd_id: cd.id,
    song_id: song.id
  )
else
  p '見つからない -> ' + name
end

name = 'ストロングスタイル'
song = Song.find_by(name: name)

if song
  CdSong.create(
    cd_id: cd.id,
    song_id: song.id
  )
else
  p '見つからない -> ' + name
end

name = 'トランキライザー'
song = Song.find_by(name: name)

if song
  CdSong.create(
    cd_id: cd.id,
    song_id: song.id
  )
else
  p '見つからない -> ' + name
end

name = 'イッサイガッサイ'
song = Song.find_by(name: name)

if song
  CdSong.create(
    cd_id: cd.id,
    song_id: song.id
  )
else
  p '見つからない -> ' + name
end

name = '王者の休日'
song = Song.find_by(name: name)

if song
  CdSong.create(
    cd_id: cd.id,
    song_id: song.id
  )
else
  p '見つからない -> ' + name
end

name = 'I Wanna Know You'
song = Song.find_by(name: name)

if song
  CdSong.create(
    cd_id: cd.id,
    song_id: song.id
  )
else
  p '見つからない -> ' + name
end

name = '存在感'
song = Song.find_by(name: name)

if song
  CdSong.create(
    cd_id: cd.id,
    song_id: song.id
  )
else
  p '見つからない -> ' + name
end

name = '成功'
song = Song.find_by(name: name)

if song
  CdSong.create(
    cd_id: cd.id,
    song_id: song.id
  )
else
  p '見つからない -> ' + name
end

name = 'KILA KILA'
song = Song.find_by(name: name)

if song
  CdSong.create(
    cd_id: cd.id,
    song_id: song.id
  )
else
  p '見つからない -> ' + name
end

name = 'かも'
song = Song.find_by(name: name)

if song
  CdSong.create(
    cd_id: cd.id,
    song_id: song.id
  )
else
  p '見つからない -> ' + name
end

name = '居場所'
song = Song.find_by(name: name)

if song
  CdSong.create(
    cd_id: cd.id,
    song_id: song.id
  )
else
  p '見つからない -> ' + name
end

name = 'アグレッシ部'
song = Song.find_by(name: name)

if song
  CdSong.create(
    cd_id: cd.id,
    song_id: song.id
  )
else
  p '見つからない -> ' + name
end

name = 'スタート'
song = Song.find_by(name: name)

if song
  CdSong.create(
    cd_id: cd.id,
    song_id: song.id
  )
else
  p '見つからない -> ' + name
end

name = '音色'
song = Song.find_by(name: name)

if song
  CdSong.create(
    cd_id: cd.id,
    song_id: song.id
  )
else
  p '見つからない -> ' + name
end

name = 'C\'mon, Let\'s go'
song = Song.find_by(name: name)

if song
  CdSong.create(
    cd_id: cd.id,
    song_id: song.id
  )
else
  p '見つからない -> ' + name
end
