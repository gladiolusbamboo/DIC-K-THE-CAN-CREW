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
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '誰がDOPESTやりましょうぜ涙多めの神戸牛ならNOセンキューいずれ西の方まで当然もう全部持ってく猛烈テクニック切って貼ってヒップホップだってそう切って貼ってヒップホップだってそう俺ら言葉の事情なんかどっかにさておきさくさく休まず書く',
  ruby: 'だれがどーぺすとやりましょうぜなみだおおめのこうべぎゅうならのーせんきゅーいずれにしのほうまでとうぜんもうぜんぶもってくもうれつてくにっくきってはってひっぷほっぷだってそうきってはってひっぷほっぷだってそうおれらことばのじじょうなんかどっかにさておきさくさくやすまずかく',
  lyric_with_ruby: '\{誰,だれ\}が\{DOPEST,どーぺすと\}やりましょうぜ\{ ,\}\{涙,なみだ\}\{多め,おおめ\}の\{神戸,こうべ\}\{牛,ぎゅう\}なら\{NO,のー\}\{セン,せん\}\{キュー,きゅー\}\{ ,\}いずれ\{西,にし\}の\{方,ほう\}まで\{当然,とうぜん\}\{ ,\}もう\{ ,\}\{全部,ぜんぶ\}\{持っ,もっ\}てく\{猛烈,もうれつ\}\{テクニック,てくにっく\}\{ ,\}\{切っ,きっ\}て\{貼っ,はっ\}て\{ヒップ,ひっぷ\}\{ホップ,ほっぷ\}だってそう\{ ,\}\{切っ,きっ\}て\{貼っ,はっ\}て\{ヒップ,ひっぷ\}\{ホップ,ほっぷ\}だってそう\{ ,\}\{俺,おれ\}ら\{言葉,ことば\}の\{事情,じじょう\}なんかどっかにさておきさくさく\{休ま,やすま\}ず\{書く,かく\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'バイファーザドーペストあLet\'sgo',
  ruby: 'ばいふぁーざどーぺすとあれっつごー',
  lyric_with_ruby: '\{バイファーザドーペスト,ばいふぁーざどーぺすと\}\{ ,\}あ\{Let\'s,れっつ\}\{ ,\}\{go,ごー\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'CUEZERO')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '満を持して何を見してぇ?右手、左手に託す一芸筆記試験どうせ一度の人生、生きて赤面は当然本日は晴天誰がドープ?投げたロープなぜだろう?すり抜ける間のバックドロップ確保!青島じゃなく夢の島から電波飛ばす楽勝',
  ruby: 'まんをじしてなにをみしてぇみぎてひだりてにたくすいちげいひっきしけんどうせいちどのじんせいいきてせきめんはとうぜんほんじつはせいてんだれがどーぷなげたろーぷなぜだろうすりぬけるまのばっくどろっぷかくほあおしまじゃなくゆめのしまからでんぱとばすらくしょう',
  lyric_with_ruby: '\{満,まん\}を\{持,じ\}して\{ ,\}\{何,なに\}を\{見,み\}してぇ\{?,\}\{ ,\}\{右手,みぎて\}\{、,\}\{左手,ひだりて\}に\{託す,たくす\}\{一芸,いちげい\}\{ ,\}\{筆記,ひっき\}\{試験,しけん\}\{ ,\}どうせ\{一,いち\}\{度,ど\}の\{人生,じんせい\}\{、,\}\{生き,いき\}て\{赤面,せきめん\}は\{当然,とうぜん\}\{ ,\}\{本日,ほんじつ\}は\{晴天,せいてん\}\{ ,\}\{誰,だれ\}が\{ドープ,どーぷ\}\{?,\}\{ ,\}\{投げ,なげ\}た\{ロープ,ろーぷ\}\{ ,\}なぜだろう\{?,\}\{ ,\}\{すり抜ける,すりぬける\}\{間,ま\}の\{バック,ばっく\}\{ドロップ,どろっぷ\}\{ ,\}\{確保,かくほ\}\{!,\}\{ ,\}\{青島,あおしま\}じゃなく\{夢の島,ゆめのしま\}から\{電波,でんぱ\}\{飛ばす,とばす\}\{ ,\}\{楽勝,らくしょう\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'バイファーザドーペストあLet\'sgo',
  ruby: 'ばいふぁーざどーぺすとあれっつごー',
  lyric_with_ruby: '\{バイファーザドーペスト,ばいふぁーざどーぺすと\}\{ ,\}あ\{Let\'s,れっつ\}\{ ,\}\{go,ごー\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '一と十と百と千と万と億と兆と今日もどんどん増殖なんのこっちゃちゃんとノんな30越したラップのモンスター会場操作内容どうだ感じたいか倍のオーラ何も怒んない愛をちょうだいビーツをmake認めるpeople全員呼べる飛べる',
  ruby: 'いちとじゅうとひゃくとせんとまんとおくとちょうときょうもどんどんぞうしょくなんのこっちゃちゃんとのんなさんじゅうこしたらっぷのもんすたーかいじょうそうさないようどうだかんじたいかばいのおーらなんもおこんないあいをちょうだいびーつをめいくみとめるぴーぷるぜんいんよべるとべる',
  lyric_with_ruby: '\{一,いち\}と\{十,じゅう\}と\{百,ひゃく\}と\{千,せん\}と\{万,まん\}と\{億,おく\}と\{兆,ちょう\}と\{ ,\}\{今日,きょう\}もどんどん\{増殖,ぞうしょく\}\{ ,\}なんのこっちゃちゃんと\{ノ,の\}んな\{30,さんじゅう\}\{越し,こし\}た\{ラップ,らっぷ\}の\{モンスター,もんすたー\}\{会場,かいじょう\}\{操作,そうさ\}\{ ,\}\{内容,ないよう\}どうだ\{ ,\}\{感じ,かんじ\}たいか\{ ,\}\{倍,ばい\}の\{オーラ,おーら\}\{ ,\}\{何,なん\}も\{怒ん,おこん\}ない\{ ,\}\{愛,あい\}をちょうだい\{ ,\}\{ビーツ,びーつ\}を\{make,めいく\}\{ ,\}\{認める,みとめる\}\{people,ぴーぷる\}\{全員,ぜんいん\}\{呼べる,よべる\}\{ ,\}\{飛べる,とべる\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'バイファーザドーペストあLet\'sgo',
  ruby: 'ばいふぁーざどーぺすとあれっつごー',
  lyric_with_ruby: '\{バイファーザドーペスト,ばいふぁーざどーぺすと\}\{ ,\}あ\{Let\'s,れっつ\}\{ ,\}\{go,ごー\}\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'CUEZERO')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'だからどうしたそれがどうしたもしかしたらさよならごめんタハラトシチャンマッチにヨッチャ話しによっちゃぁマジ匂っちゃうあの街に落ち合う意味求める詩内容のトンネルくぐり抜ける今喜んでる混んでる道避けてこのペースこれが成功の秘訣',
  ruby: 'だからどうしたそれがどうしたもしかしたらさよならごめんたはらとしちゃんまっちによっちゃはなしによっちゃぁまじにおっちゃうあのまちにおちあういみもとめるしないようのとんねるくぐりぬけるいまよろこんでるこんでるみちさけてこのぺーすこれがせいこうのひけつ',
  lyric_with_ruby: 'だからどうした\{ ,\}それがどうした\{ ,\}もしかしたら\{ ,\}さよならごめん\{ ,\}\{タハラトシチャン,たはらとしちゃん\}\{ ,\}\{マッチ,まっち\}に\{ヨッチャ,よっちゃ\}\{ ,\}\{話し,はなし\}によっちゃぁ\{マジ,まじ\}\{匂っ,におっ\}ちゃう\{ ,\}あの\{街,まち\}に\{落ち合う,おちあう\}\{ ,\}\{意味,いみ\}\{求める,もとめる\}\{詩,し\}\{ ,\}\{内容,ないよう\}の\{トンネル,とんねる\}\{くぐり抜ける,くぐりぬける\}\{ ,\}\{今,いま\}\{喜ん,よろこん\}でる\{ ,\}\{混ん,こん\}でる\{道,みち\}\{避け,さけ\}てこの\{ペース,ぺーす\}\{ ,\}これが\{成功,せいこう\}の\{秘訣,ひけつ\}\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'バイファーザドーペストあLet\'sgo',
  ruby: 'ばいふぁーざどーぺすとあれっつごー',
  lyric_with_ruby: '\{バイファーザドーペスト,ばいふぁーざどーぺすと\}\{ ,\}あ\{Let\'s,れっつ\}\{ ,\}\{go,ごー\}\{ ,\}',
  lyric_order: 8,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'BだYだPだHだAだRだTだHだEだDだOだPだEだSとTだ俺達がDOPESTだからどうした!',
  ruby: 'びーだわいだぴーだえっちだえーだあーるだてぃーだえっちだいーだでぃーだおーだぴーだいーだえすとてぃーだおれたちがどーぺすとだからどうした',
  lyric_with_ruby: '\{B,びー\}だ\{Y,わい\}だ\{ ,\}\{P,ぴー\}だ\{H,えっち\}だ\{A,えー\}だ\{R,あーる\}だ\{ ,\}\{T,てぃー\}だ\{H,えっち\}だ\{E,いー\}だ\{ ,\}\{D,でぃー\}だ\{O,おー\}だ\{P,ぴー\}だ\{E,いー\}だ\{S,えす\}と\{T,てぃー\}だ\{ ,\}\{俺,おれ\}\{達,たち\}が\{DOPEST,どーぺすと\}\{ ,\}だからどうした\{!,\}\{ ,\}',
  lyric_order: 9,
)

