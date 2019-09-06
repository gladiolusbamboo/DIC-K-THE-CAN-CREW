artist_name =    'アスタラビスタ'
lyricUrl_url =   nil
cd_name =        'ヤバスタ'
cd_released_at = '2014-03-26'
song_name =      'seis amigos'
song_lyricist =  'アスタラビスタ'
song_composer =  'アスタラビスタ'
song_arranger =  'DJ ISO'
cds_name = []
note          = 'LITTLE以外の歌い分け省略'

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

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'ウノドストレスクワトロシンコウィの?ウィの?ウィィ!',
  ruby: 'うのどすとれすくわとろしんこうぃのうぃのうぃぃ',
  lyric_with_ruby: '\{ウノ,うの\}\{ ,\}\{ドス,どす\}\{ ,\}\{トレス,とれす\}\{ ,\}\{クワ,くわ\}\{トロ,とろ\}\{ ,\}\{シンコ,しんこ\}\{ ,\}\{ウィ,うぃ\}の\{?,\}\{ ,\}\{ウィ,うぃ\}の\{?,\}\{ ,\}\{ウィィ,うぃぃ\}\{!,\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '問題問題ウノドストレス問題問題クワトロシンコウィの?ウィィ!問題問題ウノドストレス問題問題ウノドストレスクワトロシンコ',
  ruby: 'もんだいもんだいうのどすとれすもんだいもんだいくわとろしんこうぃのうぃぃもんだいもんだいうのどすとれすもんだいもんだいうのどすとれすくわとろしんこ',
  lyric_with_ruby: '\{問題,もんだい\}\{ ,\}\{問題,もんだい\}\{ ,\}\{ウノ,うの\}\{ ,\}\{ドス,どす\}\{ ,\}\{トレス,とれす\}\{ ,\}\{問題,もんだい\}\{ ,\}\{問題,もんだい\}\{ ,\}\{クワ,くわ\}\{トロ,とろ\}\{ ,\}\{シンコ,しんこ\}\{ ,\}\{ウィ,うぃ\}の\{?,\}\{ ,\}\{ウィィ,うぃぃ\}\{!,\}\{ ,\}\{問題,もんだい\}\{ ,\}\{問題,もんだい\}\{ ,\}\{ウノ,うの\}\{ ,\}\{ドス,どす\}\{ ,\}\{トレス,とれす\}\{ ,\}\{問題,もんだい\}\{ ,\}\{問題,もんだい\}\{ ,\}\{ウノ,うの\}\{ ,\}\{ドス,どす\}\{ ,\}\{トレス,とれす\}\{ ,\}\{クワ,くわ\}\{トロ,とろ\}\{ ,\}\{シンコ,しんこ\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'ウノまずアスタラmoveon三宿的なやらかしムーチョしようがしまいがお構い無く毎夜解禁のナンちゃらヌーボバリに洒落てなくて良いただ目の前チャイチィプレイストゥビー喉が焦げるくらいエスニック振る舞う激辛セットリスト',
  ruby: 'うのまずあすたらむーぶおんみしゅくてきなやらかしむーちょしようがしまいがおかまいなくまいよかいきんのなんちゃらぬーぼばりにしゃれてなくていいただめのまえちゃいちぃぷれいすとぅびーのどがこげるくらいえすにっくふるまうげきからせっとりすと',
  lyric_with_ruby: '\{ウノ,うの\}\{ ,\}まず\{アスタラ,あすたら\}\{ ,\}\{move,むーぶ\}\{ ,\}\{on,おん\}\{ ,\}\{三宿,みしゅく\}\{的,てき\}なやらかし\{ムーチョ,むーちょ\}\{ ,\}しようがしまいが\{お構い,おかまい\}\{無く,なく\}\{ ,\}\{毎夜,まいよ\}\{解禁,かいきん\}の\{ナン,なん\}ちゃら\{ヌーボ,ぬーぼ\}\{ ,\}\{バリ,ばり\}に\{洒落,しゃれ\}てなくて\{良い,いい\}\{ ,\}ただ\{目,め\}の\{前,まえ\}\{チャイチィプレイストゥビー,ちゃいちぃぷれいすとぅびー\}\{ ,\}\{喉,のど\}が\{焦げる,こげる\}くらい\{エスニック,えすにっく\}\{ ,\}\{振る舞う,ふるまう\}\{激辛,げきから\}\{セット,せっと\}\{リスト,りすと\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'ドス2つ目のショットグラス軽く流し込んだらまずはマイクケーブルからスピーカー経由@三宿から「アミーゴ」でsignupフェイドイン胃袋ストマックバウト的射抜く様まるでシルクドゥソレイユばりに妖艶にYouandme飲みーのウィィ!',
  ruby: 'どすふたつめのしょっとぐらすかるくながしこんだらまずはまいくけーぶるからすぴーかーけいゆみしゅくからあみーごでさいんあっぷふぇいどいんいぶくろすとまっくばうとてきいぬくようまるでしるくどぅそれいゆばりにようえんにゆーあんどみーのみーのうぃぃ',
  lyric_with_ruby: '\{ドス,どす\}\{ ,\}\{2,ふた\}つ\{目,め\}の\{ショット,しょっと\}\{グラス,ぐらす\}\{ ,\}\{軽く,かるく\}\{流し込ん,ながしこん\}だらまずは\{ ,\}\{マイク,まいく\}\{ケーブル,けーぶる\}から\{スピーカー,すぴーかー\}\{経由,けいゆ\}\{ ,\}\{@,\}\{三宿,みしゅく\}から\{「,\}\{アミーゴ,あみーご\}\{」,\}で\{sign,さいん\}\{ ,\}\{up,あっぷ\}\{ ,\}\{フェイドイン,ふぇいどいん\}\{ ,\}\{胃袋,いぶくろ\}\{ ,\}\{ストマックバウト,すとまっくばうと\}\{的,てき\}\{ ,\}\{射抜く,いぬく\}\{様,よう\}\{ ,\}まるで\{シルクドゥソレイユ,しるくどぅそれいゆ\}ばりに\{妖艶,ようえん\}に\{ ,\}\{You,ゆー\}\{ ,\}\{and,あんど\}\{ ,\}\{me,みー\}\{ ,\}\{飲み,のみ\}ーの\{ウィィ,うぃぃ\}\{!,\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'ウノドストレスクワトロシンコウィの?ウィの?ウィィ!',
  ruby: 'うのどすとれすくわとろしんこうぃのうぃのうぃぃ',
  lyric_with_ruby: '\{ウノ,うの\}\{ ,\}\{ドス,どす\}\{ ,\}\{トレス,とれす\}\{ ,\}\{クワ,くわ\}\{トロ,とろ\}\{ ,\}\{シンコ,しんこ\}\{ ,\}\{ウィ,うぃ\}の\{?,\}\{ ,\}\{ウィ,うぃ\}の\{?,\}\{ ,\}\{ウィィ,うぃぃ\}\{!,\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: '問題問題ウノドストレス問題問題クワトロシンコウィの?ウィィ!問題問題ウノドストレス問題問題ウノドストレスクワトロシンコ',
  ruby: 'もんだいもんだいうのどすとれすもんだいもんだいくわとろしんこうぃのうぃぃもんだいもんだいうのどすとれすもんだいもんだいうのどすとれすくわとろしんこ',
  lyric_with_ruby: '\{問題,もんだい\}\{ ,\}\{問題,もんだい\}\{ ,\}\{ウノ,うの\}\{ ,\}\{ドス,どす\}\{ ,\}\{トレス,とれす\}\{ ,\}\{問題,もんだい\}\{ ,\}\{問題,もんだい\}\{ ,\}\{クワ,くわ\}\{トロ,とろ\}\{ ,\}\{シンコ,しんこ\}\{ ,\}\{ウィ,うぃ\}の\{?,\}\{ ,\}\{ウィィ,うぃぃ\}\{!,\}\{ ,\}\{問題,もんだい\}\{ ,\}\{問題,もんだい\}\{ ,\}\{ウノ,うの\}\{ ,\}\{ドス,どす\}\{ ,\}\{トレス,とれす\}\{ ,\}\{問題,もんだい\}\{ ,\}\{問題,もんだい\}\{ ,\}\{ウノ,うの\}\{ ,\}\{ドス,どす\}\{ ,\}\{トレス,とれす\}\{ ,\}\{クワ,くわ\}\{トロ,とろ\}\{ ,\}\{シンコ,しんこ\}\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'トレス3つ目チョイ飲んでなんて冗談もっとぶっ込むべアスタラ飲み番長逃がさんぞこっからがワンマンショータイトなビーツにねじ込む様にヤバスタとマイク持ってISing今日もここで寝るパティーン。。。',
  ruby: 'とれすみっつめちょいのんでなんてじょうだんもっとぶっこむべあすたらのみばんちょうにがさんぞこっからがわんまんしょーたいとなびーつにねじこむようにやばすたとまいくもってあいしんぐきょうもここでねるぱてぃーん',
  lyric_with_ruby: '\{トレス,とれす\}\{ ,\}\{3,みっ\}つ\{目,め\}\{チョイ,ちょい\}\{飲ん,のん\}で\{ ,\}なんて\{冗談,じょうだん\}もっとぶっ\{込む,こむ\}べ\{ ,\}\{アスタラ,あすたら\}\{飲み,のみ\}\{番長,ばんちょう\}\{逃がさ,にがさ\}んぞ\{ ,\}こっからが\{ワンマン,わんまん\}\{ショー,しょー\}\{ ,\}\{タイト,たいと\}な\{ビーツ,びーつ\}に\{ねじ込む,ねじこむ\}\{様,よう\}に\{ ,\}\{ヤバスタ,やばすた\}と\{マイク,まいく\}\{持っ,もっ\}て\{ ,\}\{I,あい\}\{ ,\}\{Sing,しんぐ\}\{ ,\}\{今日,きょう\}もここで\{寝る,ねる\}\{パティーン,ぱてぃーん\}\{。,\}\{。,\}\{。,\}\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'クアトロ4番目蔵本チョビ髭軍団ですどうもコモエスタス元気ですかセニョリータス?ロスインディオスな大人と酔いしれたい赤坂辺り君のデルコラソン抱きしめたいロマンチックあげるよIgotfewshotsleftまたノンデノマレル',
  ruby: 'くあとろよんばんめくらもとちょびひげぐんだんですどうもこもえすたすげんきですかせにょりーたすろすいんでぃおすなおとなとよいしれたいあかさかあたりきみのでるこらそんだきしめたいろまんちっくあげるよあいごっとふゅーしょっつれふとまたのんでのまれる',
  lyric_with_ruby: '\{クアトロ,くあとろ\}\{ ,\}\{4,よん\}\{番目,ばんめ\}\{蔵本,くらもと\}\{ ,\}\{チョビ,ちょび\}\{髭,ひげ\}\{軍団,ぐんだん\}ですどうも\{ ,\}\{コモエスタス,こもえすたす\}\{ ,\}\{元気,げんき\}ですか\{セニョリータス,せにょりーたす\}\{?,\}\{ ,\}\{ロス,ろす\}\{インディ,いんでぃ\}\{オス,おす\}な\{大人,おとな\}と\{酔いしれ,よいしれ\}たい\{ ,\}\{赤坂,あかさか\}\{辺り,あたり\}\{ ,\}\{君,きみ\}の\{デルコラソン,でるこらそん\}\{抱きしめ,だきしめ\}たい\{ ,\}\{ロマンチック,ろまんちっく\}あげるよ\{ ,\}\{I,あい\}\{ ,\}\{got,ごっと\}\{ ,\}\{few,ふゅー\}\{ ,\}\{shots,しょっつ\}\{ ,\}\{left,れふと\}\{ ,\}また\{ノンデノマレル,のんでのまれる\}\{ ,\}',
  lyric_order: 8,
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 5,
  lyric: 'シンコ人生はガチンコ遊ぼうぜアミーゴとりあえずちゃっちゃいちーのグッと飲み干したらIfeelsogoodyeah集まりなheyマタドールohマルガリータここがどこかはわかんないがテキーラこのままサンライズまでGO!',
  ruby: 'しんこじんせいはがちんこあそぼうぜあみーごとりあえずちゃっちゃいちーのぐっとのみほしたらあいふぃーるそーぐっどいぇーあつまりなへいまたどーるおーまるがりーたここがどこかはわかんないがてきーらこのままさんらいずまでごー',
  lyric_with_ruby: '\{シンコ,しんこ\}\{ ,\}\{人生,じんせい\}は\{ガチンコ,がちんこ\}\{遊ぼ,あそぼ\}うぜ\{アミーゴ,あみーご\}\{ ,\}とりあえずちゃっちゃいちーの\{ ,\}\{グッ,ぐっ\}と\{飲み干し,のみほし\}たら\{ ,\}\{I,あい\}\{ ,\}\{feel,ふぃーる\}\{ ,\}\{so,そー\}\{ ,\}\{good,ぐっど\}\{ ,\}\{yeah,いぇー\}\{ ,\}\{集まり,あつまり\}な\{ ,\}\{hey,へい\}\{ ,\}\{マタドール,またどーる\}\{ ,\}\{oh,おー\}\{ ,\}\{マルガリータ,まるがりーた\}\{ ,\}ここがどこかはわかんないが\{ ,\}\{テキーラ,てきーら\}\{ ,\}このまま\{サンライズ,さんらいず\}まで\{ ,\}\{GO,ごー\}\{!,\}\{ ,\}',
  lyric_order: 9,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 5,
  lyric: 'ウノドストレスクワトロシンコウィの?ウィの?ウィィ!',
  ruby: 'うのどすとれすくわとろしんこうぃのうぃのうぃぃ',
  lyric_with_ruby: '\{ウノ,うの\}\{ ,\}\{ドス,どす\}\{ ,\}\{トレス,とれす\}\{ ,\}\{クワ,くわ\}\{トロ,とろ\}\{ ,\}\{シンコ,しんこ\}\{ ,\}\{ウィ,うぃ\}の\{?,\}\{ ,\}\{ウィ,うぃ\}の\{?,\}\{ ,\}\{ウィィ,うぃぃ\}\{!,\}\{ ,\}',
  lyric_order: 10,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 6,
  lyric: '問題問題ウノドストレス問題問題クワトロシンコウィの?ウィィ!問題問題ウノドストレス問題問題ウノドストレスクワトロシンコ',
  ruby: 'もんだいもんだいうのどすとれすもんだいもんだいくわとろしんこうぃのうぃぃもんだいもんだいうのどすとれすもんだいもんだいうのどすとれすくわとろしんこ',
  lyric_with_ruby: '\{問題,もんだい\}\{ ,\}\{問題,もんだい\}\{ ,\}\{ウノ,うの\}\{ ,\}\{ドス,どす\}\{ ,\}\{トレス,とれす\}\{ ,\}\{問題,もんだい\}\{ ,\}\{問題,もんだい\}\{ ,\}\{クワ,くわ\}\{トロ,とろ\}\{ ,\}\{シンコ,しんこ\}\{ ,\}\{ウィ,うぃ\}の\{?,\}\{ ,\}\{ウィィ,うぃぃ\}\{!,\}\{ ,\}\{問題,もんだい\}\{ ,\}\{問題,もんだい\}\{ ,\}\{ウノ,うの\}\{ ,\}\{ドス,どす\}\{ ,\}\{トレス,とれす\}\{ ,\}\{問題,もんだい\}\{ ,\}\{問題,もんだい\}\{ ,\}\{ウノ,うの\}\{ ,\}\{ドス,どす\}\{ ,\}\{トレス,とれす\}\{ ,\}\{クワ,くわ\}\{トロ,とろ\}\{ ,\}\{シンコ,しんこ\}\{ ,\}',
  lyric_order: 11,
)

