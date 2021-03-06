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

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'STEPBYSTEPきっとまだやれるまだまだやれるSTEPBYSTEPだってまだいけるまだまだいけるSTEPBYSTEPそこに大きな壁があるならばさらにSTEPBYSTEPBYSTEP',
  ruby: 'すてっぷばいすてっぷきっとまだやれるまだまだやれるすてっぷばいすてっぷだってまだいけるまだまだいけるすてっぷばいすてっぷそこにおおきなかべがあるならばさらにすてっぷばいすてっぷばいすてっぷ',
  lyric_with_ruby: '\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}きっとまだ\{ ,\}やれる\{ ,\}まだまだやれる\{ ,\}\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}だってまだ\{ ,\}いける\{ ,\}まだまだいける\{ ,\}\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}そこに\{大き,おおき\}\{ ,\}な\{壁,かべ\}があるならばさらに\{ ,\}\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'MCU')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '特別なあの子を振り向かせるこいつならてっぺんに唯一立てる可能性は100じゃないから楽じゃないだからがむしゃらツケは未来に着払い俺が君のヒーローになる全てはそのためHeartBeatを刻む常にヴィジョンに君のスマイルさらに笑わせたい絶対(That\'sRight)誰だって誰かに何かの訳があるから流せる涙と汗(だけどだって)ほら情報だらけ的言い訳などもうごちそうさまです要はシンプルに君のために世界を丸ごといただきますいざ旅立つ捨てる邪念(SayLove)熱い応援が力になる一歩また一歩確実に踏むSTEPで未来にかぶりつき決して離さずにOneWay歩き君に言わせたいかっけー(だろ)',
  ruby: 'とくべつなあのこをふりむかせるこいつならてっぺんにゆいいつたてるかのうせいはひゃくじゃないかららくじゃないだからがむしゃらつけはみらいにちゃくばらいおれがきみのひーろーになるすべてはそのためはーとびーとをきざむつねにゔぃじょんにきみのすまいるさらにわらわせたいぜったいざっつらいとだれだってだれかになにかのわけがあるからながせるなみだとあせだけどだってほらじょうほうだらけてきいいわけなどもうごちそうさまですようはしんぷるにきみのためにせかいをまるごといただきますいざたびだつすてるじゃねんせいらぶあついおうえんがちからになるいっぽまたいっぽかくじつにふむすてっぷでみらいにかぶりつきけっしてはなさずにわんうぇーあるききみにいわせたいかっけーだろ',
  lyric_with_ruby: '\{特別,とくべつ\}なあの\{子,こ\}を\{振り向か,ふりむか\}せる\{ ,\}こいつならてっぺんに\{唯一,ゆいいつ\}\{立てる,たてる\}\{ ,\}\{可能,かのう\}\{性,せい\}は\{100,ひゃく\}じゃないから\{楽,らく\}\{ ,\}じゃない\{ ,\}だからがむしゃら\{ ,\}\{ツケ,つけ\}は\{未来,みらい\}に\{着払い,ちゃくばらい\}\{ ,\}\{俺,おれ\}が\{君,きみ\}の\{ヒーロー,ひーろー\}になる\{ ,\}\{全て,すべて\}は\{ ,\}そのため\{ ,\}\{Heart,はーと\}\{ ,\}\{Beat,びーと\}\{ ,\}を\{刻む,きざむ\}\{ ,\}\{常に,つねに\}\{ヴィジョン,ゔぃじょん\}に\{君,きみ\}の\{スマイル,すまいる\}\{ ,\}さらに\{笑わせ,わらわせ\}たい\{絶対,ぜったい\}\{ ,\}\{(,\}\{That\'s,ざっつ\}\{ ,\}\{Right,らいと\}\{),\}\{ ,\}\{誰,だれ\}だって\{誰,だれ\}かに\{何,なに\}かの\{訳,わけ\}がある\{ ,\}から\{ ,\}\{流せる,ながせる\}\{涙,なみだ\}と\{汗,あせ\}\{ ,\}\{(,\}だけどだって\{),\}\{ ,\}ほら\{情報,じょうほう\}だら\{ ,\}け\{的,てき\}\{言い訳,いいわけ\}など\{ ,\}もうごちそうさまです\{ ,\}\{要は,ようは\}\{シンプル,しんぷる\}に\{君,きみ\}のために\{ ,\}\{世界,せかい\}\{ ,\}を\{丸ごと,まるごと\}いただきます\{ ,\}いざ\{旅立つ,たびだつ\}\{ ,\}\{捨てる,すてる\}\{邪念,じゃねん\}\{ ,\}\{(,\}\{Say,せい\}\{ ,\}\{Love,らぶ\}\{),\}\{ ,\}\{熱い,あつい\}\{応援,おうえん\}が\{力,ちから\}になる\{ ,\}\{一歩,いっぽ\}また\{一歩,いっぽ\}\{ ,\}\{確実,かくじつ\}に\{踏む,ふむ\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}で\{未来,みらい\}にかぶりつき\{ ,\}\{決して,けっして\}\{離さ,はなさ\}ずに\{ ,\}\{One,わん\}\{ ,\}\{Way,うぇー\}\{ ,\}\{歩き,あるき\}\{ ,\}\{君,きみ\}に\{言わ,いわ\}せたいかっけー\{ ,\}\{(,\}だろ\{),\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'STEPBYSTEPきっとまだやれるまだまだやれるSTEPBYSTEPだってまだいけるまだまだいけるSTEPBYSTEPそこに大きな壁があるならばさらにSTEPBYSTEPBYSTEP',
  ruby: 'すてっぷばいすてっぷきっとまだやれるまだまだやれるすてっぷばいすてっぷだってまだいけるまだまだいけるすてっぷばいすてっぷそこにおおきなかべがあるならばさらにすてっぷばいすてっぷばいすてっぷ',
  lyric_with_ruby: '\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}きっとまだ\{ ,\}やれる\{ ,\}まだまだやれる\{ ,\}\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}だってまだ\{ ,\}いける\{ ,\}まだまだいける\{ ,\}\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}そこに\{大き,おおき\}\{ ,\}な\{壁,かべ\}があるならばさらに\{ ,\}\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '待たせたなとっくに着火してる茶化してるだけ特に何かしてるわけじゃないのに訳知り顔した下らない日々を終わらせにきた目に映すのはまやかしだらけおれを甘やかしダラけただけだここは天国その苦痛はHell「足踏みしてても靴は減る」歌うべき歌がわかんなかったがお前が疑わなかったからまた好きになったしムキにもなった戦う武器にも勇気にもなった器用にソロバン叩いて転ばんような生き方お前は喜ばんからBurnupモヤモヤしてるよりも燃やしてるおれの番',
  ruby: 'またせたなとっくにちゃっかしてるちゃかしてるだけとくになんかしてるわけじゃないのにわけしりがおしたくだらないひびをおわらせにきためにうつすのはまやかしだらけおれをあまやかしだらけただけだここはてんごくそのくつうはへるあしぶみしててもくつはへるうたうべきうたがわかんなかったがおまえがうたがわなかったからまたすきになったしむきにもなったたたかうぶきにもゆうきにもなったきようにそろばんたたいてころばんようないきかたおまえはよろこばんからばーんあっぷもやもやしてるよりももやしてるおれのばん',
  lyric_with_ruby: '\{待た,また\}せたなとっくに\{着火,ちゃっか\}してる\{ ,\}\{茶化し,ちゃかし\}てるだけ\{ ,\}\{特に,とくに\}\{何,なん\}かしてるわけじゃないのに\{ ,\}\{訳知り,わけしり\}\{顔,がお\}した\{下らない,くだらない\}\{日々,ひび\}を\{終わら,おわら\}せにきた\{ ,\}\{目,め\}に\{映す,うつす\}のはまやかしだらけ\{ ,\}おれを\{甘やかし,あまやかし\}\{ ,\}\{ダラ,だら\}けただけだ\{ ,\}ここは\{天国,てんごく\}\{ ,\}その\{苦痛,くつう\}は\{ ,\}\{Hell,へる\}\{ ,\}\{「,\}\{足踏み,あしぶみ\}してても\{靴,くつ\}は\{減る,へる\}\{」,\}\{ ,\}\{歌う,うたう\}べき\{歌,うた\}がわかんなかったが\{ ,\}\{お前,おまえ\}が\{疑わ,うたがわ\}なかったから\{ ,\}また\{ ,\}\{好き,すき\}になったし\{ムキ,むき\}にもなった\{ ,\}\{戦う,たたかう\}\{武器,ぶき\}にも\{勇気,ゆうき\}にもなった\{ ,\}\{器用,きよう\}に\{ソロバン,そろばん\}\{叩い,たたい\}て\{転ば,ころば\}んよ\{ ,\}うな\{生き方,いきかた\}\{ ,\}\{お前,おまえ\}は\{喜ば,よろこば\}ん\{ ,\}から\{ ,\}\{Burn,ばーん\}\{ ,\}\{up,あっぷ\}\{ ,\}\{モヤモヤ,もやもや\}してる\{ ,\}よりも\{燃やし,もやし\}てる\{ ,\}おれの\{番,ばん\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'STEPBYSTEPきっとまだやれるまだまだやれるSTEPBYSTEPだってまだいけるまだまだいけるSTEPBYSTEPそこに大きな壁があるならばさらにSTEPBYSTEPBYSTEP',
  ruby: 'すてっぷばいすてっぷきっとまだやれるまだまだやれるすてっぷばいすてっぷだってまだいけるまだまだいけるすてっぷばいすてっぷそこにおおきなかべがあるならばさらにすてっぷばいすてっぷばいすてっぷ',
  lyric_with_ruby: '\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}きっとまだ\{ ,\}やれる\{ ,\}まだまだやれる\{ ,\}\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}だってまだ\{ ,\}いける\{ ,\}まだまだいける\{ ,\}\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}そこに\{大き,おおき\}\{ ,\}な\{壁,かべ\}があるならばさらに\{ ,\}\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'STEPBYSTEPきっとまだやれるまだまだやれるSTEPBYSTEPだってまだいけるまだまだいけるSTEPBYSTEPそこに大きな壁があるならばさらにSTEPBYSTEPBYSTEP',
  ruby: 'すてっぷばいすてっぷきっとまだやれるまだまだやれるすてっぷばいすてっぷだってまだいけるまだまだいけるすてっぷばいすてっぷそこにおおきなかべがあるならばさらにすてっぷばいすてっぷばいすてっぷ',
  lyric_with_ruby: '\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}きっとまだ\{ ,\}やれる\{ ,\}まだまだやれる\{ ,\}\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}だってまだ\{ ,\}いける\{ ,\}まだまだいける\{ ,\}\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}そこに\{大き,おおき\}\{ ,\}な\{壁,かべ\}があるならばさらに\{ ,\}\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}\{BY,ばい\}\{ ,\}\{STEP,すてっぷ\}\{ ,\}',
  lyric_order: 6,
)

