artist_name =    ''
lyricUrl_url =   ''
cd_name =        ''
cd_released_at = ''
song_name =      ''
song_lyricist =  ''
song_composer =  ''
song_arranger =  ''
cds_name = []
note          = nil

artist = Artist.find_by(name: artist_name) || Artist.create(name: artist_name)
cd = Cd.find_by(name: cd_name) || Cd.create(name: cd_name, released_at: cd_released_at)

if lyricUrl_url
  lyricUrl = LyricUrl.create(
    url: lyricUrl_url,
    lyric_website_id: LyricWebsite.find_by(name: 'うたまっぷ').id
  )
end

song = Song.create(
  lyric_url_id: lyricUrl ? lyricUrl.id : nil,
  name: song_name,
  lyricist: song_lyricist,
  composer: song_composer,
  arranger: song_arranger,
  cd_id: cd.id,
  artist_id: artist.id,
  note: note
)
if lyricUrl
  LyricUrlSong.create(
    lyric_url_id: lyricUrl.id,
    song_id: song.id
  )
end
CdSong.create(
  cd_id: cd.id,
  song_id: song.id
)

singer = Singer.find_by(name: 'CUEZERO')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'せちがらい世の中で痛感する自分の愚かさ、無力さ思わず心からこぼれる受け止めてよ、おのおの方',
  ruby: 'せちがらいよのなかでつうかんするじぶんのおろかさむりょくさおもわずこころからこぼれるうけとめてよおのおのがた',
  lyric_with_ruby: 'せちがらい\{世の中,よのなか\}で\{痛感,つうかん\}する\{自分,じぶん\}の\{愚か,おろか\}さ\{、,\}\{無力,むりょく\}さ\{ ,\}\{思わず,おもわず\}\{心から,こころから\}こぼれる\{ ,\}\{受け止め,うけとめ\}てよ\{、,\}おのおの\{方,がた\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'CUEZERO')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'なけなしの金で買ったTシャツ俺にしちゃ高いぃぃぃ奴おろしごきげんメシでも行っとこう!そこで案の定こぼすミートソースDaaam!',
  ruby: 'なけなしのかねでかったてぃーしゃつおれにしちゃたかいぃぃぃやつおろしごきげんめしでもいっとこうそこであんのじょうこぼすみーとそーすだーむ',
  lyric_with_ruby: 'なけなしの\{金,かね\}で\{買っ,かっ\}た\{Tシャツ,てぃーしゃつ\}\{ ,\}\{俺,おれ\}にしちゃ\{高い,たかい\}ぃぃぃ\{奴,やつ\}\{ ,\}おろしごきげん\{ ,\}\{メシ,めし\}でも\{行っ,いっ\}とこう\{!,\}\{ ,\}そこで\{案の定,あんのじょう\}こぼす\{ ,\}\{ミート,みーと\}\{ソース,そーす\}\{ ,\}\{Daaam,だーむ\}\{!,\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'CUEZERO')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'やる事すべて裏目注意力のない自分恨め拭いて余計にしみてくタレそんな日は帰って寝るだけ寄り道しない直帰手ぶらでふりかかる不幸との知恵くらべようやく到着一息つきてぇーそこで気付く電球切れDaaam!',
  ruby: 'やることすべてうらめちゅういりょくのないじぶんうらめふいてよけいにしみてくたれそんなひはかえってねるだけよりみちしないちょっきてぶらでふりかかるふこうとのちえくらべようやくとうちゃくひといきつきてぇーそこできづくでんきゅうぎれだーむ',
  lyric_with_ruby: 'やる\{事,こと\}すべて\{裏目,うらめ\}\{ ,\}\{注意,ちゅうい\}\{力,りょく\}のない\{自分,じぶん\}\{恨め,うらめ\}\{ ,\}\{拭い,ふい\}て\{余計,よけい\}にしみてく\{タレ,たれ\}\{ ,\}そんな\{日,ひ\}は\{帰っ,かえっ\}て\{寝る,ねる\}だけ\{ ,\}\{寄り道,よりみち\}しない\{ ,\}\{直,ちょっ\}\{帰,き\}\{ ,\}\{手ぶら,てぶら\}で\{ ,\}ふりかかる\{不幸,ふこう\}との\{知恵,ちえ\}くらべ\{ ,\}ようやく\{到着,とうちゃく\}\{ ,\}\{一息,ひといき\}つきてぇー\{ ,\}そこで\{気付く,きづく\}\{ ,\}\{電球,でんきゅう\}\{切れ,ぎれ\}\{ ,\}\{Daaam,だーむ\}\{!,\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'ちょっともぉなんでこうなんの?世の中どぉなってんの!?いまさら言い訳もないけどほんともぉなんでこうなんの?!俺ったらどぉなってんの!?今何か言えるとしたならDaaam…',
  ruby: 'ちょっともぉなんでこうなんのよのなかどぉなってんのいまさらいいわけもないけどほんともぉなんでこうなんのおれったらどぉなってんのいまなにかいえるとしたならだーむ',
  lyric_with_ruby: 'ちょっともぉなんでこうなんの\{?,\}\{ ,\}\{世の中,よのなか\}どぉなってんの\{!?,\}\{ ,\}いまさら\{言い訳,いいわけ\}もないけど\{ ,\}ほんともぉなんでこうなんの\{?!,\}\{ ,\}\{俺,おれ\}ったらどぉなってんの\{!?,\}\{ ,\}\{今,いま\}\{何,なに\}か\{言える,いえる\}としたなら\{ ,\}\{Daaam,だーむ\}\{…,\}\{ ,\}',
  lyric_order: 4,
)

