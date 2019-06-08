artist_name =    'BY PHAR THE DOPEST'
lyricUrl_url =   'https://www.utamap.com/showkasi.php?surl=B20381'
cd_name =        'だからどうした!'
cd_released_at = '2006-12-31'
song_name =      'ラストコンサート'
song_lyricist =  'BY PHAR THE DOPEST'
song_composer =  'BY PHAR THE DOPEST'
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

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'あぁこれがファーストでラストのコンサート二度ともう味わえない今夜真剣勝負当然本番どの気持ちから届けようかフル回転さ俺の脳内泣き声も聞こえてくる場内変なテンション気分SOHIGH気にすんな集中しろDon\'tmind',
  ruby: 'あぁこれがふぁーすとでらすとのこんさーとにどともうあじわえないこんやしんけんしょうぶとうぜんほんばんどのきもちからとどけようかふるかいてんさおれののうないなきごえもきこえてくるじょうないへんなてんしょんきぶんそーはいきにすんなしゅうちゅうしろどんとまいんど',
  lyric_with_ruby: 'あぁ\{ ,\}これが\{ファースト,ふぁーすと\}で\{ラスト,らすと\}の\{コンサート,こんさーと\}\{ ,\}\{二度と,にどと\}もう\{味わえ,あじわえ\}ない\{今夜,こんや\}\{ ,\}\{真剣,しんけん\}\{勝負,しょうぶ\}\{当然,とうぜん\}\{本番,ほんばん\}\{ ,\}どの\{気持ち,きもち\}から\{届けよ,とどけよ\}うか\{ ,\}\{フル,ふる\}\{回転,かいてん\}さ\{俺,おれ\}の\{脳,のう\}\{内,ない\}\{ ,\}\{泣き声,なきごえ\}も\{聞こえ,きこえ\}てくる\{場内,じょうない\}\{ ,\}\{変,へん\}な\{テンション,てんしょん\}\{ ,\}\{気分,きぶん\}\{SO,そー\}\{ ,\}\{HIGH,はい\}\{ ,\}\{気,き\}にすんな\{ ,\}\{集中,しゅうちゅう\}しろ\{ ,\}\{Don\'t,どんと\}\{ ,\}\{mind,まいんど\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'CUEZERO')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '最初で最後のあのコンサート終えた達成感でまどろんだ始まりは終わり終わりは始まり交わりへの旅立ちさそうそう落ちちゃあないよチャンス最高のバランス最高のジャムこの舞台から自らジャンプ着地何度も言うんだあぁバイファーザドーペストだ',
  ruby: 'さいしょでさいごのあのこんさーとおえたたっせいかんでまどろんだはじまりはおわりおわりははじまりまじわりへのたびだちさそうそうおちちゃあないよちゃんすさいこうのばらんすさいこうのじゃむこのぶたいからみずからじゃんぷちゃくちなんどもいうんだあぁばいふぁーざどーぺすとだ',
  lyric_with_ruby: '\{最初,さいしょ\}で\{最後,さいご\}のあの\{コンサート,こんさーと\}\{ ,\}\{終え,おえ\}た\{達成,たっせい\}\{感,かん\}でまどろんだ\{ ,\}\{始まり,はじまり\}は\{終わり,おわり\}\{ ,\}\{終わり,おわり\}は\{始まり,はじまり\}\{ ,\}\{交わり,まじわり\}への\{旅立ち,たびだち\}さ\{ ,\}そうそう\{落ち,おち\}ちゃあないよ\{チャンス,ちゃんす\}\{ ,\}\{最高,さいこう\}の\{バランス,ばらんす\}\{ ,\}\{最高,さいこう\}の\{ジャム,じゃむ\}\{ ,\}この\{舞台,ぶたい\}から\{自ら,みずから\}\{ジャンプ,じゃんぷ\}\{ ,\}\{着地,ちゃくち\}\{ ,\}\{何,なん\}\{度,ど\}も\{言う,いう\}んだ\{ ,\}あぁ\{ ,\}\{バイファーザドーペスト,ばいふぁーざどーぺすと\}だ\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'CUEZERO')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'あぁ既に終えてきたラストコンサート各自の決意と覚悟交差心のずっと奥とのコンタクト耳に残るこの音楽もう明日に向けてのゴーサインちりばめて並べてゆく広範囲広がるノイズの集合体鳴らして駆け上がる急勾配',
  ruby: 'あぁすでにおえてきたらすとこんさーとかくじのけついとかくごこうさこころのずっとおくとのこんたくとみみにのこるこのおんがくもうあしたにむけてのごーさいんちりばめてならべてゆくこうはんいひろがるのいずのしゅうごうたいならしてかけあがるきゅうこうばい',
  lyric_with_ruby: 'あぁ\{ ,\}\{既に,すでに\}\{終え,おえ\}てきた\{ラスト,らすと\}\{コンサート,こんさーと\}\{ ,\}\{各自,かくじ\}の\{決意,けつい\}と\{覚悟,かくご\}\{交差,こうさ\}\{ ,\}\{心,こころ\}のずっと\{奥,おく\}との\{コンタクト,こんたくと\}\{ ,\}\{耳,みみ\}に\{残る,のこる\}この\{音楽,おんがく\}\{ ,\}もう\{明日,あした\}に\{向け,むけ\}ての\{ゴーサイン,ごーさいん\}\{ ,\}ちりばめて\{並べ,ならべ\}てゆく\{広範囲,こうはんい\}\{ ,\}\{広がる,ひろがる\}\{ノイズ,のいず\}の\{集合,しゅうごう\}\{体,たい\}\{ ,\}\{鳴らし,ならし\}て\{駆け,かけ\}\{上がる,あがる\}\{急,きゅう\}\{勾配,こうばい\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'なぜにこうなるのかYouknowwhy?Idon\'tknowwhy軽く混乱明日のその先の先の将来それとも明日には一文無しそれでも今目の前に存在適当に済まそうだなんて論外全力押韻everyshowtimeやることやるだけやるforlife',
  ruby: 'なぜにこうなるのかゆーのうわいあいどんとのうわいかるくこんらんあすのそのさきのさきのしょうらいそれともあすにはいちもんなしそれでもいまめのまえにそんざいてきとうにすまそうだなんてろんがいぜんりょくおういんえぶりしょーたいむやることやるだけやるふぉーらいふ',
  lyric_with_ruby: 'なぜにこうなるのか\{ ,\}\{You,ゆー\}\{ ,\}\{know,のう\}\{ ,\}\{why,わい\}\{?,\}\{ ,\}\{I,あい\}\{ ,\}\{don\'t,どんと\}\{ ,\}\{know,のう\}\{ ,\}\{why,わい\}\{ ,\}\{軽く,かるく\}\{混乱,こんらん\}\{ ,\}\{明日,あす\}のその\{先,さき\}の\{先,さき\}の\{将来,しょうらい\}\{ ,\}それとも\{明日,あす\}には\{一文,いちもん\}\{無し,なし\}\{ ,\}それでも\{今,いま\}\{目,め\}の\{前,まえ\}に\{存在,そんざい\}\{ ,\}\{適当,てきとう\}に\{済まそ,すまそ\}うだなんて\{論外,ろんがい\}\{ ,\}\{全力,ぜんりょく\}\{押韻,おういん\}\{ ,\}\{every,えぶり\}\{ ,\}\{show,しょー\}\{ ,\}\{time,たいむ\}\{ ,\}やることやるだけやる\{for,ふぉー\}\{ ,\}\{life,らいふ\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'もしこれが最後だと知ったなら持てる力全て残さずに伝えたいこみ上げた記憶辿りながらこぼれかけた涙こぼさずに歌えばいい',
  ruby: 'もしこれがさいごだとしったならもてるちからすべてのこさずにつたえたいこみあげたきおくたどりながらこぼれかけたなみだこぼさずにうたえばいい',
  lyric_with_ruby: 'もしこれが\{最後,さいご\}だと\{知っ,しっ\}たなら\{ ,\}\{持てる,もてる\}\{力,ちから\}\{全て,すべて\}\{ ,\}\{残さ,のこさ\}ずに\{伝え,つたえ\}たい\{ ,\}\{こみ上げ,こみあげ\}た\{記憶,きおく\}\{辿り,たどり\}ながら\{ ,\}こぼれかけた\{涙,なみだ\}\{ ,\}こぼさずに\{歌え,うたえ\}ばいい\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'CUEZERO')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'あぁバイファーザドーペストだあぁ俺たちが今日ゲストだ',
  ruby: 'あぁばいふぁーざどーぺすとだあぁおれたちがきょうげすとだ',
  lyric_with_ruby: 'あぁ\{ ,\}\{バイファーザドーペスト,ばいふぁーざどーぺすと\}だ\{ ,\}あぁ\{ ,\}\{俺,おれ\}たちが\{今日,きょう\}\{ゲスト,げすと\}だ\{ ,\}',
  lyric_order: 6,
)

