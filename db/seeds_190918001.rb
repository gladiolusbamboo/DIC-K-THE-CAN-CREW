artist_name =    'KREVA'
lyricUrl_url =   nil
cd_name =        'AFTERMIXTAPE'
cd_released_at = '2019-09-18'
song_name =      '敵がいない国'
song_lyricist =  'KREVA'
song_composer =  'KREVA'
song_arranger =  'KREVA'
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

singer = Singer.find_by(name: 'KREVA?')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '敵がいない敵がいない敵がいない敵がいない敵がいない敵がいない敵がいない国',
  ruby: 'てきがいないてきがいないてきがいないてきがいないてきがいないてきがいないてきがいないくに',
  lyric_with_ruby: '\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{国,くに\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'ゆらゆらU.F.O.踊らなくたっていい揺れようベースラインビート重低音体全体がサスペンションゆらゆらU.F.O.人の真似じゃなく自分でいよう誰と戦うでもない不戦勝大事と思ったら付箋しよう',
  ruby: 'ゆらゆらゆーえふおーおどらなくたっていいゆれようべーすらいんびーとじゅうていおんからだぜんたいがさすぺんしょんゆらゆらゆーえふおーひとのまねじゃなくじぶんでいようだれとたたかうでもないふせんしょうだいじとおもったらふせんしよう',
  lyric_with_ruby: 'ゆらゆら\{ ,\}\{U,ゆー\}\{.,\}\{F,えふ\}\{.,\}\{O,おー\}\{.,\}\{ ,\}\{踊ら,おどら\}なくたっていい\{ ,\}\{揺れよ,ゆれよ\}う\{ ,\}\{ベース,べーす\}\{ライン,らいん\}\{ ,\}\{ビート,びーと\}\{ ,\}\{重,じゅう\}\{低音,ていおん\}\{ ,\}\{体,からだ\}\{全体,ぜんたい\}が\{サスペンション,さすぺんしょん\}\{ ,\}ゆらゆら\{ ,\}\{U,ゆー\}\{.,\}\{F,えふ\}\{.,\}\{O,おー\}\{.,\}\{ ,\}\{人,ひと\}の\{真似,まね\}じゃなく\{ ,\}\{自分,じぶん\}でいよう\{ ,\}\{誰,だれ\}と\{戦う,たたかう\}でもない\{ ,\}\{不戦勝,ふせんしょう\}\{ ,\}\{大事,だいじ\}と\{思っ,おもっ\}たら\{ ,\}\{付箋,ふせん\}しよう\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '誰もが持っている英語で言うならShame日本語で言うなら羞恥心それを棚にあげましょう自分自身誰もあなたを笑いませんそうゆう人ならいませんここはまるで敵がいない国絶対無理なんて言わないあなたが大好き',
  ruby: 'だれもがもっているえいごでいうならしぇいむにっぽんごでいうならしゅうちしんそれをたなにあげましょうじぶんじしんだれもあなたをわらいませんそうゆうひとならいませんここはまるでてきがいないくにぜったいむりなんていわないあなたがだいすき',
  lyric_with_ruby: '\{誰,だれ\}もが\{持っ,もっ\}ている\{ ,\}\{英語,えいご\}で\{言う,いう\}なら\{ ,\}\{Shame,しぇいむ\}\{ ,\}\{日本語,にっぽんご\}で\{言う,いう\}なら\{羞恥心,しゅうちしん\}\{ ,\}それを\{棚,たな\}にあげましょう\{ ,\}\{自分,じぶん\}\{自身,じしん\}\{ ,\}\{誰,だれ\}もあなたを\{笑い,わらい\}ません\{ ,\}そうゆう\{人,ひと\}ならいません\{ ,\}ここはまるで\{敵,てき\}がいない\{国,くに\}\{ ,\}\{絶対,ぜったい\}\{無理,むり\}\{ ,\}なんて\{言わ,いわ\}ないあなたが\{ ,\}\{大好き,だいすき\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'KREVA?')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '敵がいない敵がいない敵がいない敵がいない敵がいない敵がいない敵がいない国',
  ruby: 'てきがいないてきがいないてきがいないてきがいないてきがいないてきがいないてきがいないくに',
  lyric_with_ruby: '\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{国,くに\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'ゆらゆらU.F.O.踊らなくたっていい揺れようベースラインビート重低音体全体がサスペンションゆらゆらU.F.O.人の真似じゃなく自分でいよう誰と戦うでもない不戦勝大事と思ったら付箋しよう',
  ruby: 'ゆらゆらゆーえふおーおどらなくたっていいゆれようべーすらいんびーとじゅうていおんからだぜんたいがさすぺんしょんゆらゆらゆーえふおーひとのまねじゃなくじぶんでいようだれとたたかうでもないふせんしょうだいじとおもったらふせんしよう',
  lyric_with_ruby: 'ゆらゆら\{ ,\}\{U,ゆー\}\{.,\}\{F,えふ\}\{.,\}\{O,おー\}\{.,\}\{ ,\}\{踊ら,おどら\}なくたっていい\{ ,\}\{揺れよ,ゆれよ\}う\{ ,\}\{ベース,べーす\}\{ライン,らいん\}\{ ,\}\{ビート,びーと\}\{ ,\}\{重,じゅう\}\{低音,ていおん\}\{ ,\}\{体,からだ\}\{全体,ぜんたい\}が\{サスペンション,さすぺんしょん\}\{ ,\}ゆらゆら\{ ,\}\{U,ゆー\}\{.,\}\{F,えふ\}\{.,\}\{O,おー\}\{.,\}\{ ,\}\{人,ひと\}の\{真似,まね\}じゃなく\{ ,\}\{自分,じぶん\}でいよう\{ ,\}\{誰,だれ\}と\{戦う,たたかう\}でもない\{ ,\}\{不戦勝,ふせんしょう\}\{ ,\}\{大事,だいじ\}と\{思っ,おもっ\}たら\{ ,\}\{付箋,ふせん\}しよう\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'KREVA?')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '敵がいない敵がいない敵がいない敵がいない敵がいない敵がいない敵がいない国',
  ruby: 'てきがいないてきがいないてきがいないてきがいないてきがいないてきがいないてきがいないくに',
  lyric_with_ruby: '\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{国,くに\}\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: '一見さん大歓迎ベテラン組も大歓迎出戻り組も大歓迎関係ない関係ないんだって右→左左→右前→後後→前当然気にしないここは敵がいない国矢印同じ向き',
  ruby: 'いちげんさんだいかんげいべてらんぐみもだいかんげいでもどりぐみもだいかんげいかんけいないかんけいないんだってみぎひだりひだりみぎぜんごごぜんとうぜんきにしないここはてきがいないくにやじるしおなじむき',
  lyric_with_ruby: '\{一見,いちげん\}さん\{ ,\}\{大,だい\}\{歓迎,かんげい\}\{ ,\}\{ベテラン,べてらん\}\{組,ぐみ\}も\{大,だい\}\{歓迎,かんげい\}\{ ,\}\{出戻り,でもどり\}\{組,ぐみ\}も\{大,だい\}\{歓迎,かんげい\}\{ ,\}\{関係,かんけい\}ない\{関係,かんけい\}ないんだって\{ ,\}\{右,みぎ\}\{→,\}\{左,ひだり\}\{ ,\}\{左,ひだり\}\{→,\}\{右,みぎ\}\{ ,\}\{前,ぜん\}\{→,\}\{後,ご\}\{ ,\}\{後,ご\}\{→,\}\{前,ぜん\}\{ ,\}\{当然,とうぜん\}\{気,き\}にしない\{ ,\}ここは\{敵,てき\}がいない\{国,くに\}\{ ,\}\{矢印,やじるし\}\{ ,\}\{同じ,おなじ\}\{向き,むき\}\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 5,
  lyric: 'ゆらゆらU.F.O.踊らなくたっていい揺れようベースラインビート重低音体全体がサスペンションゆらゆらU.F.O.人の真似じゃなく自分でいよう誰と戦うでもない不戦勝大事と思ったら付箋しよう',
  ruby: 'ゆらゆらゆーえふおーおどらなくたっていいゆれようべーすらいんびーとじゅうていおんからだぜんたいがさすぺんしょんゆらゆらゆーえふおーひとのまねじゃなくじぶんでいようだれとたたかうでもないふせんしょうだいじとおもったらふせんしよう',
  lyric_with_ruby: 'ゆらゆら\{ ,\}\{U,ゆー\}\{.,\}\{F,えふ\}\{.,\}\{O,おー\}\{.,\}\{ ,\}\{踊ら,おどら\}なくたっていい\{ ,\}\{揺れよ,ゆれよ\}う\{ ,\}\{ベース,べーす\}\{ライン,らいん\}\{ ,\}\{ビート,びーと\}\{ ,\}\{重,じゅう\}\{低音,ていおん\}\{ ,\}\{体,からだ\}\{全体,ぜんたい\}が\{サスペンション,さすぺんしょん\}\{ ,\}ゆらゆら\{ ,\}\{U,ゆー\}\{.,\}\{F,えふ\}\{.,\}\{O,おー\}\{.,\}\{ ,\}\{人,ひと\}の\{真似,まね\}じゃなく\{ ,\}\{自分,じぶん\}でいよう\{ ,\}\{誰,だれ\}と\{戦う,たたかう\}でもない\{ ,\}\{不戦勝,ふせんしょう\}\{ ,\}\{大事,だいじ\}と\{思っ,おもっ\}たら\{ ,\}\{付箋,ふせん\}しよう\{ ,\}',
  lyric_order: 8,
)

singer = Singer.find_by(name: 'KREVA?')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: '敵がいない敵がいない敵がいない敵がいない敵がいない敵がいない敵がいない国',
  ruby: 'てきがいないてきがいないてきがいないてきがいないてきがいないてきがいないてきがいないくに',
  lyric_with_ruby: '\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{ ,\}\{敵,てき\}がいない\{国,くに\}\{ ,\}',
  lyric_order: 9,
)

