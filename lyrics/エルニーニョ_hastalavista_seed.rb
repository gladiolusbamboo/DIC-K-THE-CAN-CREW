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
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'バーカウンターは賑わってパーティータイムが始まってる誰もが浮かれてるいつものムードだろ熱く胸は高まって貴女と視線からまってはじけとんでどこまでだって落ちてしまいそうクレイジー',
  ruby: 'ばーかうんたーはにぎわってぱーてぃーたいむがはじまってるだれもがうかれてるいつものむーどだろあつくむねはたかまってきじょとしせんからまってはじけとんでどこまでだっておちてしまいそうくれいじー',
  lyric_with_ruby: '\{バー,ばー\}\{カウンター,かうんたー\}は\{賑わっ,にぎわっ\}て\{ ,\}\{パーティー,ぱーてぃー\}\{タイム,たいむ\}が\{始まっ,はじまっ\}てる\{ ,\}\{誰,だれ\}もが\{浮かれ,うかれ\}てる\{ ,\}いつもの\{ムード,むーど\}だろ\{ ,\}\{熱く,あつく\}\{胸,むね\}は\{高まっ,たかまっ\}て\{ ,\}\{貴女,きじょ\}と\{視線,しせん\}からまって\{ ,\}はじけとんでどこまでだって\{ ,\}\{落ち,おち\}てしまいそう\{ ,\}\{クレイジー,くれいじー\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '12345partypeople\'sintheplaceホットなジャングルナイトだアイコンタクトはドライでクレイジーつれないそぶりのマーマレイディーさ俺もお前も何の罪も無い深みにハマる?そりゃ無理も無い魅惑の手口喰らっちまっても何度だってぶっキャマせ!',
  ruby: 'いちふたみっよんごぱーてぃーぴーぷるえすいんじほっとなじゃんぐるないとだあいこんたくとはどらいでくれいじーつれないそぶりのまーまれいでぃーさおれもおまえもなにのつみもないふかみにはまるそりゃむりもないみわくのてぐちくらっちまってもなんどだってぶっきゃませ',
  lyric_with_ruby: '\{1,いち\}\{ ,\}\{2,ふた\}\{ ,\}\{3,みっ\}\{ ,\}\{4,よん\}\{ ,\}\{5,ご\}\{ ,\}\{party,ぱーてぃー\}\{ ,\}\{people,ぴーぷる\}\{\',\}\{s,えす\}\{ ,\}\{in,いん\}\{ ,\}\{the,じ\}\{ ,\}\{place,\}\{ ,\}\{ホット,ほっと\}な\{ジャングル,じゃんぐる\}\{ナイト,ないと\}だ\{ ,\}\{アイコンタクト,あいこんたくと\}は\{ドライ,どらい\}で\{クレイジー,くれいじー\}\{ ,\}つれないそぶりの\{マーマレイディー,まーまれいでぃー\}さ\{ ,\}\{俺,おれ\}も\{お前,おまえ\}も\{何,なに\}の\{罪,つみ\}も\{無い,ない\}\{ ,\}\{深み,ふかみ\}に\{ハマる,はまる\}\{?,\}\{ ,\}そりゃ\{無理,むり\}も\{無い,ない\}\{ ,\}\{魅惑,みわく\}の\{手口,てぐち\}\{ ,\}\{喰らっ,くらっ\}ちまっても\{ ,\}\{何,なん\}\{度,ど\}だってぶっ\{キャマ,きゃま\}せ\{!,\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'クレイジーshegotクレイジー触れられないbrazingクレイジーshegotクレイジー逃げられないfreezingクレイジーshegotクレイジー触れられないbrazingクレイジーshegotクレイジー触れられない逃げられない',
  ruby: 'くれいじーごっとくれいじーふれられないくれいじーごっとくれいじーにげられないくれいじーごっとくれいじーふれられないくれいじーごっとくれいじーふれられないにげられない',
  lyric_with_ruby: '\{クレイジー,くれいじー\}\{ ,\}\{she,\}\{ ,\}\{got,ごっと\}\{ ,\}\{クレイジー,くれいじー\}\{ ,\}\{触れ,ふれ\}られない\{ ,\}\{brazing,\}\{ ,\}\{クレイジー,くれいじー\}\{ ,\}\{she,\}\{ ,\}\{got,ごっと\}\{ ,\}\{クレイジー,くれいじー\}\{ ,\}\{逃げ,にげ\}られない\{ ,\}\{freezing,\}\{ ,\}\{クレイジー,くれいじー\}\{ ,\}\{she,\}\{ ,\}\{got,ごっと\}\{ ,\}\{クレイジー,くれいじー\}\{ ,\}\{触れ,ふれ\}られない\{ ,\}\{brazing,\}\{ ,\}\{クレイジー,くれいじー\}\{ ,\}\{she,\}\{ ,\}\{got,ごっと\}\{ ,\}\{クレイジー,くれいじー\}\{ ,\}\{触れ,ふれ\}られない\{ ,\}\{逃げ,にげ\}られない\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'おっと待ったちょっとまったHOTNumberで酔っぱらった出会った瞬間気温上がった結局オイラ出来上がったしかしまるで君はコーヒー焼酎Drunkなのに少し冷めている様子どうする?自然現象?お次はどこまで?TakeMeHome',
  ruby: 'おっとまったちょっとまったでよっぱらったであったしゅんかんきおんあがったけっきょくおいらできあがったしかしまるできみはこーひーしょうちゅうなのにすこしさめているようすどうするしぜんげんしょうおつぎはどこまでみーほーむ',
  lyric_with_ruby: 'おっと\{待っ,まっ\}た\{ ,\}ちょっとまった\{ ,\}\{HOT,\}\{ ,\}\{Number,\}\{ ,\}で\{酔っぱらっ,よっぱらっ\}た\{ ,\}\{出会っ,であっ\}た\{瞬間,しゅんかん\}\{気温,きおん\}\{上がっ,あがっ\}た\{ ,\}\{結局,けっきょく\}\{オイラ,おいら\}\{出来上がっ,できあがっ\}た\{ ,\}しかしまるで\{君,きみ\}は\{コーヒー,こーひー\}\{焼酎,しょうちゅう\}\{ ,\}\{Drunk,\}\{ ,\}なのに\{少し,すこし\}\{冷め,さめ\}ている\{様子,ようす\}\{ ,\}どうする\{?,\}\{自然,しぜん\}\{現象,げんしょう\}\{?,\}\{ ,\}\{お次,おつぎ\}はどこまで\{?,\}\{ ,\}\{Take,\}\{ ,\}\{Me,みー\}\{ ,\}\{Home,ほーむ\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: '一杯二杯次々つぎーにょ夜を乗りこえるエルニーニョヒートアップアップ熱々のやつ安めのラブをやすやす燃やすもっともエロもっと燃えろホットな純情そっと乗せろ欲望の炎氷の微笑バーカン上は異常気象',
  ruby: 'いちはいにはいつぎつぎつぎーにょよるをのりこえるえるにーにょひーとあっぷあっぷあつあつのやつやすめのらぶをやすやすもやすもっともえろもっともえろほっとなじゅんじょうそっとのせろよくぼうのほのおこおりのびしょうばーかんじょうはいじょうきしょう',
  lyric_with_ruby: '\{一,いち\}\{杯,はい\}\{二,に\}\{杯,はい\}\{次々,つぎつぎ\}つぎーにょ\{ ,\}\{夜,よる\}を\{乗りこえる,のりこえる\}\{エルニーニョ,えるにーにょ\}\{ ,\}\{ヒートアップアップ,ひーとあっぷあっぷ\}\{熱々,あつあつ\}のやつ\{ ,\}\{安め,やすめ\}の\{ラブ,らぶ\}をやすやす\{燃やす,もやす\}\{ ,\}もっとも\{エロ,えろ\}もっと\{燃えろ,もえろ\}\{ ,\}\{ホット,ほっと\}な\{純情,じゅんじょう\}そっと\{乗せろ,のせろ\}\{ ,\}\{欲望,よくぼう\}の\{炎,ほのお\}\{ ,\}\{氷,こおり\}の\{微笑,びしょう\}\{ ,\}\{バーカン,ばーかん\}\{上,じょう\}は\{異常,いじょう\}\{気象,きしょう\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'クレイジーshegotクレイジー触れられないbrazingクレイジーshegotクレイジー逃げられないfreezingクレイジーshegotクレイジー触れられないbrazingクレイジーshegotクレイジー触れられない逃げられない',
  ruby: 'くれいじーごっとくれいじーふれられないくれいじーごっとくれいじーにげられないくれいじーごっとくれいじーふれられないくれいじーごっとくれいじーふれられないにげられない',
  lyric_with_ruby: '\{クレイジー,くれいじー\}\{ ,\}\{she,\}\{ ,\}\{got,ごっと\}\{ ,\}\{クレイジー,くれいじー\}\{ ,\}\{触れ,ふれ\}られない\{ ,\}\{brazing,\}\{ ,\}\{クレイジー,くれいじー\}\{ ,\}\{she,\}\{ ,\}\{got,ごっと\}\{ ,\}\{クレイジー,くれいじー\}\{ ,\}\{逃げ,にげ\}られない\{ ,\}\{freezing,\}\{ ,\}\{クレイジー,くれいじー\}\{ ,\}\{she,\}\{ ,\}\{got,ごっと\}\{ ,\}\{クレイジー,くれいじー\}\{ ,\}\{触れ,ふれ\}られない\{ ,\}\{brazing,\}\{ ,\}\{クレイジー,くれいじー\}\{ ,\}\{she,\}\{ ,\}\{got,ごっと\}\{ ,\}\{クレイジー,くれいじー\}\{ ,\}\{触れ,ふれ\}られない\{ ,\}\{逃げ,にげ\}られない\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 5,
  lyric: 'shesayヒステリックなガキ達と違い一言で凍えるくらいにクオンタイズ人生のシーケンス上にあらわれて一瞬で奪われたマイハートOneinamillionfunkyfunkybabyエルニーニョいつも通りじゃないOneinamillion万に一つベイベそうラニーニャは一筋縄じゃない',
  ruby: 'せいひすてりっくながきたちとちがいひとことでこごえるくらいにくおんたいずじんせいのしーけんすじょうにあらわれていっしゅんでうばわれたまいはーとわんいんあえるにーにょいつもとおりじゃないわんいんあまんにひとつべいべそうらにーにゃはひとすじなわじゃない',
  lyric_with_ruby: '\{she,\}\{ ,\}\{say,せい\}\{ ,\}\{ヒステリック,ひすてりっく\}な\{ガキ,がき\}\{達,たち\}と\{違い,ちがい\}\{ ,\}\{一言,ひとこと\}で\{凍える,こごえる\}くらいに\{クオンタイズ,くおんたいず\}\{ ,\}\{人生,じんせい\}の\{シーケンス,しーけんす\}\{上,じょう\}にあらわれて\{ ,\}\{一瞬,いっしゅん\}で\{奪わ,うばわ\}れた\{マイ,まい\}\{ハート,はーと\}\{ ,\}\{One,わん\}\{ ,\}\{in,いん\}\{ ,\}\{a,あ\}\{ ,\}\{million,\}\{ ,\}\{funky,\}\{ ,\}\{funky,\}\{ ,\}\{baby,\}\{ ,\}\{エルニーニョ,えるにーにょ\}\{ ,\}いつも\{通り,とおり\}じゃない\{ ,\}\{One,わん\}\{ ,\}\{in,いん\}\{ ,\}\{a,あ\}\{ ,\}\{million,\}\{ ,\}\{万,まん\}に\{一つ,ひとつ\}\{ ,\}\{ベイベ,べいべ\}\{ ,\}そう\{ラニーニャ,らにーにゃ\}は\{ ,\}\{一筋縄,ひとすじなわ\}じゃない\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 6,
  lyric: '酔いは序の口ですらないもっとぶっ飛ぶthroughthenight俺がエルニーニョI\'mtheman君がラニーニャwhosegirl?もっとついでもかまわない?何が欲しいの?ナニーラ俺はエルニーニョ君はラニーニャ今宵燃えあがりたい',
  ruby: 'よいはじょのくちですらないもっとぶっとぶじないとおれがえるにーにょあいむじきみがらにーにゃもっとついでもかまわないなにがほしいのなにーらおれはえるにーにょきみはらにーにゃこよいもえあがりたい',
  lyric_with_ruby: '\{酔い,よい\}は\{序の口,じょのくち\}ですらない\{ ,\}もっとぶっ\{飛ぶ,とぶ\}\{ ,\}\{through,\}\{ ,\}\{the,じ\}\{ ,\}\{night,ないと\}\{ ,\}\{俺,おれ\}が\{エルニーニョ,えるにーにょ\}\{ ,\}\{I\'m,あいむ\}\{ ,\}\{the,じ\}\{ ,\}\{man,\}\{ ,\}\{君,きみ\}が\{ラニーニャ,らにーにゃ\}\{ ,\}\{whose,\}\{ ,\}\{girl,\}\{?,\}\{ ,\}もっとついでもかまわない\{?,\}\{ ,\}\{何,なに\}が\{欲しい,ほしい\}の\{?,\}\{ ,\}\{ナニーラ,なにーら\}\{ ,\}\{俺,おれ\}は\{エルニーニョ,えるにーにょ\}\{ ,\}\{君,きみ\}は\{ラニーニャ,らにーにゃ\}\{ ,\}\{今宵,こよい\}\{ ,\}\{燃え,もえ\}あがりたい\{ ,\}',
  lyric_order: 8,
)

