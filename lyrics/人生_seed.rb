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

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'WeusedtohavepartyeveryweekendButnowwedon\'tまぁそれでもいいねかりそめのこの人生やれることやれるだけやって生きていて',
  ruby: 'うぃーゆーすとぅーはぶぱーてぃーえぶりうぃーくえんどばっとなううぃーどんとまぁそれでもいいねかりそめのこのじんせいやれることやれるだけやっていきていて',
  lyric_with_ruby: '\{We,うぃー\}\{ ,\}\{used,ゆーす\}\{ ,\}\{to,とぅー\}\{ ,\}\{have,はぶ\}\{ ,\}\{party,ぱーてぃー\}\{ ,\}\{every,えぶり\}\{ ,\}\{weekend,うぃーくえんど\}\{ ,\}\{But,ばっと\}\{ ,\}\{now,なう\}\{ ,\}\{we,うぃー\}\{ ,\}\{don\'t,どんと\}\{ ,\}まぁそれでもいいね\{ ,\}かりそめのこの\{人生,じんせい\}\{ ,\}やれることやれるだけやって\{生き,いき\}ていて\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'AhAhAh',
  ruby: 'あーあーあー',
  lyric_with_ruby: '\{Ah,あー\}\{ ,\}\{Ah,あー\}\{ ,\}\{Ah,あー\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'あの頃の俺ら…アホみたいな遊び方それでもシンプルに楽しかったYeahこれでいいのかあれでいいのか考える間もないスピード感根拠なんもない自信もある飛び越えてきそうリンドバーグまたそれやれって言われたら即座に答えるNOだからこそその時やっといてよかったって今だから思えるよつまりその時々胸のドキドキに忠実になり充実させる毎日を大事に生きる',
  ruby: 'あのころのおれらあほみたいなあそびかたそれでもしんぷるにたのしかったいぇーこれでいいのかあれでいいのかかんがえるまもないすぴーどかんこんきょなんもないじしんもあるとびこえてきそうりんどばーぐまたそれやれっていわれたらそくざにこたえるのーだからこそそのときやっといてよかったっていまだからおもえるよつまりそのときどきむねのどきどきにちゅうじつになりじゅうじつさせるまいにちをだいじにいきる',
  lyric_with_ruby: 'あの\{頃,ころ\}の\{俺,おれ\}ら\{…,\}\{ ,\}\{アホ,あほ\}みたいな\{遊び方,あそびかた\}\{ ,\}それでも\{シンプル,しんぷる\}に\{楽しかっ,たのしかっ\}た\{ ,\}\{Yeah,いぇー\}\{ ,\}これでいいのか\{ ,\}あれでいいのか\{ ,\}\{考える,かんがえる\}\{間,ま\}もない\{スピード,すぴーど\}\{感,かん\}\{ ,\}\{根拠,こんきょ\}なんもない\{自信,じしん\}もある\{ ,\}\{飛び越え,とびこえ\}てきそう\{リンドバーグ,りんどばーぐ\}\{ ,\}またそれやれ\{ ,\}って\{言わ,いわ\}れたら\{ ,\}\{即座,そくざ\}に\{答える,こたえる\}\{NO,のー\}\{ ,\}だからこそ\{ ,\}その\{時,とき\}やっといてよかったって\{ ,\}\{今,いま\}だから\{思える,おもえる\}よ\{ ,\}つまりその\{時々,ときどき\}\{ ,\}\{胸,むね\}の\{ドキドキ,どきどき\}に\{ ,\}\{忠実,ちゅうじつ\}になり\{充実,じゅうじつ\}させる\{ ,\}\{毎日,まいにち\}を\{大事,だいじ\}に\{生きる,いきる\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'WeusedtohavepartyeveryweekendButnowwedon\'tまぁそれでもいいねかりそめのこの人生やれることやれるだけやって生きていて',
  ruby: 'うぃーゆーすとぅーはぶぱーてぃーえぶりうぃーくえんどばっとなううぃーどんとまぁそれでもいいねかりそめのこのじんせいやれることやれるだけやっていきていて',
  lyric_with_ruby: '\{We,うぃー\}\{ ,\}\{used,ゆーす\}\{ ,\}\{to,とぅー\}\{ ,\}\{have,はぶ\}\{ ,\}\{party,ぱーてぃー\}\{ ,\}\{every,えぶり\}\{ ,\}\{weekend,うぃーくえんど\}\{ ,\}\{But,ばっと\}\{ ,\}\{now,なう\}\{ ,\}\{we,うぃー\}\{ ,\}\{don\'t,どんと\}\{ ,\}まぁそれでもいいね\{ ,\}かりそめのこの\{人生,じんせい\}\{ ,\}やれることやれるだけやって\{生き,いき\}ていて\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'AhAhAhAhAhAh',
  ruby: 'あーあーあーあーあーあー',
  lyric_with_ruby: '\{Ah,あー\}\{ ,\}\{Ah,あー\}\{ ,\}\{Ah,あー\}\{ ,\}\{Ah,あー\}\{ ,\}\{Ah,あー\}\{ ,\}\{Ah,あー\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'あの頃の俺ら…ただただ酔いたかった時は経った色んな事昔よりわかった今もっと味わいたい深みや繊細さ間違いない見えるようになったね全体が知りすぎたとも言える知ってしまったからこそ怯えるだけどなくならないんだよ好奇心それこそが俺の方位磁針小さなことでもしっかり楽しめてるまたBigPartyそのうちパッとやるだから側にいてくれmyパートナー',
  ruby: 'あのころのおれらただただよいたかったときはたったいろんなことむかしよりわかったいまもっとあじわいたいふかみやせんさいさまちがいないみえるようになったねぜんたいがしりすぎたともいえるしってしまったからこそおびえるだけどなくならないんだよこうきしんそれこそがおれのほういじしんちいさなことでもしっかりたのしめてるまたびっぐぱーてぃーそのうちぱっとやるだからそばにいてくれまいぱーとなー',
  lyric_with_ruby: 'あの\{頃,ころ\}の\{俺,おれ\}ら\{…,\}\{ ,\}ただただ\{酔い,よい\}たかった\{ ,\}\{時,とき\}は\{経っ,たっ\}た\{ ,\}\{色んな,いろんな\}\{事,こと\}\{ ,\}\{昔,むかし\}よりわかった\{ ,\}\{今,いま\}\{ ,\}もっと\{味わい,あじわい\}たい\{ ,\}\{深み,ふかみ\}や\{繊細,せんさい\}さ\{ ,\}\{間違い,まちがい\}ない\{ ,\}\{見える,みえる\}ようになったね\{ ,\}\{全体,ぜんたい\}が\{ ,\}\{知り,しり\}すぎたとも\{言える,いえる\}\{ ,\}\{知っ,しっ\}てしまったからこそ\{怯える,おびえる\}\{ ,\}だけどなくならないんだよ\{ ,\}\{好奇,こうき\}\{心,しん\}\{ ,\}それこそが\{俺,おれ\}の\{方位,ほうい\}\{磁針,じしん\}\{ ,\}\{小さな,ちいさな\}ことでもしっかり\{ ,\}\{楽しめ,たのしめ\}てるまた\{ ,\}\{Big,びっぐ\}\{ ,\}\{Party,ぱーてぃー\}\{ ,\}そのうち\{パッ,ぱっ\}とやる\{ ,\}だから\{側,そば\}にいてくれ\{ ,\}\{my,まい\}\{ ,\}\{パートナー,ぱーとなー\}\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'BRIDGE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'Iloveyou,loveyou,loveyou…',
  ruby: 'あいらぶゆーらぶゆーらぶゆー',
  lyric_with_ruby: '\{I,あい\}\{ ,\}\{love,らぶ\}\{ ,\}\{you,ゆー\}\{,,\}\{ ,\}\{love,らぶ\}\{ ,\}\{you,ゆー\}\{,,\}\{ ,\}\{love,らぶ\}\{ ,\}\{you,ゆー\}\{…,\}\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'WeusedtohavepartyeveryweekendButnowwedon\'tまぁそれでもいいねかりそめのこの人生やれることやれるだけやって',
  ruby: 'うぃーゆーすとぅーはぶぱーてぃーえぶりうぃーくえんどばっとなううぃーどんとまぁそれでもいいねかりそめのこのじんせいやれることやれるだけやって',
  lyric_with_ruby: '\{We,うぃー\}\{ ,\}\{used,ゆーす\}\{ ,\}\{to,とぅー\}\{ ,\}\{have,はぶ\}\{ ,\}\{party,ぱーてぃー\}\{ ,\}\{every,えぶり\}\{ ,\}\{weekend,うぃーくえんど\}\{ ,\}\{But,ばっと\}\{ ,\}\{now,なう\}\{ ,\}\{we,うぃー\}\{ ,\}\{don\'t,どんと\}\{ ,\}まぁそれでもいいね\{ ,\}かりそめのこの\{人生,じんせい\}\{ ,\}やれることやれるだけやって\{ ,\}',
  lyric_order: 8,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'だって続くParty常に人生バラ色それは難しいねでもやり遂げようこのチームでやれることやれるだけやって生きていくぜ',
  ruby: 'だってつづくぱーてぃーつねにじんせいばらいろそれはむずかしいねでもやりとげようこのちーむでやれることやれるだけやっていきていくぜ',
  lyric_with_ruby: 'だって\{続く,つづく\}\{Party,ぱーてぃー\}\{ ,\}\{常に,つねに\}\{人生,じんせい\}\{バラ,ばら\}\{色,いろ\}\{ ,\}それは\{難しい,むずかしい\}ね\{ ,\}でも\{やり遂げよ,やりとげよ\}う\{ ,\}この\{チーム,ちーむ\}で\{ ,\}やれることやれるだけやって\{生き,いき\}ていくぜ\{ ,\}',
  lyric_order: 9,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'AhAhAhAhAhAh',
  ruby: 'あーあーあーあーあーあー',
  lyric_with_ruby: '\{Ah,あー\}\{ ,\}\{Ah,あー\}\{ ,\}\{Ah,あー\}\{ ,\}\{Ah,あー\}\{ ,\}\{Ah,あー\}\{ ,\}\{Ah,あー\}\{ ,\}',
  lyric_order: 10,
)

