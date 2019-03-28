artist_name =    'UL'
lyricUrl_url =   'https://www.utamap.com/showkasi.php?surl=k-150430-121'
cd_name =        'Boys&Gentlemen'
cd_released_at = '2015-04-29'
song_name =      '火の用心'
song_lyricist =  'MCU & LITTLE'
song_composer =  'MCU, LITTLE & The BK Sound'
song_arranger =  'The BK Sound'
cds_name = []
note =           ''

artist = Artist.find_by(name: artist_name) || Artist.create(name: artist_name)
cd = Cd.find_by(name: cd_name) || Cd.create(name: cd_name, released_at: cd_released_at)
lyricUrl = LyricUrl.create(
  url: lyricUrl_url,
  lyric_website_id: LyricWebsite.find_by(name: 'うたまっぷ').id
)
song = Song.create(
  lyric_url_id: lyricUrl.id,
  name: song_name,
  lyricist: song_lyricist,
  composer: song_composer,
  arranger: song_arranger,
  cd_id: cd.id,
  artist_id: artist.id
)
LyricUrlSong.create(
  lyric_url_id: lyricUrl.id,
  song_id: song.id
)
CdSong.create(
  cd_id: cd.id,
  song_id: song.id
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'おれの韻から引火させない鎮火ルービーよりチンカチンカしゃっこいハートに火をつける気をつけろLadies愛撫でもLIVEでもバイブレーションウィ～ンウィ～ン気持ちよくswingswingお互いにwinwin現場は炎上Let\'senjoy正常位&女性上位独りよがりじゃTeenageやる気元気火気厳禁やっぱりLIVEが超大好き外しなよ防災頭巾俺がスキンシップすれば点火火ぃ貸してくれませんか',
  ruby: 'おれのいんからいんかさせないちんかるーびーよりちんかちんかしゃっこいはーとにひをつけるきをつけろれでぃーすあいぶでもらいぶでもばいぶれーしょんうぃーんうぃーんきもちよくすうぃんぐすうぃんぐおたがいにうぃんうぃんげんじょうはえんじょうれっつえんじょいせいじょういあんどじょせいじょういひとりよがりじゃてぃーんえいじやるきげんきかきげんきんやっぱりらいぶがちょうだいすきはずしなよぼうさいずきんおれがすきんしっぷすればてんかひぃかしてくれませんか',
  lyric_with_ruby: 'おれの\{韻,いん\}から\{引火,いんか\}させない\{鎮火,ちんか\}\{ ,\}\{ルービー,るーびー\}より\{チンカチンカ,ちんかちんか\}\{ ,\}しゃっこい\{ハート,はーと\}に\{火,ひ\}をつける\{ ,\}\{気,き\}をつけろ\{ ,\}\{Ladies,れでぃーす\}\{ ,\}\{愛撫,あいぶ\}でも\{ ,\}\{LIVE,らいぶ\}\{ ,\}でも\{ ,\}\{バイブレーション,ばいぶれーしょん\}\{ ,\}\{ウィ,うぃ\}\{～,ー\}\{ンウィ,んうぃ\}\{～,ー\}\{ン,ん\}\{ ,\}\{気持ちよく,きもちよく\}\{ ,\}\{swingswing,すうぃんぐすうぃんぐ\}\{ ,\}\{お互い,おたがい\}に\{ ,\}\{winwin,うぃんうぃん\}\{ ,\}\{現場,げんじょう\}は\{炎上,えんじょう\}\{ ,\}\{Let\'s,れっつ\}\{ ,\}\{enjoy,えんじょい\}\{ ,\}\{正常,せいじょう\}\{位,い\}\{ ,\}\{&,あんど\}\{ ,\}\{女性,じょせい\}\{上位,じょうい\}\{ ,\}\{独りよがり,ひとりよがり\}じゃ\{ ,\}\{Teenage,てぃーんえいじ\}\{ ,\}\{やる気,やるき\}\{元気,げんき\}\{火気,かき\}\{厳禁,げんきん\}\{ ,\}やっぱり\{ ,\}\{LIVE,らいぶ\}\{ ,\}が\{超,ちょう\}\{大好き,だいすき\}\{ ,\}\{外し,はずし\}なよ\{防災,ぼうさい\}\{頭巾,ずきん\}\{ ,\}\{俺,おれ\}が\{スキンシップ,すきんしっぷ\}すれば\{点火,てんか\}\{ ,\}\{火,ひ\}ぃ\{貸し,かし\}てくれませんか\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'ライラライLightMyFireライラライLightMyFireHeatup火燃やすマイク一本火事のもと(Ahh)',
  ruby: 'らいららいらいとまいふぁいあらいららいらいとまいふぁいあひーとあっぷひもやすまいくいっぽんかじのもとあー',
  lyric_with_ruby: '\{ライ,らい\}\{ ,\}\{ラライ,ららい\}\{ ,\}\{Light,らいと\}\{ ,\}\{My,まい\}\{ ,\}\{Fire,ふぁいあ\}\{ ,\}\{ライ,らい\}\{ ,\}\{ラライ,ららい\}\{ ,\}\{Light,らいと\}\{ ,\}\{My,まい\}\{ ,\}\{Fire,ふぁいあ\}\{ ,\}\{Heat,ひーと\}\{ ,\}\{up,あっぷ\}\{ ,\}\{火,ひ\}\{燃やす,もやす\}\{ ,\}\{マイク,まいく\}\{一本,いっぽん\}\{ ,\}\{火事,かじ\}のもと\{ ,\}\{(,\}\{Ahh,あー\}\{),\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'MCU')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'ヒーヒー言わせる(ざんす)ヒーヒーいかせる(ざんす)突っ込むベロベロブラックマイクメラメラズッキュン落雷(サプライズ)だらけでHot柔軟にけれど固めでゴーこすって出して乗っけSayYeah(Yeah)エンユドンスタまだまた乗っけるこれから今宵ガンダムちゃんより燃え上がる(しゃー)どんなお兄さんより燃えるリアルなマイクに酔いどれる言うこと聞かなきゃケツたたく時にはドSなセツナラップ目と目があったらファイヤー今夜一晩限りのブライダル',
  ruby: 'ひーひーいわせるざんすひーひーいかせるざんすつっこむべろべろぶらっくまいくめらめらずっきゅんらくらいさぷらいずだらけでほっとじゅうなんにけれどかためでごーこすってだしてのっけせいいぇーいぇーえんゆどんすたまだまたのっけるこれからこよいがんだむちゃんよりもえあがるしゃーどんなおにいさんよりもえるりあるなまいくによいどれるいうこときかなきゃけつたたくときにはどえすなせつならっぷめとめがあったらふぁいやーこんやひとばんかぎりのぶらいだる',
  lyric_with_ruby: '\{ヒーヒー,ひーひー\}\{言わ,いわ\}せる\{ ,\}\{(,\}ざんす\{),\}\{ ,\}\{ヒーヒー,ひーひー\}いかせる\{ ,\}\{(,\}ざんす\{),\}\{ ,\}\{突っ込む,つっこむ\}\{ベロベロブラックマイク,べろべろぶらっくまいく\}\{ ,\}\{メラメラズッキュン,めらめらずっきゅん\}\{落雷,らくらい\}\{ ,\}\{(,\}\{サプライズ,さぷらいず\}\{),\}\{ ,\}だらけで\{ ,\}\{Hot,ほっと\}\{ ,\}\{柔軟,じゅうなん\}にけれど\{固め,かため\}で\{ゴー,ごー\}\{ ,\}こすって\{出し,だし\}て\{乗っけ,のっけ\}\{ ,\}\{Say,せい\}\{ ,\}\{Yeah,いぇー\}\{ ,\}\{(,\}\{Yeah,いぇー\}\{),\}\{ ,\}\{エンユドンスタ,えんゆどんすた\}\{ ,\}まだまた\{乗っける,のっける\}これから\{ ,\}\{今宵,こよい\}\{ガン,がん\}\{ダム,だむ\}ちゃんより\{燃え上がる,もえあがる\}\{ ,\}\{(,\}しゃー\{),\}\{ ,\}どんなお\{兄さん,にいさん\}より\{燃える,もえる\}\{ ,\}\{リアル,りある\}な\{マイク,まいく\}に\{酔いどれ,よいどれ\}る\{ ,\}\{言う,いう\}こと\{聞か,きか\}なきゃ\{ケツ,けつ\}たたく\{ ,\}\{時には,ときには\}\{ド,ど\}\{ ,\}\{S,えす\}\{ ,\}な\{セツナラップ,せつならっぷ\}\{ ,\}\{目と,めと\}\{目,め\}があったら\{ファイヤー,ふぁいやー\}\{ ,\}\{今夜,こんや\}\{一,ひと\}\{晩,ばん\}\{限り,かぎり\}の\{ブライダル,ぶらいだる\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'ライラライLightMyFireライラライLightMyFireHeatup火燃やすマイク一本火事のもと(Ahh)',
  ruby: 'らいららいらいとまいふぁいあらいららいらいとまいふぁいあひーとあっぷひもやすまいくいっぽんかじのもとあー',
  lyric_with_ruby: '\{ライ,らい\}\{ ,\}\{ラライ,ららい\}\{ ,\}\{Light,らいと\}\{ ,\}\{My,まい\}\{ ,\}\{Fire,ふぁいあ\}\{ ,\}\{ライ,らい\}\{ ,\}\{ラライ,ららい\}\{ ,\}\{Light,らいと\}\{ ,\}\{My,まい\}\{ ,\}\{Fire,ふぁいあ\}\{ ,\}\{Heat,ひーと\}\{ ,\}\{up,あっぷ\}\{ ,\}\{火,ひ\}\{燃やす,もやす\}\{ ,\}\{マイク,まいく\}\{一本,いっぽん\}\{ ,\}\{火事,かじ\}のもと\{ ,\}\{(,\}\{Ahh,あー\}\{),\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'まずはじめにH(H)その次にI(愛)するとHI(火)になるそしてHI(灰)になる突破するファイヤーウォール食らっちまったらタイガーホース隠せるはずないその本能覚醒させる灼熱の炎',
  ruby: 'まずはじめにえっちえっちそのつぎにあいあいするとひになるそしてはいになるとっぱするふぁいやーうぉーるくらっちまったらたいがーほーすかくせるはずないそのほんのうかくせいさせるしゃくねつのほのお',
  lyric_with_ruby: 'まずはじめに\{H,えっち\}\{ ,\}\{(,\}\{H,えっち\}\{),\}\{ ,\}その\{次に,つぎに\}\{I,あい\}\{(,\}\{愛,あい\}\{),\}\{ ,\}すると\{HI(火),ひ\}になる\{ ,\}そして\{HI(灰),はい\}になる\{ ,\}\{突破,とっぱ\}する\{ファイヤーウォール,ふぁいやーうぉーる\}\{ ,\}\{食らっ,くらっ\}ちまったら\{タイガー,たいがー\}\{ホース,ほーす\}\{ ,\}\{隠せる,かくせる\}はずないその\{本能,ほんのう\}\{ ,\}\{覚醒,かくせい\}させる\{灼熱,しゃくねつ\}の\{炎,ほのお\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'MCU')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'アッチッチアッチッチ火傷覚悟のファンキーシット火照った体に突っ込むボーッとしていたらかます10コンボ四方八方言葉とビート攻め立てるよがる大人をリード(ヒート)させる超ガチンコ数万個のテク持ちパーティロック',
  ruby: 'あっちっちあっちっちやけどかくごのふぁんきーしっとほてったからだにつっこむぼーっとしていたらかますじゅうこんぼしほうはっぽうことばとびーとせめたてるよがるおとなをりーどひーとさせるちょうがちんこすうまんこのてくもちぱーてぃろっく',
  lyric_with_ruby: '\{アッチッチアッチッチ,あっちっちあっちっち\}\{ ,\}\{火傷,やけど\}\{覚悟,かくご\}の\{ファンキーシット,ふぁんきーしっと\}\{ ,\}\{火照っ,ほてっ\}た\{体,からだ\}に\{突っ込む,つっこむ\}\{ ,\}\{ボーッ,ぼーっ\}としていたらかます\{ ,\}\{10,じゅう\}\{ ,\}\{コンボ,こんぼ\}\{ ,\}\{四方八方,しほうはっぽう\}\{言葉,ことば\}と\{ビート,びーと\}\{ ,\}\{攻め立てる,せめたてる\}よがる\{大人,おとな\}を\{リード,りーど\}\{ ,\}\{(,\}\{ヒート,ひーと\}\{),\}させる\{超,ちょう\}\{ガチンコ,がちんこ\}\{ ,\}\{数,すう\}\{万,まん\}\{個,こ\}の\{テク,てく\}\{持ち,もち\}\{パーティ,ぱーてぃ\}\{ロック,ろっく\}\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'Burnお前とBurningBurnお前とBurningBurnお前とFallingLove燃えるように火の用心Burnお前とBurningBurnお前とBurningBurnお前とFallingLove燃えるように火の用心',
  ruby: 'ばーんおまえとばーにんぐばーんおまえとばーにんぐばーんおまえとふぉーりんぐらぶもえるようにひのようじんばーんおまえとばーにんぐばーんおまえとばーにんぐばーんおまえとふぉーりんぐらぶもえるようにひのようじん',
  lyric_with_ruby: '\{Burn,ばーん\}\{ ,\}\{お前,おまえ\}と\{Burning,ばーにんぐ\}\{ ,\}\{Burn,ばーん\}\{ ,\}\{お前,おまえ\}と\{Burning,ばーにんぐ\}\{ ,\}\{Burn,ばーん\}\{ ,\}\{お前,おまえ\}と\{ ,\}\{Falling,ふぉーりんぐ\}\{ ,\}\{Love,らぶ\}\{ ,\}\{燃える,もえる\}ように\{火,ひ\}の\{用心,ようじん\}\{ ,\}\{Burn,ばーん\}\{ ,\}\{お前,おまえ\}と\{Burning,ばーにんぐ\}\{ ,\}\{Burn,ばーん\}\{ ,\}\{お前,おまえ\}と\{Burning,ばーにんぐ\}\{ ,\}\{Burn,ばーん\}\{ ,\}\{お前,おまえ\}と\{ ,\}\{Falling,ふぉーりんぐ\}\{ ,\}\{Love,らぶ\}\{ ,\}\{燃える,もえる\}ように\{火,ひ\}の\{用心,ようじん\}\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'ライラライLightMyFireライラライLightMyFireHeatup火燃やすマイク一本火事のもと',
  ruby: 'らいららいらいとまいふぁいあらいららいらいとまいふぁいあひーとあっぷひもやすまいくいっぽんかじのもと',
  lyric_with_ruby: '\{ライ,らい\}\{ ,\}\{ラライ,ららい\}\{ ,\}\{Light,らいと\}\{ ,\}\{My,まい\}\{ ,\}\{Fire,ふぁいあ\}\{ ,\}\{ライ,らい\}\{ ,\}\{ラライ,ららい\}\{ ,\}\{Light,らいと\}\{ ,\}\{My,まい\}\{ ,\}\{Fire,ふぁいあ\}\{ ,\}\{Heat,ひーと\}\{ ,\}\{up,あっぷ\}\{ ,\}\{火,ひ\}\{燃やす,もやす\}\{ ,\}\{マイク,まいく\}\{一本,いっぽん\}\{ ,\}\{火事,かじ\}のもと\{ ,\}',
  lyric_order: 8,
)

