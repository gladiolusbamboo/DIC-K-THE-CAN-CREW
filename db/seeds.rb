artist_name =    'UL'
lyricUrl_url =   'https://www.utamap.com/showkasi.php?surl=k-150430-115'
cd_name =        'Boys&Gentlemen'
cd_released_at = '2015-04-29'
song_name =      'トビショック'
song_lyricist =  'MCU & LITTLE'
song_composer =  'MCU, LITTLE & DJ JIN'
song_arranger =  'DJ JIN(RHYMESTER)'
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
  lyric: 'かっ飛ばす吹っ飛ばす蹴っ飛ばすおれのバースで跳びな跳びな語尾と語尾捌くこのスキルがお前を呼び覚ますそれは方法論じゃなく心オール(オール)ナイト(ナイト)超超ロングな現場もロックする職人さんライジングサンまでジョグリンサウンドお天道様の下煽ってんぞあげろテンションまさに青天井ヘルメットOverground現場の王様高いとこ好きな大馬鹿てっぺんにある絶対にあるすげえでけえ絶景がある底辺じゃなくフライハイ上がろうさぁ今日も一日Jumparound',
  ruby: 'かっとばすふっとばすけっとばすおれのばーすでとびなとびなごびとごびさばくこのすきるがおまえをよびさますそれはほうほうろんじゃなくこころおーるおーるないとないとちょうちょうろんぐなげんばもろっくするしょくにんさんらいじんぐさんまでじょぐりんさうんどおてんとさまのしたあおってんぞあげろてんしょんまさにあおてんじょうへるめっとおーばーぐらうんどげんばのおうさまたかいとこすきなおおばかてっぺんにあるぜったいにあるすげえでけえぜっけいがあるていへんじゃなくふらいはいあがろうさぁきょうもいちにちじゃんぷあらうんど',
  lyric_with_ruby: '\{かっ飛ばす,かっとばす\}\{ ,\}\{吹っ飛ば,ふっとば\}す\{ ,\}\{蹴っ飛ばす,けっとばす\}\{ ,\}おれの\{バース,ばーす\}で\{ ,\}\{跳び,とび\}な\{跳び,とび\}な\{語尾,ごび\}と\{語尾,ごび\}\{捌く,さばく\}\{ ,\}この\{スキル,すきる\}が\{お前,おまえ\}を\{呼び覚ます,よびさます\}\{ ,\}それは\{方法,ほうほう\}\{論,ろん\}じゃなく\{心,こころ\}\{ ,\}\{オール,おーる\}\{ ,\}\{(,\}\{オール,おーる\}\{),\}\{ ,\}\{ナイト,ないと\}\{ ,\}\{(,\}\{ナイト,ないと\}\{),\}\{ ,\}\{超,ちょう\}\{超,ちょう\}\{ロング,ろんぐ\}な\{ ,\}\{現場,げんば\}も\{ロック,ろっく\}する\{職人,しょくにん\}さん\{ ,\}\{ライジングサン,らいじんぐさん\}まで\{ジョグリンサウンド,じょぐりんさうんど\}\{ ,\}\{お天道様,おてんとさま\}の\{下,した\}\{ ,\}\{煽っ,あおっ\}てんぞ\{ ,\}あげろ\{テンション,てんしょん\}\{ ,\}まさに\{青天井,あおてんじょう\}\{ ,\}\{ヘルメット,へるめっと\}\{ ,\}\{Overground,おーばーぐらうんど\}\{ ,\}\{現場,げんば\}の\{王様,おうさま\}\{ ,\}\{高い,たかい\}とこ\{好き,すき\}な\{大,おお\}\{馬鹿,ばか\}\{ ,\}てっぺんにある\{ ,\}\{絶対,ぜったい\}にある\{ ,\}すげえでけえ\{絶景,ぜっけい\}がある\{ ,\}\{底辺,ていへん\}じゃなく\{ ,\}\{フライ,ふらい\}\{ハイ,はい\}\{上がろ,あがろ\}う\{ ,\}さぁ\{今日,きょう\}も\{一,いち\}\{日,にち\}\{ ,\}\{Jump,じゃんぷ\}\{ ,\}\{around,あらうんど\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'トビナトビナ皆トビトビナトビナ皆トビトビナトビナトビトビトビナトビショックトビショック',
  ruby: 'とびなとびなみなとびとびなとびなみなとびとびなとびなとびとびとびなとびしょっくとびしょっく',
  lyric_with_ruby: '\{トビナトビナ,とびなとびな\}\{ ,\}\{皆,みな\}\{トビトビナ,とびとびな\}\{ ,\}\{トビ,とび\}\{ナ,な\}\{ ,\}\{皆,みな\}\{トビトビナ,とびとびな\}\{ ,\}\{トビ,とび\}\{ナ,な\}\{ ,\}\{トビトビトビナ,とびとびとびな\}\{ ,\}\{トビ,とび\}\{ショック,しょっく\}\{ ,\}\{トビ,とび\}\{ショック,しょっく\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'MCU')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'RIGINALジャパニーズニッカポッカシット一日二日三日四日ビットしたとこで手に入らん職人技見よう見まねかます僕チンwお日様の照明のした朝礼かいたスウェットが全ての証明家じゃカーちゃんとチビが待つ決して譲れない俺の日々がある第三より発泡よりキリンがいいお酌は美人がいいなんて昭和チックなトークもいつも通りひねったら流れる水のように男はつらいと言うより使命があるから泣き言躊躇できねえお天道様の下釘を打つカーちゃんはくれぐれもと釘を刺す',
  ruby: 'りじなるじゃぱにーずにっかぽっかしっといちにちふつかみっかよっかびっとしたとこでてにはいらんしょくにんわざみようみまねかますぼくちんわらおひさまのしょうめいのしたちょうれいかいたすうぇっとがすべてのしょうめいいえじゃかーちゃんとちびがまつけっしてゆずれないおれのひびがあるだいさんよりはっぽうよりきりんがいいおしゃくはびじんがいいなんてしょうわちっくなとーくもいつもどおりひねったらながれるみずのようにおとこはつらいというよりしめいがあるからなきごとちゅうちょできねえおてんとさまのしもくぎをうつかーちゃんはくれぐれもとくぎをさす',
  lyric_with_ruby: '\{RIGINAL,りじなる\}\{ ,\}\{ジャパニーズニッカポッカシット,じゃぱにーずにっかぽっかしっと\}\{ ,\}\{一,いち\}\{日,にち\}\{二日,ふつか\}\{三日,みっか\}\{四日,よっか\}\{ビット,びっと\}\{ ,\}したとこで\{手,て\}に\{入ら,はいら\}ん\{職人,しょくにん\}\{技,わざ\}\{ ,\}\{見よう,みよう\}\{見まね,みまね\}かます\{僕,ぼく\}\{チン,ちん\}\{ ,\}\{w,わら\}\{ ,\}\{お日様,おひさま\}の\{照明,しょうめい\}のした\{朝礼,ちょうれい\}\{ ,\}かいた\{スウェット,すうぇっと\}が\{全て,すべて\}の\{証明,しょうめい\}\{ ,\}\{家,いえ\}じゃ\{カー,かー\}ちゃんと\{チビ,ちび\}が\{待つ,まつ\}\{ ,\}\{決して,けっして\}\{譲れ,ゆずれ\}ない\{俺,おれ\}の\{日々,ひび\}がある\{ ,\}\{第,だい\}\{三,さん\}より\{発泡,はっぽう\}より\{キリン,きりん\}がいい\{ ,\}お\{酌,しゃく\}は\{美人,びじん\}がいい\{ ,\}なんて\{昭和,しょうわ\}\{チック,ちっく\}な\{トーク,とーく\}もいつも\{通り,どおり\}\{ ,\}ひねったら\{流れる,ながれる\}\{水,みず\}のように\{ ,\}\{男,おとこ\}はつらいと\{言う,いう\}より\{使命,しめい\}\{ ,\}があるから\{泣き言,なきごと\}\{躊躇,ちゅうちょ\}できねえ\{ ,\}\{お天道様,おてんとさま\}の\{下,しも\}\{釘,くぎ\}を\{打つ,うつ\}\{ ,\}\{カー,かー\}ちゃんはくれぐれもと\{釘,くぎ\}を\{刺す,さす\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'トビナトビナ皆トビトビナトビナ皆トビトビナトビナトビトビトビナトビショックトビショック',
  ruby: 'とびなとびなみなとびとびなとびなみなとびとびなとびなとびとびとびなとびしょっくとびしょっく',
  lyric_with_ruby: '\{トビナトビナ,とびなとびな\}\{ ,\}\{皆,みな\}\{トビトビナ,とびとびな\}\{ ,\}\{トビ,とび\}\{ナ,な\}\{ ,\}\{皆,みな\}\{トビトビナ,とびとびな\}\{ ,\}\{トビ,とび\}\{ナ,な\}\{ ,\}\{トビトビトビナ,とびとびとびな\}\{ ,\}\{トビ,とび\}\{ショック,しょっく\}\{ ,\}\{トビ,とび\}\{ショック,しょっく\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'MCU')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'こちとら一番リアルスタントマンでも失敗もあるし不安もあるでもマイホームは35年ローンでも他人の家作るロケンロール右手のビアー持ち帰るトンカチで今日もドンパチで肌はこんがりどっかの誰よりお国の為と言いてーが明日のお食事の為',
  ruby: 'こちとらいちばんりあるすたんとまんでもしっぱいもあるしふあんもあるでもまいほーむはさんじゅうごねんろーんでもたにんのいえつくるろけんろーるみぎてのびあーもちかえるとんかちできょうもどんぱちではだはこんがりどっかのだれよりおくにのためといいてーがあすのおしょくじのため',
  lyric_with_ruby: 'こちとら\{一,いち\}\{番,ばん\}\{リアル,りある\}\{スタントマン,すたんとまん\}\{ ,\}でも\{失敗,しっぱい\}もあるし\{不安,ふあん\}もある\{ ,\}でも\{マイホーム,まいほーむ\}は\{ ,\}\{35,さんじゅうご\}\{年,ねん\}\{ローン,ろーん\}\{ ,\}でも\{他人,たにん\}の\{家,いえ\}\{作る,つくる\}\{ロケンロール,ろけんろーる\}\{ ,\}\{右手,みぎて\}の\{ビアー,びあー\}\{持ち帰る,もちかえる\}\{トンカチ,とんかち\}で\{ ,\}\{今日,きょう\}も\{ドンパチ,どんぱち\}で\{肌,はだ\}はこんがり\{ ,\}どっかの\{誰,だれ\}よりお\{国,くに\}の\{為,ため\}\{ ,\}と\{言い,いい\}てーが\{明日,あす\}のお\{食事,しょくじ\}の\{為,ため\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'ゴーヘイゴーヘイスラスラひたすら親ゴーヘイ子スラ言語すらスラ語スラングラチェット片手に歌を歌う跳ねな跳ねな羽は無いけれど俺らの現場に屋根は無いから限界知らない躊躇わない俺の寅壱は伊達じゃない',
  ruby: 'ごーへいごーへいすらすらひたすらおやごーへいこすらげんごすらすらごすらんぐらちぇっとかたてにうたをうたうはねなはねなはねはないけれどおれらのげんばにやねはないからげんかいしらないためらわないおれのとらいちはだてじゃない',
  lyric_with_ruby: '\{ゴーヘイゴーヘイスラスラ,ごーへいごーへいすらすら\}\{ ,\}ひたすら\{親,おや\}\{ゴーヘイ,ごーへい\}\{子,こ\}\{スラ,すら\}\{ ,\}\{言語,げんご\}すら\{スラ,すら\}\{語,ご\}\{スラング,すらんぐ\}\{ ,\}\{ラチェット,らちぇっと\}\{片手,かたて\}に\{歌,うた\}を\{歌う,うたう\}\{ ,\}\{跳ね,はね\}な\{跳ね,はね\}な\{羽,はね\}は\{無い,ない\}けれど\{ ,\}\{俺,おれ\}らの\{現場,げんば\}に\{屋根,やね\}は\{無い,ない\}から\{ ,\}\{限界,げんかい\}\{知ら,しら\}ない\{躊躇わ,ためらわ\}ない\{ ,\}\{俺,おれ\}の\{寅,とら\}\{壱,いち\}は\{伊達,だて\}じゃない\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'トビナトビナ皆トビトビナトビナ皆トビトビナトビナトビトビトビナトビショックトビショック',
  ruby: 'とびなとびなみなとびとびなとびなみなとびとびなとびなとびとびとびなとびしょっくとびしょっく',
  lyric_with_ruby: '\{トビナトビナ,とびなとびな\}\{ ,\}\{皆,みな\}\{トビトビナ,とびとびな\}\{ ,\}\{トビ,とび\}\{ナ,な\}\{ ,\}\{皆,みな\}\{トビトビナ,とびとびな\}\{ ,\}\{トビ,とび\}\{ナ,な\}\{ ,\}\{トビトビトビナ,とびとびとびな\}\{ ,\}\{トビ,とび\}\{ショック,しょっく\}\{ ,\}\{トビ,とび\}\{ショック,しょっく\}\{ ,\}',
  lyric_order: 7,
)

