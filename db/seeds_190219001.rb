artist_name =    'UL'
lyricUrl_url =   'https://www.utamap.com/showkasi.php?surl=k-150430-114'
cd_name =        'Boys&Gentlemen'
cd_released_at = '2015-04-29'
song_name =      '2丁拳銃'
song_lyricist =  'MCU & LITTLE'
song_composer =  'MCU, LITTLE, HIRORON & カトウタロウ'
song_arranger =  'HIRORON'
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

singer = Singer.find_by(name: 'MCU')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'Go!チャンプロード舞うガンスモーク銃声飛び交うダンスフロー(フロー)2丁の拳銃でフロントラインに突っ込む姿まさにコントラいらぬガイドラインいまだ迷子な君に心で打ち込むサイコガン毎度タイトなワイルドガンマン(HEYYOU!)御用だ!覚悟しなハンズアップ',
  ruby: 'ごーちゃんぷろーどまうがんすもーくじゅうせいとびかうだんすふろーふろーにちょうのけんじゅうでふろんとらいんにつっこむすがたまさにこんとらいらぬがいどらいんいまだまいごなきみにこころでうちこむさいこがんまいどたいとなわいるどがんまんへいゆーごようだかくごしなはんずあっぷ',
  lyric_with_ruby: '\{Go,ごー\}\{!,\}\{ ,\}\{チャンプロード,ちゃんぷろーど\}\{舞う,まう\}\{ガンスモーク,がんすもーく\}\{ ,\}\{銃声,じゅうせい\}\{飛び交う,とびかう\}\{ダンス,だんす\}\{フロー,ふろー\}\{ ,\}\{(,\}\{フロー,ふろー\}\{),\}\{ ,\}\{2,に\}\{丁,ちょう\}の\{拳銃,けんじゅう\}で\{フロント,ふろんと\}\{ライン,らいん\}に\{ ,\}\{突っ込む,つっこむ\}\{姿,すがた\}まさに\{コントラ,こんとら\}\{ ,\}いらぬ\{ガイドライン,がいどらいん\}\{ ,\}いまだ\{迷子,まいご\}な\{君,きみ\}に\{ ,\}\{心,こころ\}で\{打ち込む,うちこむ\}\{サイコガン,さいこがん\}\{ ,\}\{毎度,まいど\}\{タイト,たいと\}な\{ワイルドガンマン,わいるどがんまん\}\{ ,\}\{(,\}\{HEY,へい\}\{ ,\}\{YOU,ゆー\}\{!),\}\{ ,\}\{御用,ごよう\}だ\{!,\}\{覚悟,かくご\}しな\{ハンズアップ,はんずあっぷ\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'ゲットーの銃より言論の自由Check2.2(1.2)機関銃言いにくいことガンガン言う唇から散弾銃(Bang)これが最新盤羅針盤SEXにピストルマシンガンRound1&2&Bang(Bang)Bang(Bang)SHURE58ハンドガン',
  ruby: 'げっとーのじゅうよりげんろんのじゆうチェックわんつーわんつーきかんじゅういいにくいことがんがんいうくちびるからさんだんじゅうばんこれがさいしんばんらしんばんせっくすにぴすとるましんがんらうんどわんあんどつーあんどばんばんばんばんしゅあーごじゅうはちはんどがん',
  lyric_with_ruby: '\{ゲットー,げっとー\}の\{銃,じゅう\}より\{言論,げんろん\}の\{自由,じゆう\}\{ ,\}\{Check,チェック\}\{2,わん\}\{.,\}\{2,つー\}\{(,\}\{1,わん\}\{.,\}\{2,つー\}\{),\}\{ ,\}\{機関,きかん\}\{銃,じゅう\}\{ ,\}\{言い,いい\}にくいこと\{ガンガン,がんがん\}\{言う,いう\}\{ ,\}\{唇,くちびる\}から\{散弾,さんだん\}\{銃,じゅう\}\{ ,\}\{(,\}\{Bang,ばん\}\{),\}\{ ,\}これが\{最新,さいしん\}\{盤,ばん\}\{ ,\}\{羅針盤,らしんばん\}\{ ,\}\{SEX,せっくす\}に\{ピストルマシンガン,ぴすとるましんがん\}\{ ,\}\{Round,らうんど\}\{1,わん\}\{&,あんど\}\{2,つー\}\{&,あんど\}\{Bang,ばん\}\{(,\}\{Bang,ばん\}\{),\}\{Bang,ばん\}\{(,\}\{Bang,ばん\}\{),\}\{ ,\}\{SHURE,しゅあー\}\{58,ごじゅうはち\}\{ ,\}\{ハンド,はんど\}\{ガン,がん\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'OneandTwo2丁拳銃OneandTwo2丁拳銃OneandTwo2丁拳銃andyou×4OneandTwo2丁拳銃',
  ruby: 'わんあんどつーにちょうけんじゅうわんあんどつーにちょうけんじゅうわんあんどつーにちょうけんじゅうあんどゆーあんどゆーあんどゆーあんどゆーわんあんどつーにちょうけんじゅう',
  lyric_with_ruby: '\{One,わん\}\{ ,\}\{and,あんど\}\{ ,\}\{Two,つー\}\{ ,\}\{2,に\}\{丁,ちょう\}\{拳銃,けんじゅう\}\{ ,\}\{One,わん\}\{ ,\}\{and,あんど\}\{ ,\}\{Two,つー\}\{ ,\}\{2,に\}\{丁,ちょう\}\{拳銃,けんじゅう\}\{ ,\}\{One,わん\}\{ ,\}\{and,あんど\}\{ ,\}\{Two,つー\}\{ ,\}\{2,に\}\{丁,ちょう\}\{拳銃,けんじゅう\}\{ ,\}\{and you ×4,あんどゆーあんどゆーあんどゆーあんどゆー\}\{ ,\}\{One,わん\}\{ ,\}\{and,あんど\}\{ ,\}\{Two,つー\}\{ ,\}\{2,に\}\{丁,ちょう\}\{拳銃,けんじゅう\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'MCU')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '(YO!)言ったろうやったろう出る半か丁なんてシカトなバッカモン(UL)合わさる2丁の銃口ぶっぱなす五十音',
  ruby: 'よーいったろうやったろうでるはんかちょうなんてしかとなばっかもんゆーえるあわさるにちょうのじゅうこうぶっぱなすごじゅうおん',
  lyric_with_ruby: '\{(,\}\{YO,よー\}\{!),\}\{ ,\}\{言っ,いっ\}たろうやったろう\{出る,でる\}\{半,はん\}か\{丁,ちょう\}\{ ,\}なんて\{シカト,しかと\}な\{バッカモン,ばっかもん\}\{ ,\}\{(,\}\{UL,ゆーえる\}\{),\}\{ ,\}\{合わさる,あわさる\}\{2,に\}\{丁,ちょう\}の\{銃口,じゅうこう\}\{ ,\}ぶっぱなす\{五十音,ごじゅうおん\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'レボリューションmoveon動かねえと撃つぞ手をあげろ嘘じゃねえぞ撃つぞ2015依然注目リトルTHEリボルバー拳銃王',
  ruby: 'れぼりゅーしょんむーぶおんうごかねえとうつぞてをあげろうそじゃねえぞうつぞにせんじゅうごいぜんちゅうもくりとるざりぼるばーけんじゅうおう',
  lyric_with_ruby: '\{レボリューション,れぼりゅーしょん\}\{ ,\}\{move,むーぶ\}\{ ,\}\{on,おん\}\{ ,\}\{動か,うごか\}ねえと\{撃つ,うつ\}ぞ\{ ,\}\{手,て\}をあげろ\{ ,\}\{嘘,うそ\}じゃねえぞ\{撃つ,うつ\}ぞ\{ ,\}\{2015,にせんじゅうご\}\{ ,\}\{依然,いぜん\}\{注目,ちゅうもく\}\{ ,\}\{リトル,りとる\}\{ ,\}\{THE,ざ\}\{ ,\}\{リボルバー,りぼるばー\}\{ ,\}\{拳銃,けんじゅう\}\{王,おう\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'MCU')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 5,
  lyric: 'ぶれんツートップが年中ロックする現場に竜巻旋風トークTWOガンオッタテバッキューン上がる花火たまや一晩中',
  ruby: 'ぶれんつーとっぷがねんじゅうろっくするげんばにたつまきせんぷうとーくつーがんおったてばっきゅーんあがるはなびたまやひとばんじゅう',
  lyric_with_ruby: 'ぶれん\{ツートップ,つーとっぷ\}が\{年中,ねんじゅう\}\{ロック,ろっく\}する\{現場,げんば\}に\{竜巻,たつまき\}\{旋風,せんぷう\}\{トーク,とーく\}\{ ,\}\{TWO,つー\}\{ ,\}\{ガンオッタテバッキューン,がんおったてばっきゅーん\}\{ ,\}\{上がる,あがる\}\{花火,はなび\}たまや\{一,ひと\}\{晩,ばん\}\{中,じゅう\}\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 6,
  lyric: 'おまんじゅうこしあんくれえ甘いお前達にロシアンルーレット溜まり溜まった鉛玉だほら1発目から当たりだな',
  ruby: 'おまんじゅうこしあんくれえあまいおまえたちにろしあんるーれっとたまりたまったなまりだまだほらいっぱつめからあたりだな',
  lyric_with_ruby: 'おまんじゅう\{ ,\}こしあんくれえ\{ ,\}\{甘い,あまい\}\{お前,おまえ\}\{達,たち\}に\{ロシアンルーレット,ろしあんるーれっと\}\{ ,\}\{溜まり,たまり\}\{溜まっ,たまっ\}た\{鉛,なまり\}\{玉,だま\}だ\{ ,\}ほら\{1,いっ\}\{発,ぱつ\}\{目,め\}から\{当たり,あたり\}だな\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'OneandTwo2丁拳銃OneandTwo2丁拳銃OneandTwo2丁拳銃andyou×4OneandTwo2丁拳銃',
  ruby: 'わんあんどつーにちょうけんじゅうわんあんどつーにちょうけんじゅうわんあんどつーにちょうけんじゅうあんどゆーあんどゆーあんどゆーあんどゆーわんあんどつーにちょうけんじゅう',
  lyric_with_ruby: '\{One,わん\}\{ ,\}\{and,あんど\}\{ ,\}\{Two,つー\}\{ ,\}\{2,に\}\{丁,ちょう\}\{拳銃,けんじゅう\}\{ ,\}\{One,わん\}\{ ,\}\{and,あんど\}\{ ,\}\{Two,つー\}\{ ,\}\{2,に\}\{丁,ちょう\}\{拳銃,けんじゅう\}\{ ,\}\{One,わん\}\{ ,\}\{and,あんど\}\{ ,\}\{Two,つー\}\{ ,\}\{2,に\}\{丁,ちょう\}\{拳銃,けんじゅう\}\{ ,\}\{and you ×4,あんどゆーあんどゆーあんどゆーあんどゆー\}\{ ,\}\{One,わん\}\{ ,\}\{and,あんど\}\{ ,\}\{Two,つー\}\{ ,\}\{2,に\}\{丁,ちょう\}\{拳銃,けんじゅう\}\{ ,\}',
  lyric_order: 8,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'OneandTwo2丁拳銃OneandTwo2丁拳銃OneandTwo2丁拳銃andyou×4OneandTwo2丁拳銃',
  ruby: 'わんあんどつーにちょうけんじゅうわんあんどつーにちょうけんじゅうわんあんどつーにちょうけんじゅうあんどゆーあんどゆーあんどゆーあんどゆーわんあんどつーにちょうけんじゅう',
  lyric_with_ruby: '\{One,わん\}\{ ,\}\{and,あんど\}\{ ,\}\{Two,つー\}\{ ,\}\{2,に\}\{丁,ちょう\}\{拳銃,けんじゅう\}\{ ,\}\{One,わん\}\{ ,\}\{and,あんど\}\{ ,\}\{Two,つー\}\{ ,\}\{2,に\}\{丁,ちょう\}\{拳銃,けんじゅう\}\{ ,\}\{One,わん\}\{ ,\}\{and,あんど\}\{ ,\}\{Two,つー\}\{ ,\}\{2,に\}\{丁,ちょう\}\{拳銃,けんじゅう\}\{ ,\}\{and you ×4,あんどゆーあんどゆーあんどゆーあんどゆー\}\{ ,\}\{One,わん\}\{ ,\}\{and,あんど\}\{ ,\}\{Two,つー\}\{ ,\}\{2,に\}\{丁,ちょう\}\{拳銃,けんじゅう\}\{ ,\}',
  lyric_order: 9,
)

