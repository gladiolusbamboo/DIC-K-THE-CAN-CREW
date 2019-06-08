artist_name =    'BY PHAR THE DOPEST'
lyricUrl_url =   'https://www.utamap.com/showkasi.php?surl=B20384'
cd_name =        'だからどうした!'
cd_released_at = '2006-12-31'
song_name =      'YEAAAH!'
song_lyricist =  'BY PHAR THE DOPEST'
song_composer =  'BY PHAR THE DOPEST & ROB PARISSI'
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

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '小さな声では聞こえないだけど大きな声で言うほどじゃない',
  ruby: 'ちいさなこえではきこえないだけどおおきなこえでいうほどじゃない',
  lyric_with_ruby: '\{小さな,ちいさな\}\{声,こえ\}では\{聞こえ,きこえ\}ない\{ ,\}だけど\{大きな,おおきな\}\{声,こえ\}で\{言う,いう\}ほどじゃない\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'YEAAAH!',
  ruby: 'いぇー',
  lyric_with_ruby: '\{YEAAAH,いぇー\}\{!,\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '集合時間が適当(HO!)大盛況なのに適度に混む隠れ家みたいなV.I.P.cuteな女性いっぱいいるDJかけてる新譜いい感じ混ぜてくれるクラシックたまにソファでゆったりヘッベングtuneかけてっぺん越えたら美人達と踊るmellowgrooveまるでM.U.R.Oのdiggin\'ice軽くえっへんと張った胸を打つ手を振るのはモデルか女優かね?全然なくていいの?あとくされ遊ぶだけ遊んでOK?おまけに帰り車で送迎!?',
  ruby: 'しゅうごうじかんがてきとうほーだいせいきょうなのにてきどにこむかくれがみたいなぶいあいぴーきゅーとなじょせいいっぱいいるでぃーじぇーかけてるしんぷいいかんじまぜてくれるくらしっくたまにそふぁでゆったりへっべんぐちゅーんかけてっぺんこえたらびじんたちとおどるめろーぐるーぶまるでえむゆーあーるおーのでぃぎんあいすかるくえっへんとはったむねをうつてをふるのはもでるかじょゆうかねぜんぜんなくていいのあとくされあそぶだけあそんでおーけーおまけにかえりくるまでそうげい',
  lyric_with_ruby: '\{集合,しゅうごう\}\{時間,じかん\}が\{適当,てきとう\}\{(,\}\{HO,ほー\}\{!),\}\{ ,\}\{大,だい\}\{盛況,せいきょう\}なのに\{適度,てきど\}に\{混む,こむ\}\{ ,\}\{隠れ家,かくれが\}みたいな\{V,ぶい\}\{.,\}\{I,あい\}\{.,\}\{P,ぴー\}\{.,\}\{ ,\}\{cute,きゅーと\}な\{女性,じょせい\}\{ ,\}いっぱいいる\{ ,\}\{DJ,でぃーじぇー\}かけてる\{新譜,しんぷ\}\{ ,\}いい\{感じ,かんじ\}\{混ぜ,まぜ\}てくれる\{クラシック,くらしっく\}\{ ,\}たまに\{ソファ,そふぁ\}でゆったり\{ ,\}\{ヘッベング,へっべんぐ\}\{ ,\}\{tune,ちゅーん\}\{ ,\}かけてっぺん\{越え,こえ\}たら\{ ,\}\{美人,びじん\}\{達,たち\}と\{踊る,おどる\}\{mellow,めろー\}\{ ,\}\{groove,ぐるーぶ\}\{ ,\}まるで\{M,えむ\}\{.,\}\{U,ゆー\}\{.,\}\{R,あーる\}\{.,\}\{O,おー\}の\{diggin,でぃぎん\}\{\',\}\{ice,あいす\}\{ ,\}\{軽く,かるく\}えっへんと\{張っ,はっ\}た\{胸,むね\}を\{打つ,うつ\}\{ ,\}\{手,て\}を\{振る,ふる\}のは\{モデル,もでる\}か\{女優,じょゆう\}かね\{?,\}\{ ,\}\{全然,ぜんぜん\}なくていいの\{?,\}\{ ,\}あとくされ\{ ,\}\{遊ぶ,あそぶ\}だけ\{遊ん,あそん\}で\{OK,おーけー\}\{?,\}\{ ,\}おまけに\{帰り,かえり\}\{ ,\}\{車,くるま\}で\{送迎,そうげい\}\{!?,\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'YEAAAH!',
  ruby: 'いぇー',
  lyric_with_ruby: '\{YEAAAH,いぇー\}\{!,\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'CUEZERO')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '好きにさせろ!YoDr.K&Mr.ZERO退屈させんな次々かけろYoDJ!今夜もいい月が出そうやっぱしぶいノリじゃん共有しようぜ至福の今お待たせバイファーラップの時間肌はイエローノリは真っ黒い奴フロアの熱気とは裏腹にバーカウンターの方で胸騒ぎ東西南北商売繁盛ロックしてV.I.P.で豪華にやんよ男子(YEAH)女子(YEAH)感じ過ぎ思わず失禁固い話はとりあえず置いとこうよ理想の着地この恋心',
  ruby: 'すきにさせろよーどくたーけーあんどみすたーぜろたいくつさせんなつぎつぎかけろよーでぃーじぇーこんやもいいつきがでそうやっぱしぶいのりじゃんきょうゆうしようぜしふくのいまおまたせばいふぁーらっぷのじかんはだはいえろーのりはまっくろいやつふろあのねっきとはうらはらにばーかうんたーのほうでむなさわぎとうざいなんぼくしょうばいはんじょうろっくしてびっぷでごうかにやんよだんしいぇーじょしいぇーかんじすぎおもわずしっきんかたいはなしはとりあえずおいとこうよりそうのちゃくちこのこいごころ',
  lyric_with_ruby: '\{好き,すき\}にさせろ\{!,\}\{ ,\}\{Yo,よー\}\{ ,\}\{Dr,どくたー\}\{.,\}\{K,けー\}\{ ,\}\{&,あんど\}\{ ,\}\{Mr,みすたー\}\{.,\}\{ZERO,ぜろ\}\{ ,\}\{退屈,たいくつ\}させんな\{ ,\}\{次々,つぎつぎ\}かけろ\{ ,\}\{Yo,よー\}\{ ,\}\{DJ,でぃーじぇー\}\{!,\}\{ ,\}\{今夜,こんや\}もいい\{月,つき\}が\{出,で\}そう\{ ,\}やっぱしぶい\{ノリ,のり\}じゃん\{ ,\}\{共有,きょうゆう\}しようぜ\{至福,しふく\}の\{今,いま\}\{ ,\}お\{待た,また\}せ\{バイ,ばい\}\{ファー,ふぁー\}\{ ,\}\{ラップ,らっぷ\}の\{時間,じかん\}\{ ,\}\{肌,はだ\}は\{イエロー,いえろー\}\{ ,\}\{ノリ,のり\}は\{真っ黒い,まっくろい\}\{奴,やつ\}\{ ,\}\{フロア,ふろあ\}の\{熱気,ねっき\}とは\{裏腹,うらはら\}に\{ ,\}\{バー,ばー\}\{カウンター,かうんたー\}の\{方,ほう\}で\{胸騒ぎ,むなさわぎ\}\{ ,\}\{東西,とうざい\}\{南北,なんぼく\}\{ ,\}\{商売,しょうばい\}\{繁盛,はんじょう\}\{ ,\}\{ロック,ろっく\}して\{V.I.P,びっぷ\}\{.,\}で\{豪華,ごうか\}にやんよ\{ ,\}\{男子,だんし\}\{(,\}\{YEAH,いぇー\}\{),\}\{女子,じょし\}\{(,\}\{YEAH,いぇー\}\{),\}\{感じ,かんじ\}\{過ぎ,すぎ\}\{思わず,おもわず\}\{失禁,しっきん\}\{ ,\}\{固い,かたい\}\{話,はなし\}はとりあえず\{置い,おい\}とこうよ\{ ,\}\{理想,りそう\}の\{着地,ちゃくち\}\{ ,\}この\{恋心,こいごころ\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'YEAAAH!',
  ruby: 'いぇー',
  lyric_with_ruby: '\{YEAAAH,いぇー\}\{!,\}\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'これ知る人ぞ知る皆安心な感じでALLNIGHTLONG進んでくBIGなPARTYピースな感じ男女比4:6(YEAH)DJ魅せるこだわり大騒ぎせずに今日も小騒ぎ踊って(YEAH)歌って(YEAH)そんで首降んな自由に',
  ruby: 'これしるひとぞしるみなあんしんなかんじでおーるないとろんぐすすんでくびっぐなぱーてぃーぴーすなかんじだんじょひよんたいろくいぇーでぃーじぇーみせるこだわりおおさわぎせずにきょうもこさわぎおどっていぇーうたっていぇーそんでくびふんなじゆうに',
  lyric_with_ruby: 'これ\{知る,しる\}\{人,ひと\}ぞ\{知る,しる\}\{皆,みな\}\{安心,あんしん\}な\{感じ,かんじ\}で\{ALL,おーる\}\{ ,\}\{NIGHT,ないと\}\{ ,\}\{LONG,ろんぐ\}\{ ,\}\{進ん,すすん\}でく\{BIG,びっぐ\}な\{PARTY,ぱーてぃー\}\{ ,\}\{ピース,ぴーす\}な\{感じ,かんじ\}\{ ,\}\{男女,だんじょ\}\{比,ひ\}\{4,よん\}\{:,たい\}\{6,ろく\}\{(,\}\{YEAH,いぇー\}\{),\}\{ ,\}\{DJ,でぃーじぇー\}\{魅せる,みせる\}こだわり\{ ,\}\{大騒ぎ,おおさわぎ\}せずに\{ ,\}\{今日,きょう\}も\{小,こ\}\{騒ぎ,さわぎ\}\{ ,\}\{踊っ,おどっ\}て\{(,\}\{YEAH,いぇー\}\{),\}\{歌っ,うたっ\}て\{(,\}\{YEAH,いぇー\}\{),\}そんで\{首,くび\}\{降ん,ふん\}な\{ ,\}\{自由,じゆう\}に\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'CUEZERO')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'もうつまんねーもめごと起こすなよ(YEAH)バットなバイブス残すなよ(YEAH)あんま塗らないで見せろ素顔その素材はなに?再スタート!斬新な宣言もうブーイングすら吸引全て吸い込む作戦遂行中チャッと終わらし戻ろうスウィートルーム',
  ruby: 'もうつまんねーもめごとおこすなよいぇーばっとなばいぶすのこすなよいぇーあんまぬらないでみせろすがおそのそざいはなにさいすたーとざんしんなせんげんもうぶーいんぐすらきゅういんすべてすいこむさくせんすいこうちゅうちゃっとおわらしもどろうすうぃーとるーむ',
  lyric_with_ruby: 'もうつまんねーもめごと\{起こす,おこす\}なよ\{(,\}\{YEAH,いぇー\}\{),\}\{ ,\}\{バット,ばっと\}な\{バイ,ばい\}\{ブス,ぶす\}\{残す,のこす\}なよ\{(,\}\{YEAH,いぇー\}\{),\}\{ ,\}あんま\{塗ら,ぬら\}ないで\{見せろ,みせろ\}\{素顔,すがお\}\{ ,\}その\{素材,そざい\}はなに\{?,\}\{ ,\}\{再,さい\}\{スタート,すたーと\}\{!,\}\{ ,\}\{斬新,ざんしん\}な\{宣言,せんげん\}\{ ,\}もう\{ブーイング,ぶーいんぐ\}すら\{吸引,きゅういん\}\{ ,\}\{全て,すべて\}\{吸い込む,すいこむ\}\{作戦,さくせん\}\{遂行,すいこう\}\{中,ちゅう\}\{ ,\}\{チャッ,ちゃっ\}と\{終わらし,おわらし\}\{戻ろ,もどろ\}う\{スウィートルーム,すうぃーとるーむ\}\{ ,\}',
  lyric_order: 8,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'YEAAAH!',
  ruby: 'いぇー',
  lyric_with_ruby: '\{YEAAAH,いぇー\}\{!,\}\{ ,\}',
  lyric_order: 9,
)

