artist_name =    'アスタラビスタ'
lyricUrl_url =   nil
cd_name =        'ヤバスタ'
cd_released_at = '2014-03-26'
song_name =      'el requiem'
song_lyricist =  'アスタラビスタ'
song_composer =  'アスタラビスタ'
song_arranger =  'People People(DJ KiMJUN & iMAIZUMi)'
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
  lyric: 'Tellmesomebody教えてbuddysいつが終わりか誰も知らないTellmesomebody教えてbabyまだ足りないよPartyain\'tover',
  ruby: 'てるみーさむばでぃおしえてばでぃーずいつがおわりかだれもしらないてるみーさむばでぃおしえてべいびーまだたりないよぱーてぃーえいんとおーばー',
  lyric_with_ruby: '\{Tell,てる\}\{ ,\}\{me,みー\}\{ ,\}\{somebody,さむばでぃ\}\{ ,\}\{教え,おしえ\}て\{ ,\}\{buddys,ばでぃーず\}\{ ,\}いつが\{終わり,おわり\}か\{誰,だれ\}も\{知ら,しら\}ない\{ ,\}\{Tell,てる\}\{ ,\}\{me,みー\}\{ ,\}\{somebody,さむばでぃ\}\{ ,\}\{教え,おしえ\}て\{ ,\}\{baby,べいびー\}\{ ,\}まだ\{足り,たり\}ないよ\{ ,\}\{Party,ぱーてぃー\}\{ ,\}\{ain\'t,えいんと\}\{ ,\}\{over,おーばー\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'まさかの居残り俺たちのみコンフューズへオーガナイズして行く今宵テメェの与太なんざ酒の当てにもなんねぇ当てもなくフラフラっと浮雲の人生所詮俺なんて…たかが知れてるってこぼすんじゃねぇ愚痴とグラスの中身俺の奢りだまぁもう一杯どうだい?いつものお前らしくグッと呑み干しな緩くねぇ時泣くヤツは三流歯食いしばるのは二流果てしなく笑えそれが一流ハッハッビックティンナフリスペクト火の玉銀次浮世の不一致なんて関係ねぇとことん行くぜがっぷり四つでクリンチこの辺で今夜は切り上げようか?いやいや焦んなよまぁもう一杯いこうか?',
  ruby: 'まさかのいのこりおれたちのみこんふゅーずへおーがないずしていくこよいてめぇのよたなんざさけのあてにもなんねぇあてもなくふらふらっとうきぐものじんせいしょせんおれなんてたかがしれてるってこぼすんじゃねぇぐちとぐらすのなかみおれのおごりだまぁもういっぱいどうだいいつものおまえらしくぐっとのみほしなゆるくねぇときなくやつはさんりゅうはくいしばるのはにりゅうはてしなくわらえそれがいちりゅうはっはっびっくてぃんなふりすぺくとひのたまぎんじうきよのふいっちなんてかんけいねぇとことんいくぜがっぷりよつでくりんちこのへんでこんやはきりあげようかいやいやあせんなよまぁもういっぱいいこうか',
  lyric_with_ruby: 'まさかの\{居残り,いのこり\}\{ ,\}\{俺,おれ\}たちのみ\{ ,\}\{コンフューズ,こんふゅーず\}へ\{オーガナイズ,おーがないず\}して\{行く,いく\}\{今宵,こよい\}\{ ,\}\{テメェ,てめぇ\}の\{与太,よた\}なんざ\{酒,さけ\}の\{当て,あて\}にもなんねぇ\{ ,\}\{当て,あて\}もなく\{フラ,ふら\}\{フラ,ふら\}っと\{浮雲,うきぐも\}の\{人生,じんせい\}\{ ,\}\{所詮,しょせん\}\{俺,おれ\}なんて\{…,\}たかが\{知れ,しれ\}てるって\{ ,\}こぼすんじゃねぇ\{愚痴,ぐち\}と\{グラス,ぐらす\}の\{中身,なかみ\}\{ ,\}\{俺,おれ\}の\{奢り,おごり\}だまぁもう\{一杯,いっぱい\}どうだい\{?,\}\{ ,\}いつもの\{お前,おまえ\}らしく\{グッ,ぐっ\}と\{呑み,のみ\}\{干し,ほし\}な\{ ,\}\{緩く,ゆるく\}ねぇ\{時,とき\}\{泣く,なく\}\{ヤツ,やつ\}は\{三流,さんりゅう\}\{ ,\}\{歯,は\}\{食いしばる,くいしばる\}のは\{二流,にりゅう\}\{ ,\}\{果てしなく,はてしなく\}\{笑え,わらえ\}\{ ,\}それが\{一流,いちりゅう\}\{ ,\}\{ハッ,はっ\}\{ハッ,はっ\}\{ ,\}\{ビックティン,びっくてぃん\}\{ ,\}\{ナフリスペクト,なふりすぺくと\}\{ ,\}\{火の玉,ひのたま\}\{銀,ぎん\}\{次,じ\}\{ ,\}\{浮世,うきよ\}の\{不一致,ふいっち\}なんて\{関係,かんけい\}ねぇ\{ ,\}とことん\{行く,いく\}ぜ\{ ,\}がっぷり\{四つ,よつ\}で\{クリンチ,くりんち\}\{ ,\}この\{辺,へん\}で\{今夜,こんや\}は\{切り上げよ,きりあげよ\}うか\{?,\}\{ ,\}いやいや\{ ,\}\{焦ん,あせん\}なよまぁもう\{一杯,いっぱい\}いこうか\{?,\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '夕闇に誘われWhyyougottabelikethatただ慰め合いたくてBecauseIgottarightback朝焼けにとけあってWhyyougottabelikethatまた唄いだしたくなってBecauseIgottarightback',
  ruby: 'ゆうやみにいざなわれわいゆーがったびーらいくざっとただなぐさめあいたくてびこーずあいがったらいとばっくあさやけにとけあってわいゆーがったびーらいくざっとまたうたいだしたくなってびこーずあいがったらいとばっく',
  lyric_with_ruby: '\{夕闇,ゆうやみ\}に\{誘わ,いざなわ\}れ\{ ,\}\{Why,わい\}\{ ,\}\{you,ゆー\}\{ ,\}\{gotta,がった\}\{ ,\}\{be,びー\}\{ ,\}\{like,らいく\}\{ ,\}\{that,ざっと\}\{ ,\}ただ\{慰め,なぐさめ\}\{合い,あい\}たくて\{ ,\}\{Because,びこーず\}\{ ,\}\{I,あい\}\{ ,\}\{gotta,がった\}\{ ,\}\{right,らいと\}\{ ,\}\{back,ばっく\}\{ ,\}\{朝焼け,あさやけ\}にとけあって\{ ,\}\{Why,わい\}\{ ,\}\{you,ゆー\}\{ ,\}\{gotta,がった\}\{ ,\}\{be,びー\}\{ ,\}\{like,らいく\}\{ ,\}\{that,ざっと\}\{ ,\}また\{唄い,うたい\}だしたくなって\{ ,\}\{Because,びこーず\}\{ ,\}\{I,あい\}\{ ,\}\{gotta,がった\}\{ ,\}\{right,らいと\}\{ ,\}\{back,ばっく\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'いい感じだぜ間違いなんか恐れない異端児達がいたんだ確かに言ったんだアイツは一旦、一旦帰るだけさってフェイドイン町外れのアートフェイドアウトアイツの夢のあとみなが寝ついてる夜に根づいてる同志達のレクイエムアンセムようやく酒が似合うころ今は2ヴァース目アウトロにゃまだ早えここでつぶれるほどやわじゃねえしそれにもう帰り道もわからねえあの日からずっと酔ったままいろいろなものに寄っ掛かった手持ちの強がりも尽きたくせにまだいくんならおれも付き合うぜ',
  ruby: 'いいかんじだぜまちがいなんかおそれないいたんじたちがいたんだたしかにいったんだあいつはいったんいったんかえるだけさってふぇいどいんまちはずれのあーとふぇいどあうとあいつのゆめのあとみながねついてるよるにねづいてるどうしたちのれくいえむあんせむようやくさけがにあうころいまはつーゔぁーすめあうとろにゃまだはええここでつぶれるほどやわじゃねえしそれにもうかえりみちもわからねえあのひからずっとよったままいろいろなものによっかかったてもちのつよがりもつきたくせにまだいくんならおれもつきあうぜ',
  lyric_with_ruby: 'いい\{感じ,かんじ\}だぜ\{間違い,まちがい\}なんか\{ ,\}\{恐れ,おそれ\}ない\{異端,いたん\}\{児,じ\}\{達,たち\}がいたんだ\{ ,\}\{確か,たしか\}に\{言っ,いっ\}たんだ\{アイツ,あいつ\}は\{ ,\}\{一旦,いったん\}\{、,\}\{一旦,いったん\}\{帰る,かえる\}だけさって\{ ,\}\{フェイドイン,ふぇいどいん\}\{町外れ,まちはずれ\}の\{アート,あーと\}\{ ,\}\{フェイドアウト,ふぇいどあうと\}\{ ,\}\{アイツ,あいつ\}の\{夢,ゆめ\}のあと\{ ,\}みなが\{寝つい,ねつい\}てる\{夜,よる\}に\{根づい,ねづい\}てる\{ ,\}\{同志,どうし\}\{達,たち\}の\{レクイエム,れくいえむ\}\{ ,\}\{アンセム,あんせむ\}\{ ,\}ようやく\{酒,さけ\}が\{似合う,にあう\}ころ\{ ,\}\{今,いま\}は\{2,つー\}\{ヴァース,ゔぁーす\}\{目,め\}\{アウトロ,あうとろ\}にゃまだ\{早,はえ\}え\{ ,\}ここでつぶれるほどやわじゃねえし\{ ,\}それにもう\{ ,\}\{帰り道,かえりみち\}もわからねえ\{ ,\}あの\{日,ひ\}からずっと\{酔っ,よっ\}たまま\{ ,\}いろいろなものに\{寄っ,よっ\}\{掛かっ,かかっ\}た\{ ,\}\{手持ち,てもち\}の\{強がり,つよがり\}も\{尽き,つき\}たくせに\{ ,\}まだいくんならおれも\{付き合う,つきあう\}ぜ\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '夕闇に誘われWhyyougottabelikethatただ慰め合いたくてBecauseIgottarightback朝焼けにとけあってWhyyougottabelikethatまた唄いだしたくなってBecauseIgottarightback',
  ruby: 'ゆうやみにいざなわれわいゆーがったびーらいくざっとただなぐさめあいたくてびこーずあいがったらいとばっくあさやけにとけあってわいゆーがったびーらいくざっとまたうたいだしたくなってびこーずあいがったらいとばっく',
  lyric_with_ruby: '\{夕闇,ゆうやみ\}に\{誘わ,いざなわ\}れ\{ ,\}\{Why,わい\}\{ ,\}\{you,ゆー\}\{ ,\}\{gotta,がった\}\{ ,\}\{be,びー\}\{ ,\}\{like,らいく\}\{ ,\}\{that,ざっと\}\{ ,\}ただ\{慰め,なぐさめ\}\{合い,あい\}たくて\{ ,\}\{Because,びこーず\}\{ ,\}\{I,あい\}\{ ,\}\{gotta,がった\}\{ ,\}\{right,らいと\}\{ ,\}\{back,ばっく\}\{ ,\}\{朝焼け,あさやけ\}にとけあって\{ ,\}\{Why,わい\}\{ ,\}\{you,ゆー\}\{ ,\}\{gotta,がった\}\{ ,\}\{be,びー\}\{ ,\}\{like,らいく\}\{ ,\}\{that,ざっと\}\{ ,\}また\{唄い,うたい\}だしたくなって\{ ,\}\{Because,びこーず\}\{ ,\}\{I,あい\}\{ ,\}\{gotta,がった\}\{ ,\}\{right,らいと\}\{ ,\}\{back,ばっく\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'Tellmesomebody教えてbuddysいつが終わりか誰も知らないTellmesomebody教えてbabyまだ足りないよPartyain\'tover',
  ruby: 'てるみーさむばでぃおしえてばでぃーずいつがおわりかだれもしらないてるみーさむばでぃおしえてべいびーまだたりないよぱーてぃーえいんとおーばー',
  lyric_with_ruby: '\{Tell,てる\}\{ ,\}\{me,みー\}\{ ,\}\{somebody,さむばでぃ\}\{ ,\}\{教え,おしえ\}て\{ ,\}\{buddys,ばでぃーず\}\{ ,\}いつが\{終わり,おわり\}か\{誰,だれ\}も\{知ら,しら\}ない\{ ,\}\{Tell,てる\}\{ ,\}\{me,みー\}\{ ,\}\{somebody,さむばでぃ\}\{ ,\}\{教え,おしえ\}て\{ ,\}\{baby,べいびー\}\{ ,\}まだ\{足り,たり\}ないよ\{ ,\}\{Party,ぱーてぃー\}\{ ,\}\{ain\'t,えいんと\}\{ ,\}\{over,おーばー\}\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '何度でも繰り返そう手をあげてまた明日アスタラビスタ',
  ruby: 'なんどでもくりかえそうてをあげてまたあしたあすたらびすた',
  lyric_with_ruby: '\{何,なん\}\{度,ど\}でも\{ ,\}\{繰り返そ,くりかえそ\}う\{ ,\}\{手,て\}をあげて\{ ,\}また\{明日,あした\}\{ ,\}\{アスタラビスタ,あすたらびすた\}\{ ,\}',
  lyric_order: 7,
)

