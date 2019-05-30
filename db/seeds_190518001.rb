cd_name =        'BY PHAR THE DOPEST'
song_name =      '切り札のカード'
cd = Cd.find_by(name: cd_name)
song = Song.find_by(name: song_name)

CdSong.create(
  cd_id: cd.id,
  song_id: song.id
)

cd_name =        'BY PHAR THE DOPEST'
song_name =      '伝導師'
cd = Cd.find_by(name: cd_name)
song = Song.find_by(name: song_name)

CdSong.create(
  cd_id: cd.id,
  song_id: song.id
)

song.note = 'Al「BY PHAR THE DOPEST」には最終トラックにシークレットとして別バージョンが収録'
song.save
