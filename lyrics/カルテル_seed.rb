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

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'clapclapclapandjumpup…',
  ruby: 'くらっぷくらっぷくらっぷあんどじゃんぷあっぷ',
  lyric_with_ruby: '\{clap,くらっぷ\}\{ ,\}\{clap,くらっぷ\}\{ ,\}\{clap,くらっぷ\}\{ ,\}\{and,あんど\}\{ ,\}\{jump,じゃんぷ\}\{ ,\}\{up,あっぷ\}\{…,\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '軽々とカルテルが舞う暗躍暗躍さぁjumpup',
  ruby: 'かるがるとかるてるがまうあんやくあんやくさぁじゃんぷあっぷ',
  lyric_with_ruby: '\{軽々と,かるがると\}\{カルテル,かるてる\}が\{舞う,まう\}\{ ,\}\{暗躍,あんやく\}\{ ,\}\{暗躍,あんやく\}\{ ,\}さぁ\{ ,\}\{jump,じゃんぷ\}\{ ,\}\{up,あっぷ\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '傷口に染みるアルコールありがとうセニョールツバでもつけときゃすぐ治る借りを返す時が来たんだ置き去りのグローブにkissほらstandup所詮後が無ぇしがねぇバウンサー身もフタもねぇけどあの時のカウンター食らっちまったが最後明け方まで千鳥足で探す今日のお相手',
  ruby: 'きずぐちにしみるあるこーるありがとうせにょーるつばでもつけときゃすぐなおるかりをかえすときがきたんだおきざりのぐろーぶにきすほらすたんどあっぷしょせんあとがねぇしがねぇばうんさーみもふたもねぇけどあのときのかうんたーくらっちまったがさいごあけがたまでちどりあしでさがすきょうのおあいて',
  lyric_with_ruby: '\{傷口,きずぐち\}に\{染みる,しみる\}\{アルコール,あるこーる\}ありがとう\{セニョール,せにょーる\}\{ ,\}\{ツバ,つば\}でもつけときゃすぐ\{治る,なおる\}\{ ,\}\{借り,かり\}を\{返す,かえす\}\{時,とき\}が\{来,き\}たんだ\{ ,\}\{置き去り,おきざり\}の\{グローブ,ぐろーぶ\}に\{ ,\}\{kiss,きす\}\{ ,\}ほら\{ ,\}\{stand,すたんど\}\{ ,\}\{up,あっぷ\}\{ ,\}\{所詮,しょせん\}\{後,あと\}が\{無,ね\}ぇ\{ ,\}しがねぇ\{バウンサー,ばうんさー\}\{ ,\}\{身,み\}も\{フタ,ふた\}もねぇけどあの\{時,とき\}の\{カウンター,かうんたー\}\{ ,\}\{食らっ,くらっ\}ちまったが\{最後,さいご\}\{明け方,あけがた\}まで\{ ,\}\{千鳥足,ちどりあし\}で\{探す,さがす\}\{今日,きょう\}のお\{相手,あいて\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'やめときなここにゃヒゲがいる死にたいなら死ねばいい皆殺しのショットグラスほっとくはずないオマエだってターゲット夜明けまで宴あれもシタイこれもシタイ屍乗り越えおれの時代おれが椅子盗る番でやんすピストルbangbangバンデラスユタカ',
  ruby: 'やめときなここにゃひげがいるしにたいならしねばいいみなごろしのしょっとぐらすほっとくはずないおまえだってたーげっとよあけまでうたげあれもしたいこれもしたいしかばねのりこえおれのじだいおれがいすとるばんでやんすぴすとるばんばんばんでらすゆたか',
  lyric_with_ruby: 'やめときな\{ ,\}ここにゃ\{ヒゲ,ひげ\}がいる\{死に,しに\}たいなら\{死ね,しね\}ばいい\{ ,\}\{皆殺し,みなごろし\}の\{ショット,しょっと\}\{グラス,ぐらす\}ほっとくはずない\{ ,\}\{オマエ,おまえ\}だって\{ターゲット,たーげっと\}\{ ,\}\{夜明け,よあけ\}まで\{宴,うたげ\}\{ ,\}あれも\{シタイ,したい\}\{ ,\}これも\{シタイ,したい\}\{ ,\}\{屍,しかばね\}\{乗り越え,のりこえ\}おれの\{時代,じだい\}\{ ,\}おれが\{椅子,いす\}\{盗る,とる\}\{番,ばん\}でやんす\{ ,\}\{ピストル,ぴすとる\}\{ ,\}\{bangbang,ばんばん\}\{ ,\}\{バンデラス,ばんでらす\}\{ ,\}\{ユタカ,ゆたか\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'TillDawn夜明けまでLiquorishasな関係いつまでNeverEndin\'そりゃねぇぜBonitaTillDawn夜明けからLiquorishasな関係いつまでNeverEndin\'DaLaDaDaDaLaDaDa',
  ruby: 'てぃるどーんよあけまでりかーりしゃすなかんけいいつまでねばーえんでぃんそりゃねぇぜぼにーたてぃるどーんよあけからりかーりしゃすなかんけいいつまでねばーえんでぃんだらだだだらだだ',
  lyric_with_ruby: '\{Till,てぃる\}\{ ,\}\{Dawn,どーん\}\{ ,\}\{夜明け,よあけ\}まで\{ ,\}\{Liquorishas,りかーりしゃす\}\{ ,\}な\{関係,かんけい\}\{ ,\}いつまで\{ ,\}\{Never,ねばー\}\{ ,\}\{Endin,えんでぃん\}\{\',\}\{ ,\}そりゃねぇぜ\{ ,\}\{Bonita,ぼにーた\}\{ ,\}\{Till,てぃる\}\{ ,\}\{Dawn,どーん\}\{ ,\}\{夜明け,よあけ\}から\{ ,\}\{Liquorishas,りかーりしゃす\}\{ ,\}な\{関係,かんけい\}\{ ,\}いつまで\{ ,\}\{Never,ねばー\}\{ ,\}\{Endin,えんでぃん\}\{\',\}\{ ,\}\{Da,だ\}\{ ,\}\{La,ら\}\{ ,\}\{Da,だ\}\{ ,\}\{Da,だ\}\{ ,\}\{Da,だ\}\{ ,\}\{La,ら\}\{ ,\}\{Da,だ\}\{ ,\}\{Da,だ\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'Let\'sPlayはじめるいつものようにDisplay映るオープンカーに飛び乗り今夜のミッションStart時々モシモシしてMissionパァでもどちらも大事あの子がCallin\'任務中もピンポンパンおかえりI\'am仕事人パピプペポこって全てComplete',
  ruby: 'れっつぷれーはじめるいつものようにでぃすぷれーうつるおーぷんかーにとびのりこんやのみっしょんすたーとときどきもしもししてみっしょんぱぁでもどちらもだいじあのこがこーりんにんむちゅうもぴんぽんぱんおかえりあいあむしごとにんぱぴぷぺぽこってすべてこんぷりーと',
  lyric_with_ruby: '\{Let\'s,れっつ\}\{ ,\}\{Play,ぷれー\}\{ ,\}はじめる\{ ,\}いつものように\{ ,\}\{Display,でぃすぷれー\}\{ ,\}\{映る,うつる\}\{オープンカー,おーぷんかー\}\{ ,\}に\{飛び乗り,とびのり\}\{今夜,こんや\}の\{ミッション,みっしょん\}\{ ,\}\{Start,すたーと\}\{ ,\}\{時々,ときどき\}\{モシモシ,もしもし\}して\{ ,\}\{Mission,みっしょん\}\{ ,\}\{パァ,ぱぁ\}でも\{ ,\}どちらも\{大事,だいじ\}\{ ,\}あの\{子,こ\}が\{Callin,こーりん\}\{\',\}\{ ,\}\{任務,にんむ\}\{中,ちゅう\}も\{ピンポン,ぴんぽん\}\{パン,ぱん\}\{ ,\}おかえり\{ ,\}\{I,あい\}\{\',\}\{am,あむ\}\{ ,\}\{仕事,しごと\}\{人,にん\}\{ ,\}\{パピプペポ,ぱぴぷぺぽ\}こって\{ ,\}\{全て,すべて\}\{ ,\}\{Complete,こんぷりーと\}\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: '乾杯toテキーラ乾杯totheポルフィディオビアから始まりリオのカルナバルバリな盛り上りをどう処理しようと仕様が無い街ぐるみだもう問題無い相談は行列俺が現れりゃモーゼってかカイザーソゼ的に解決だゼ',
  ruby: 'かんぱいとぅーてきーらかんぱいとぅーざぽるふぃでぃおびあからはじまりりおのかるなばるばりなもりあがりをどうしょりしようとしようがないまちぐるみだもうもんだいないそうだんはぎょうれつおれがあらわれりゃもーぜってかかいざーそぜてきにかいけつだぜ',
  lyric_with_ruby: '\{乾杯,かんぱい\}\{ ,\}\{to,とぅー\}\{ ,\}\{テキーラ,てきーら\}\{ ,\}\{乾杯,かんぱい\}\{ ,\}\{to,とぅー\}\{ ,\}\{the,ざ\}\{ ,\}\{ポルフィディオ,ぽるふぃでぃお\}\{ ,\}\{ビア,びあ\}から\{始まり,はじまり\}\{リオ,りお\}の\{カルナバル,かるなばる\}\{ ,\}\{バリ,ばり\}な\{盛り,もり\}\{上り,あがり\}を\{ ,\}どう\{処理,しょり\}しようと\{仕様,しよう\}が\{無い,ない\}\{ ,\}\{街,まち\}ぐるみだもう\{問題,もんだい\}\{無い,ない\}\{ ,\}\{相談,そうだん\}は\{行列,ぎょうれつ\}\{ ,\}\{俺,おれ\}が\{現れりゃ,あらわれりゃ\}\{モーゼ,もーぜ\}ってか\{カイザーソゼ,かいざーそぜ\}\{的,てき\}に\{解決,かいけつ\}だ\{ゼ,ぜ\}\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'TillDawn夜明けまでLiquorishasな関係いつまでNeverEndin\'そりゃねぇぜBonitaTillDawn夜明けからLiquorishasな関係いつまでNeverEndin\'DaLaDaDaDaLaDaDa',
  ruby: 'てぃるどーんよあけまでりかーりしゃすなかんけいいつまでねばーえんでぃんそりゃねぇぜぼにーたてぃるどーんよあけからりかーりしゃすなかんけいいつまでねばーえんでぃんだらだだだらだだ',
  lyric_with_ruby: '\{Till,てぃる\}\{ ,\}\{Dawn,どーん\}\{ ,\}\{夜明け,よあけ\}まで\{ ,\}\{Liquorishas,りかーりしゃす\}\{ ,\}な\{関係,かんけい\}\{ ,\}いつまで\{ ,\}\{Never,ねばー\}\{ ,\}\{Endin,えんでぃん\}\{\',\}\{ ,\}そりゃねぇぜ\{ ,\}\{Bonita,ぼにーた\}\{ ,\}\{Till,てぃる\}\{ ,\}\{Dawn,どーん\}\{ ,\}\{夜明け,よあけ\}から\{ ,\}\{Liquorishas,りかーりしゃす\}\{ ,\}な\{関係,かんけい\}\{ ,\}いつまで\{ ,\}\{Never,ねばー\}\{ ,\}\{Endin,えんでぃん\}\{\',\}\{ ,\}\{Da,だ\}\{ ,\}\{La,ら\}\{ ,\}\{Da,だ\}\{ ,\}\{Da,だ\}\{ ,\}\{Da,だ\}\{ ,\}\{La,ら\}\{ ,\}\{Da,だ\}\{ ,\}\{Da,だ\}\{ ,\}',
  lyric_order: 8,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'BRIDGE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'DaLaDaDaDaLaDaDa…',
  ruby: 'だらだだだらだだ',
  lyric_with_ruby: '\{Da,だ\}\{ ,\}\{La,ら\}\{ ,\}\{Da,だ\}\{ ,\}\{Da,だ\}\{ ,\}\{Da,だ\}\{ ,\}\{La,ら\}\{ ,\}\{Da,だ\}\{ ,\}\{Da,だ\}\{…,\}\{ ,\}',
  lyric_order: 9,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '真っ黒なマスタッシュ濃ゆ目のキャラ褐色のバックトラック顔役の肚こん中で誰が真のドンダダwho?keepinmoonkeepinmoonkeepinmoon街に溢れ出す手配書の中裏側に手を廻し誰をバラすここで遭ったが最後さアスタラwho?keepinmoonkeepinmoonkeepinmoonデスペラード',
  ruby: 'まっくろなますたっしゅこゆめのきゃらかっしょくのばっくとらっくかおやくのはらこんなかでだれがしんのどんだだふーきーぴんむーんきーぴんむーんきーぴんむーんまちにあふれだすてはいしょのなかうらがわにてをまわしだれをばらすここであったがさいごさあすたらふーきーぴんむーんきーぴんむーんきーぴんむーんですぺらーど',
  lyric_with_ruby: '\{真っ黒,まっくろ\}な\{マスタッシュ,ますたっしゅ\}\{濃,こ\}ゆ\{目,め\}の\{キャラ,きゃら\}\{ ,\}\{褐色,かっしょく\}の\{バックトラック,ばっくとらっく\}\{顔役,かおやく\}の\{肚,はら\}\{ ,\}こん\{中,なか\}で\{誰,だれ\}が\{真,しん\}の\{ドン,どん\}\{ダダ,だだ\}\{ ,\}\{who,ふー\}\{?,\}\{ ,\}\{keepin,きーぴん\}\{ ,\}\{moon,むーん\}\{ ,\}\{keepin,きーぴん\}\{ ,\}\{moon,むーん\}\{ ,\}\{keepin,きーぴん\}\{ ,\}\{moon,むーん\}\{ ,\}\{街,まち\}に\{溢れ,あふれ\}\{出す,だす\}\{手配,てはい\}\{書,しょ\}の\{中,なか\}\{ ,\}\{裏側,うらがわ\}に\{手,て\}を\{廻し,まわし\}\{誰,だれ\}を\{バラ,ばら\}す\{ ,\}ここで\{遭っ,あっ\}たが\{最後,さいご\}さ\{アスタラ,あすたら\}\{ ,\}\{who,ふー\}\{?,\}\{ ,\}\{keepin,きーぴん\}\{ ,\}\{moon,むーん\}\{ ,\}\{keepin,きーぴん\}\{ ,\}\{moon,むーん\}\{ ,\}\{keepin,きーぴん\}\{ ,\}\{moon,むーん\}\{ ,\}\{デスペラード,ですぺらーど\}\{ ,\}',
  lyric_order: 10,
)

