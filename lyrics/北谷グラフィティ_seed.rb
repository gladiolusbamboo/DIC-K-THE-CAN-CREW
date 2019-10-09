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
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'Orionな日々IjustHititsoホットなリディム喉ごし美味alwayslovin\'エブリデイjackthenextone!北谷グラフィティ',
  ruby: 'おりおんなひびあいじゃすとひっといっとそーほっとなりでぃむのどごしびみおーるうぇいずらびんえぶりでいじゃっくざねくすとわんちゃてぃーんぐらふぃてぃ',
  lyric_with_ruby: '\{Orion,おりおん\}\{ ,\}な\{日々,ひび\}\{ ,\}\{I,あい\}\{ ,\}\{just,じゃすと\}\{ ,\}\{Hit,ひっと\}\{ ,\}\{it,いっと\}\{ ,\}\{so,そー\}\{ ,\}\{ホット,ほっと\}な\{リディム,りでぃむ\}\{ ,\}\{喉,のど\}ごし\{美味,びみ\}\{ ,\}\{always,おーるうぇいず\}\{ ,\}\{lovin,らびん\}\{\',\}\{ ,\}\{エブリデイ,えぶりでい\}\{ ,\}\{jack,じゃっく\}\{ ,\}\{the,ざ\}\{ ,\}\{next,ねくすと\}\{ ,\}\{one,わん\}\{!,\}\{ ,\}\{北谷,ちゃてぃーん\}\{グラフ,ぐらふ\}\{ィティ,ぃてぃ\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'AWopbopaloolopalopbamboo北谷グラフィティ',
  ruby: 'あわっぷばっぷあるーらっぷあらっぷばんぶーちゃてぃーんぐらふぃてぃ',
  lyric_with_ruby: '\{A,あ\}\{ ,\}\{Wop,わっぷ\}\{ ,\}\{bop,ばっぷ\}\{ ,\}\{a,あ\}\{ ,\}\{loo,るー\}\{ ,\}\{lop,らっぷ\}\{ ,\}\{a,あ\}\{ ,\}\{lop,らっぷ\}\{ ,\}\{bam,ばん\}\{ ,\}\{boo,ぶー\}\{ ,\}\{北谷,ちゃてぃーん\}\{グラフ,ぐらふ\}\{ィティ,ぃてぃ\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '踊りたんねぇまだ呑みたんねぇスッキリ淡麗程度じゃ済まねぇもっと濃いの持って来いやhothotホットでドライな熱帯のファイヤーあの娘はジューシーパパイヤマンゴー輝くビューティーサファイアダイヤモンド態度はヒュージーだけど瞬時に口説き落としちゃうのはこんなミュージック',
  ruby: 'おどりたんねぇまだのみたんねぇすっきりたんれいていどじゃすまねぇもっとこいのもってこいやほっとほっとほっとでどらいなねったいのふぁいやーあのこはじゅーしーぱぱいやまんごーかがやくびゅーてぃーさふぁいあだいやもんどたいどはひゅーじーだけどしゅんじにくどきおとしちゃうのはこんなみゅーじっく',
  lyric_with_ruby: '\{踊り,おどり\}たんねぇ\{ ,\}まだ\{呑み,のみ\}たんねぇ\{ ,\}\{スッキリ,すっきり\}\{淡麗,たんれい\}\{ ,\}\{程度,ていど\}じゃ\{済ま,すま\}ねぇ\{ ,\}もっと\{濃い,こい\}の\{持っ,もっ\}て\{来,こ\}いや\{ ,\}\{hot,ほっと\}\{ ,\}\{hot,ほっと\}\{ ,\}\{ホット,ほっと\}で\{ドライ,どらい\}な\{熱帯,ねったい\}の\{ファイヤー,ふぁいやー\}\{ ,\}あの\{娘,こ\}は\{ジューシー,じゅーしー\}\{ ,\}\{パパイヤ,ぱぱいや\}\{ ,\}\{マンゴー,まんごー\}\{ ,\}\{輝く,かがやく\}\{ビューティー,びゅーてぃー\}\{ ,\}\{サファイア,さふぁいあ\}\{ ,\}\{ダイヤモンド,だいやもんど\}\{ ,\}\{態度,たいど\}は\{ヒュージー,ひゅーじー\}\{ ,\}だけど\{瞬時,しゅんじ\}に\{口説き落とし,くどきおとし\}ちゃうのはこんな\{ミュージック,みゅーじっく\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'IsayシュビデュビアスタラブギI\'mlikeグーフィーグーフィーやっぱ惚れちまった空気このグルーヴィンwhatawonderfulworld!まじフルーティー即スライドyourrightsideアイノウユーノウ君に触れてたいの暖まったまんまのフロア胸焦がす北谷グラフィティ',
  ruby: 'あいせいしゅびでゅびあすたらぶぎあいむらいくぐーふぃーぐーふぃーやっぱほれちまったくうきこのぐるーゔぃんわっとあわんだふるわーるどまじふるーてぃーそくすらいどゆあらいとさいどあいのうゆーのうきみにふれてたいのあったまったまんまのふろあむねこがすちゃてぃーんぐらふぃてぃ',
  lyric_with_ruby: '\{I,あい\}\{ ,\}\{say,せい\}\{ ,\}\{シュビデュビ,しゅびでゅび\}\{ ,\}\{アスタラブギ,あすたらぶぎ\}\{ ,\}\{I\'m,あいむ\}\{ ,\}\{like,らいく\}\{ ,\}\{グーフィーグーフィー,ぐーふぃーぐーふぃー\}\{ ,\}やっぱ\{惚れ,ほれ\}ちまった\{空気,くうき\}\{ ,\}この\{グルーヴィン,ぐるーゔぃん\}\{ ,\}\{what,わっと\}\{ ,\}\{a,あ\}\{ ,\}\{wonderful,わんだふる\}\{ ,\}\{world,わーるど\}\{!,\}\{ ,\}まじ\{フルーティー,ふるーてぃー\}\{ ,\}\{即,そく\}\{スライド,すらいど\}\{ ,\}\{your,ゆあ\}\{ ,\}\{right,らいと\}\{ ,\}\{side,さいど\}\{ ,\}\{アイノウ,あいのう\}\{ ,\}\{ユーノウ,ゆーのう\}\{ ,\}\{君,きみ\}に\{触れ,ふれ\}てたいの\{ ,\}\{暖まっ,あったまっ\}たまんまの\{フロア,ふろあ\}\{ ,\}\{胸,むね\}\{焦がす,こがす\}\{北谷,ちゃてぃーん\}\{グラフ,ぐらふ\}\{ィティ,ぃてぃ\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'Orionな日々IjustHititsoホットなリディム喉ごし美味alwayslovin\'エブリデイjackthenextone!北谷グラフィティ',
  ruby: 'おりおんなひびあいじゃすとひっといっとそーほっとなりでぃむのどごしびみおーるうぇいずらびんえぶりでいじゃっくざねくすとわんちゃてぃーんぐらふぃてぃ',
  lyric_with_ruby: '\{Orion,おりおん\}\{ ,\}な\{日々,ひび\}\{ ,\}\{I,あい\}\{ ,\}\{just,じゃすと\}\{ ,\}\{Hit,ひっと\}\{ ,\}\{it,いっと\}\{ ,\}\{so,そー\}\{ ,\}\{ホット,ほっと\}な\{リディム,りでぃむ\}\{ ,\}\{喉,のど\}ごし\{美味,びみ\}\{ ,\}\{always,おーるうぇいず\}\{ ,\}\{lovin,らびん\}\{\',\}\{ ,\}\{エブリデイ,えぶりでい\}\{ ,\}\{jack,じゃっく\}\{ ,\}\{the,ざ\}\{ ,\}\{next,ねくすと\}\{ ,\}\{one,わん\}\{!,\}\{ ,\}\{北谷,ちゃてぃーん\}\{グラフ,ぐらふ\}\{ィティ,ぃてぃ\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'AWopbopaloolopalopbamboo北谷グラフィティ',
  ruby: 'あわっぷばっぷあるーらっぷあらっぷばんぶーちゃてぃーんぐらふぃてぃ',
  lyric_with_ruby: '\{A,あ\}\{ ,\}\{Wop,わっぷ\}\{ ,\}\{bop,ばっぷ\}\{ ,\}\{a,あ\}\{ ,\}\{loo,るー\}\{ ,\}\{lop,らっぷ\}\{ ,\}\{a,あ\}\{ ,\}\{lop,らっぷ\}\{ ,\}\{bam,ばん\}\{ ,\}\{boo,ぶー\}\{ ,\}\{北谷,ちゃてぃーん\}\{グラフ,ぐらふ\}\{ィティ,ぃてぃ\}\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'Firsttime出会いの刺激忘れらんねぇぜあんな衝撃ポンポン!弾けた泡のようなbodyline海と太陽風とJaminさlikeaワイニーワイニー情熱的腰つきハイにハイになるドープな飲み口Ineed逢いに行こうもう病みつきHotな君を飲み干しにRideon!',
  ruby: 'ふぁーすとたいむであいのしげきわすれらんねぇぜあんなしょうげきぽんぽんはじけたあわのようなぼでぃーらいんうみとたいようかぜとじゃみんさらいくあわいにーわいにーじょうねつてきこしつきはいにはいになるどーぷなのみくちあいにーどあいにいこうもうやみつきほっとなきみをのみほしにらいどおん',
  lyric_with_ruby: '\{First,ふぁーすと\}\{ ,\}\{time,たいむ\}\{ ,\}\{出会い,であい\}の\{刺激,しげき\}\{ ,\}\{忘れ,わすれ\}らんねぇぜあんな\{衝撃,しょうげき\}\{ ,\}\{ポンポン,ぽんぽん\}\{!,\}\{弾け,はじけ\}た\{泡,あわ\}のような\{ ,\}\{body,ぼでぃー\}\{ ,\}\{line,らいん\}\{ ,\}\{海,うみ\}と\{太陽,たいよう\}\{ ,\}\{風,かぜ\}と\{ ,\}\{Jamin,じゃみん\}\{ ,\}さ\{ ,\}\{like,らいく\}\{ ,\}\{a,あ\}\{ ,\}\{ワイニーワイニー,わいにーわいにー\}\{情熱,じょうねつ\}\{的,てき\}\{腰つき,こしつき\}\{ ,\}\{ハイ,はい\}に\{ハイ,はい\}になる\{ドープ,どーぷ\}な\{飲み,のみ\}\{口,くち\}\{ ,\}\{I,あい\}\{ ,\}\{need,にーど\}\{ ,\}\{逢,あ\}いに\{行こ,いこ\}うもう\{病みつき,やみつき\}\{ ,\}\{Hot,ほっと\}\{ ,\}な\{君,きみ\}を\{ ,\}\{飲み干し,のみほし\}に\{ ,\}\{Ride,らいど\}\{ ,\}\{on,おん\}\{!,\}\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'Orion～音にノリ踊りノリノリのオトオリOrion～これがチャティーン俺らのパティーンsunshineピカッピカ仲間にbigup俺用のbeerならチンカチンカ鎮火しないjunglefire暑い夏なななんくるないさ～',
  ruby: 'おりおんおとにのりおどりのりのりのおとおりおりおんこれがちゃてぃーんおれらのぱてぃーんさんしゃいんぴかっぴかなかまにびがっぷおれようのびあーならちんかちんかちんかしないじゃんぐるふぁいああついなつなななんくるないさー',
  lyric_with_ruby: '\{Orion,おりおん\}\{ ,\}\{～,\}\{音,おと\}に\{ノリ,のり\}\{踊り,おどり\}\{ノリノリ,のりのり\}の\{オト,おと\}\{オリ,おり\}\{ ,\}\{Orion,おりおん\}\{ ,\}\{～,\}これが\{チャティーン,ちゃてぃーん\}\{ ,\}\{俺,おれ\}らの\{パティーン,ぱてぃーん\}\{ ,\}\{sunshine,さんしゃいん\}\{ ,\}\{ピカッピカ,ぴかっぴか\}\{仲間,なかま\}に\{ ,\}\{bigup,びがっぷ\}\{ ,\}\{俺,おれ\}\{用,よう\}の\{ ,\}\{beer,びあー\}\{ ,\}なら\{チンカチンカ,ちんかちんか\}\{ ,\}\{鎮火,ちんか\}しない\{ ,\}\{junglefire,じゃんぐるふぁいあ\}\{ ,\}\{暑い,あつい\}\{夏,なつ\}\{ ,\}なななんくるないさ\{～,ー\}\{ ,\}',
  lyric_order: 8,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 5,
  lyric: 'えんやーこーらや(dropitlikeyouthathotallabout)ガッカリさせない期待に応えてあっちもこっちも超かわウィィたまらなウィィどうしたらウィィのさ問いたい問いつめたウィィというよりじっと見つめてたウィィいやいや独り占めしたウィィだーウィィんこんなウィィ加減なおいらとも遊んでくれるかな?(ウィィともー)',
  ruby: 'えんやーこーらやどろっぷいっとらいくゆーざっとほっとおーるあばうとがっかりさせないきたいにこたえてあっちもこっちもちょうかわうぃぃたまらなうぃぃどうしたらうぃぃのさといたいといつめたうぃぃというよりじっとみつめてたうぃぃいやいやひとりじめしたうぃぃだーうぃぃんこんなうぃぃかげんなおいらともあそんでくれるかなうぃぃともー',
  lyric_with_ruby: 'えんやーこーらや\{ ,\}\{(,\}\{drop,どろっぷ\}\{ ,\}\{it,いっと\}\{ ,\}\{like,らいく\}\{ ,\}\{you,ゆー\}\{ ,\}\{that,ざっと\}\{ ,\}\{hot,ほっと\}\{ ,\}\{all,おーる\}\{ ,\}\{about,あばうと\}\{),\}\{ ,\}\{ガッカリ,がっかり\}させない\{期待,きたい\}に\{応え,こたえ\}てあっちもこっちも\{超,ちょう\}かわ\{ウィィ,うぃぃ\}\{ ,\}たまらな\{ウィィ,うぃぃ\}\{ ,\}どうしたら\{ウィィ,うぃぃ\}のさ\{ ,\}\{問い,とい\}たい\{問いつめ,といつめ\}た\{ウィィ,うぃぃ\}\{ ,\}というよりじっと\{見つめ,みつめ\}てた\{ウィィ,うぃぃ\}\{ ,\}いやいや\{独り占め,ひとりじめ\}した\{ウィィ,うぃぃ\}\{ ,\}だ\{ーウィィ,ーうぃぃ\}ん\{ ,\}こんな\{ウィィ,うぃぃ\}\{加減,かげん\}なおいらとも\{遊ん,あそん\}でくれるかな\{?,\}\{ ,\}\{(,\}\{ウィィ,うぃぃ\}ともー\{),\}\{ ,\}',
  lyric_order: 9,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'Orionな日々IjustHititsoホットなリディム喉ごし美味alwayslovin\'エブリデイjackthenextone!北谷グラフィティ',
  ruby: 'おりおんなひびあいじゃすとひっといっとそーほっとなりでぃむのどごしびみおーるうぇいずらびんえぶりでいじゃっくざねくすとわんちゃてぃーんぐらふぃてぃ',
  lyric_with_ruby: '\{Orion,おりおん\}\{ ,\}な\{日々,ひび\}\{ ,\}\{I,あい\}\{ ,\}\{just,じゃすと\}\{ ,\}\{Hit,ひっと\}\{ ,\}\{it,いっと\}\{ ,\}\{so,そー\}\{ ,\}\{ホット,ほっと\}な\{リディム,りでぃむ\}\{ ,\}\{喉,のど\}ごし\{美味,びみ\}\{ ,\}\{always,おーるうぇいず\}\{ ,\}\{lovin,らびん\}\{\',\}\{ ,\}\{エブリデイ,えぶりでい\}\{ ,\}\{jack,じゃっく\}\{ ,\}\{the,ざ\}\{ ,\}\{next,ねくすと\}\{ ,\}\{one,わん\}\{ ,\}\{!,\}\{ ,\}\{北谷,ちゃてぃーん\}\{グラフ,ぐらふ\}\{ィティ,ぃてぃ\}\{ ,\}',
  lyric_order: 10,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'AWopbopaloolopalopbamboo北谷グラフィティ',
  ruby: 'あわっぷばっぷあるーらっぷあらっぷばんぶーちゃてぃーんぐらふぃてぃ',
  lyric_with_ruby: '\{A,あ\}\{ ,\}\{Wop,わっぷ\}\{ ,\}\{bop,ばっぷ\}\{ ,\}\{a,あ\}\{ ,\}\{loo,るー\}\{ ,\}\{lop,らっぷ\}\{ ,\}\{a,あ\}\{ ,\}\{lop,らっぷ\}\{ ,\}\{bam,ばん\}\{ ,\}\{boo,ぶー\}\{ ,\}\{北谷,ちゃてぃーん\}\{グラフ,ぐらふ\}\{ィティ,ぃてぃ\}\{ ,\}',
  lyric_order: 11,
)

