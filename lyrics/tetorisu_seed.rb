artist_name =    ''
lyricUrl_url =   ''
cd_name =        ''
cd_released_at = ''
song_name =      ''
song_lyricist =  ''
song_composer =  ''
song_arranger =  ''
cds_name = []

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
  lyric: 'まるで難解なパズルだな小さな嘘ついた夜の明くる朝狂った歯車がグルグル回る悪魔がクスクス笑う次から次に罪に罪を積み重ね嫌な顔して嘘を嘘で塗り固めクソはクソで最早水に流せるレベルじゃないと気づきやがて来るであろう破滅を想像して眺めるはバベルの塔こうして見てみれば手抜きツギハギだらけ流行りの言葉を繰り返しただけPlayBackAgainおまえにも言っとくぜ真っ直ぐ真っ直ぐ進め一直線そうすればきっと何度だって立て直せる新たな姿でNowOnSale',
  ruby: 'まるでなんかいなぱずるだなちいさなうそついたよるのあくるあさくるったはぐるまがぐるぐるまわるあくまがくすくすわらうつぎからつぎにつみにつみをつみかさねいやなかおしてうそをうそでぬりかためくそはくそでもはやみずにながせるれべるじゃないときづきやがてくるであろうはめつをそうぞうしてながめるはばべるのとうこうしてみてみればてぬきつぎはぎだらけはやりのことばをくりかえしただけぷれーばっくあげいんおまえにもいっとくぜまっすぐまっすぐすすめいっちょくせんそうすればきっとなんどだってたてなおせるあらたなすがたでなうおんせーる',
  lyric_with_ruby: 'まるで\{難解,なんかい\}な\{パズル,ぱずる\}だな\{ ,\}\{小さな,ちいさな\}\{嘘,うそ\}ついた\{夜,よる\}の\{明,あ\}くる\{朝,あさ\}\{ ,\}\{狂っ,くるっ\}た\{歯車,はぐるま\}が\{グルグル,ぐるぐる\}\{回る,まわる\}\{ ,\}\{悪魔,あくま\}が\{クス,くす\}\{クス,くす\}\{笑う,わらう\}\{ ,\}\{次,つぎ\}から\{次に,つぎに\}\{罪,つみ\}に\{罪,つみ\}を\{積み重ね,つみかさね\}\{ ,\}\{嫌,いや\}な\{顔,かお\}して\{嘘,うそ\}を\{嘘,うそ\}で\{塗り,ぬり\}\{固め,かため\}\{ ,\}\{クソ,くそ\}は\{クソ,くそ\}で\{最早,もはや\}\{水,みず\}に\{流せる,ながせる\}\{ ,\}\{レベル,れべる\}じゃないと\{気づき,きづき\}\{ ,\}やがて\{来る,くる\}であろう\{破滅,はめつ\}を\{想像,そうぞう\}して\{ ,\}\{眺める,ながめる\}は\{バベルの塔,ばべるのとう\}\{ ,\}こうして\{見,み\}てみれば\{手抜き,てぬき\}\{ツギ,つぎ\}\{ハギ,はぎ\}だらけ\{ ,\}\{流行り,はやり\}の\{言葉,ことば\}を\{繰り返し,くりかえし\}ただけ\{ ,\}\{Play,ぷれー\}\{ ,\}\{Back,ばっく\}\{ ,\}\{Again,あげいん\}\{ ,\}おまえにも\{言っ,いっ\}とくぜ\{ ,\}\{真っ直ぐ,まっすぐ\}\{真っ直ぐ,まっすぐ\}\{進め,すすめ\}\{一直線,いっちょくせん\}\{ ,\}そうすればきっと\{何,なん\}\{度,ど\}だって\{立て直せる,たてなおせる\}\{ ,\}\{新た,あらた\}な\{姿,すがた\}で\{ ,\}\{Now,なう\}\{ ,\}\{On,おん\}\{ ,\}\{Sale,せーる\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '雨はいつまでも降りやまずに画面の中では問題山積み楽に解けないカラクリからクリアしたら明日は花火の下',
  ruby: 'あめはいつまでもふりやまずにがめんのなかではもんだいやまづみらくにとけないからくりからくりあしたらあしたははなびのした',
  lyric_with_ruby: '\{雨,あめ\}はいつまでも\{降り,ふり\}やまずに\{ ,\}\{画面,がめん\}の\{中,なか\}では\{問題,もんだい\}\{山積み,やまづみ\}\{ ,\}\{楽,らく\}に\{解け,とけ\}ない\{カラクリ,からくり\}から\{ ,\}\{クリア,くりあ\}したら\{明日,あした\}は\{花火,はなび\}の\{下,した\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'MCU')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '始まりは何にもないさら地から生まれ落ちる魂一歩一歩歩きだすその手足感じる未知なる世界時に邪魔してくる様々な形から色々学び積み重ねる夢と希望の数だけ上を見ようよヘッコンだってプラス思考で埋めてけラフにGo(Go)何度だって挑戦は自由無限なるコンティニューたとえ歪な形こんなはずじゃでも立て直せるはずさ君のポッカリあいたそんな隙間に天使が矢を落とす',
  ruby: 'はじまりはなんにもないさらちからうまれおちるたましいいっぽいっぽあるきだすそのてあしかんじるみちなるせかいときにじゃましてくるさまざまなかたちからいろいろまなびつみかさねるゆめときぼうのかずだけうえをみようよへっこんだってぷらすしこうでうめてけらふにごーごーなんどだってちょうせんはじゆうむげんなるこんてぃにゅーたとえいびつなかたちこんなはずじゃでもたてなおせるはずさきみのぽっかりあいたそんなすきまにてんしがやをおとす',
  lyric_with_ruby: '\{始まり,はじまり\}は\{何,なん\}にもない\{さら地,さらち\}から\{生まれ落ちる,うまれおちる\}\{魂,たましい\}\{ ,\}\{一歩,いっぽ\}\{一歩,いっぽ\}\{歩き,あるき\}だすその\{手足,てあし\}\{感じる,かんじる\}\{未知,みち\}なる\{世界,せかい\}\{ ,\}\{時に,ときに\}\{邪魔,じゃま\}してくる\{様々,さまざま\}な\{形,かたち\}から\{色々,いろいろ\}\{学び,まなび\}\{ ,\}\{積み重ねる,つみかさねる\}\{夢,ゆめ\}と\{希望,きぼう\}の\{数,かず\}だけ\{上,うえ\}を\{見よ,みよ\}うよ\{ ,\}\{ヘッコン,へっこん\}だって\{プラス,ぷらす\}\{思考,しこう\}で\{埋め,うめ\}てけ\{ラフ,らふ\}に\{ ,\}\{Go,ごー\}\{(,\}\{Go,ごー\}\{),\}\{ ,\}\{何,なん\}\{度,ど\}だって\{挑戦,ちょうせん\}は\{自由,じゆう\}\{ ,\}\{無限,むげん\}なる\{コンティニュー,こんてぃにゅー\}\{ ,\}たとえ\{歪,いびつ\}な\{形,かたち\}こんなはずじゃ\{ ,\}でも\{立て直せる,たてなおせる\}はずさ\{ ,\}\{君,きみ\}の\{ポッカリ,ぽっかり\}あいたそんな\{隙間,すきま\}に\{ ,\}\{天使,てんし\}が\{矢,や\}を\{落とす,おとす\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '雨はいつまでも降りやまずに画面の中では問題山積み楽に解けないカラクリからクリアしたら明日は花火の下',
  ruby: 'あめはいつまでもふりやまずにがめんのなかではもんだいやまづみらくにとけないからくりからくりあしたらあしたははなびのした',
  lyric_with_ruby: '\{雨,あめ\}はいつまでも\{降り,ふり\}やまずに\{ ,\}\{画面,がめん\}の\{中,なか\}では\{問題,もんだい\}\{山積み,やまづみ\}\{ ,\}\{楽,らく\}に\{解け,とけ\}ない\{カラクリ,からくり\}から\{ ,\}\{クリア,くりあ\}したら\{明日,あした\}は\{花火,はなび\}の\{下,した\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '雨はいつまでも降りやまずに画面の中では問題山積み楽に解けないカラクリからクリアしたら明日は花火の下',
  ruby: 'あめはいつまでもふりやまずにがめんのなかではもんだいやまづみらくにとけないからくりからくりあしたらあしたははなびのした',
  lyric_with_ruby: '\{雨,あめ\}はいつまでも\{降り,ふり\}やまずに\{ ,\}\{画面,がめん\}の\{中,なか\}では\{問題,もんだい\}\{山積み,やまづみ\}\{ ,\}\{楽,らく\}に\{解け,とけ\}ない\{カラクリ,からくり\}から\{ ,\}\{クリア,くりあ\}したら\{明日,あした\}は\{花火,はなび\}の\{下,した\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: '雨はいつまでも降りやまずに画面の中では問題山積み楽に解けないカラクリからクリアしたら明日は花火の下',
  ruby: 'あめはいつまでもふりやまずにがめんのなかではもんだいやまづみらくにとけないからくりからくりあしたらあしたははなびのした',
  lyric_with_ruby: '\{雨,あめ\}はいつまでも\{降り,ふり\}やまずに\{ ,\}\{画面,がめん\}の\{中,なか\}では\{問題,もんだい\}\{山積み,やまづみ\}\{ ,\}\{楽,らく\}に\{解け,とけ\}ない\{カラクリ,からくり\}から\{ ,\}\{クリア,くりあ\}したら\{明日,あした\}は\{花火,はなび\}の\{下,した\}\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 5,
  lyric: '(Lifeisgame)雨はいつまでも降りやまずに画面の中では問題山積み(Lifeisgame)楽に解けないカラクリからクリアしたら明日は花火の下で',
  ruby: 'らいふいずげーむあめはいつまでもふりやまずにがめんのなかではもんだいやまづみらいふいずげーむらくにとけないからくりからくりあしたらあしたははなびのしたで',
  lyric_with_ruby: '\{(,\}\{Life,らいふ\}\{ ,\}\{is,いず\}\{ ,\}\{game,げーむ\}\{),\}\{ ,\}\{雨,あめ\}はいつまでも\{降り,ふり\}やまずに\{ ,\}\{画面,がめん\}の\{中,なか\}では\{問題,もんだい\}\{山積み,やまづみ\}\{ ,\}\{(,\}\{Life,らいふ\}\{ ,\}\{is,いず\}\{ ,\}\{game,げーむ\}\{),\}\{ ,\}\{楽,らく\}に\{解け,とけ\}ない\{カラクリ,からくり\}から\{ ,\}\{クリア,くりあ\}したら\{明日,あした\}は\{花火,はなび\}の\{下,した\}で\{ ,\}',
  lyric_order: 7,
)
