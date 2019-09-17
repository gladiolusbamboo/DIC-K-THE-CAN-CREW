artist_name =    'アスタラビスタ'
lyricUrl_url =   nil
cd_name =        'ヤバスタ'
cd_released_at = '2014-03-26'
song_name =      'seis amigos'
song_lyricist =  'アスタラビスタ'
song_composer =  'アスタラビスタ'
song_arranger =  'DJ ISO'
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

Singer.create(
  name: 'アスタラビスタ',
  is_kick: false
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'キャマせ1・2・3&野暮なウィークデイ抜けて特別なウィークエンド集まるボーイズ&ガールズどんなリクエスト今夜もハッスルアスタラオールスターズsomethinglikeaphenomenon誘うフロアでシェキニン後は無責任勝手なパーティーロックだ俺ら適任ブッ込んじゃうパティーンさぁ行くぜ!1.2.3&',
  ruby: 'きゃませわん・つー・すりーあんどやぼなうぃーくでいぬけてとくべつなうぃーくえんどあつまるぼーいずあんどがーるずどんなりくえすとこんやもはっするあすたらおーるすたーずさむしんぐらいくあフェノメノンいざなうふろあでしぇきにんあとはむせきにんかってなぱーてぃーろっくだおれらてきにんぶっこんじゃうぱてぃーんさぁいくぜわんつーすりーあんど',
  lyric_with_ruby: '\{キャマ,きゃま\}せ\{ ,\}\{1,わん\}\{・,・\}\{2,つー\}\{・,・\}\{3,すりー\}\{&,あんど\}\{ ,\}\{野暮,やぼ\}な\{ウィークデイ,うぃーくでい\}\{抜け,ぬけ\}て\{特別,とくべつ\}な\{ウィークエンド,うぃーくえんど\}\{ ,\}\{集まる,あつまる\}\{ボーイズ,ぼーいず\}\{&,あんど\}\{ガールズ,がーるず\}どんな\{リクエスト,りくえすと\}\{ ,\}\{今夜,こんや\}も\{ハッスル,はっする\}\{ ,\}\{アスタラオールスターズ,あすたらおーるすたーず\}\{ ,\}\{something,さむしんぐ\}\{ ,\}\{like,らいく\}\{ ,\}\{a,あ\}\{ ,\}\{phenomenon,フェノメノン\}\{ ,\}\{誘う,いざなう\}\{フロア,ふろあ\}で\{シェキニン,しぇきにん\}\{ ,\}\{後,あと\}は\{無責任,むせきにん\}\{ ,\}\{勝手,かって\}な\{パーティー,ぱーてぃー\}\{ロック,ろっく\}だ\{俺,おれ\}ら\{適任,てきにん\}\{ ,\}\{ブッ,ぶっ\}\{込ん,こん\}じゃう\{パティーン,ぱてぃーん\}さぁ\{ ,\}\{行く,いく\}ぜ\{!,\}\{ ,\}\{1,わん\}\{.,\}\{2,つー\}\{.,\}\{3,すりー\}\{&,あんど\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'まずは程よくほろ酔いなんて言わせないstepupforyourright明日の朝もアスタラは逃がさないdon\'tgiveupthefight',
  ruby: 'まずはほどよくほろよいなんていわせないすてっぷあっぷふぉーゆあらいとあすのあさもあすたらはにがさないどんとぎぶあっぷざふぁいと',
  lyric_with_ruby: 'まずは\{程よく,ほどよく\}\{ほろ酔い,ほろよい\}なんて\{言わ,いわ\}せない\{ ,\}\{step,すてっぷ\}\{ ,\}\{up,あっぷ\}\{ ,\}\{for,ふぉー\}\{ ,\}\{your,ゆあ\}\{ ,\}\{right,らいと\}\{ ,\}\{明日,あす\}の\{朝,あさ\}も\{アスタラ,あすたら\}は\{逃がさ,にがさ\}ない\{ ,\}\{don\'t,どんと\}\{ ,\}\{give,ぎぶ\}\{ ,\}\{up,あっぷ\}\{ ,\}\{the,ざ\}\{ ,\}\{fight,ふぁいと\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '10987654321',
  ruby: 'てんないんえいとせぶんしっくすふぁいぶふぉーすりーつーわん',
  lyric_with_ruby: '\{10,てん\}\{ ,\}\{9,ないん\}\{ ,\}\{8,えいと\}\{ ,\}\{7,せぶん\}\{ ,\}\{6,しっくす\}\{ ,\}\{5,ふぁいぶ\}\{ ,\}\{4,ふぉー\}\{ ,\}\{3,すりー\}\{ ,\}\{2,つー\}\{ ,\}\{1,わん\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'ほらイイのね?イイのね?グラスごと激しく揺らしてビートで音の鳴る方コッチコッチヤバスタもドスタも放り込め未だ三宿のルーキー読まないゼ空気宵越しのマニー持たない主義IleftmywalletinElsegundoIgotaギリIgotgotaギリギリ',
  ruby: 'ほらいいのねいいのねぐらすごとはげしくゆらしてびーとでおとのなるほうこっちこっちやばすたもどすたもほうりこめいまだみしゅくのるーきーよまないぜくうきよいごしのまにーもたないしゅぎあいれふとまいうぉれっといんえるせがんどあいごっとあぎりあいごっとごっとあぎりぎり',
  lyric_with_ruby: 'ほら\{イイ,いい\}のね\{?,\}\{ ,\}\{イイ,いい\}のね\{?,\}\{ ,\}\{グラス,ぐらす\}ごと\{ ,\}\{激しく,はげしく\}\{揺らし,ゆらし\}て\{ビート,びーと\}で\{ ,\}\{音,おと\}の\{鳴る,なる\}\{方,ほう\}\{コッチコッチ,こっちこっち\}\{ ,\}\{ヤバスタ,やばすた\}も\{ドスタ,どすた\}も\{放り込め,ほうりこめ\}\{ ,\}\{未だ,いまだ\}\{三,み\}\{宿,しゅく\}の\{ルーキー,るーきー\}\{ ,\}\{読ま,よま\}ない\{ゼ,ぜ\}\{空気,くうき\}\{ ,\}\{宵越し,よいごし\}の\{マニー,まにー\}\{持た,もた\}ない\{主義,しゅぎ\}\{ ,\}\{I,あい\}\{ ,\}\{left,れふと\}\{ ,\}\{my,まい\}\{ ,\}\{wallet,うぉれっと\}\{ ,\}\{in,いん\}\{ ,\}\{El,える\}\{ ,\}\{segundo,せがんど\}\{ ,\}\{I,あい\}\{ ,\}\{got,ごっと\}\{ ,\}\{a,あ\}\{ ,\}\{ギリ,ぎり\}\{ ,\}\{I,あい\}\{ ,\}\{got,ごっと\}\{ ,\}\{got,ごっと\}\{ ,\}\{a,あ\}\{ ,\}\{ギリギリ,ぎりぎり\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'dieznueveochosieteseiscincocuatrotresdosuno',
  ruby: 'でぃえすぬえべおちょしえてせいすしんこくあとろとれすどすうの',
  lyric_with_ruby: '\{diez,でぃえす\}\{ ,\}\{nueve,ぬえべ\}\{ ,\}\{ocho,おちょ\}\{ ,\}\{siete,しえて\}\{ ,\}\{seis,せいす\}\{ ,\}\{cinco,しんこ\}\{ ,\}\{cuatro,くあとろ\}\{ ,\}\{tres,とれす\}\{ ,\}\{dos,どす\}\{ ,\}\{uno,うの\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'partypeopleputyourhandsintheairslowyourhandsintheairnowwavelikeajustdon\'tcare声がかれるくらいにシャウトかまわないゼsomebodysayohyeah!sayhoo!andyoudon\'tstopcomeonブルルルルルstepupハッハッはじけろウノドストレスクワトロシンコ',
  ruby: 'ぱーてぃーぴーぷるぷっとゆあはんずいんじえあーすろーゆあはんずいんじえあーなううぇーぶらいくあじゃすとどんとけあこえがかれるくらいにしゃうとかまわないぜさむばでぃせいおーいぇーせいほーあんどゆーどんとすとっぷかもんぶるるるるるすてっぷあっぷはっはっはじけろうのどすとれすくわとろしんこ',
  lyric_with_ruby: '\{party,ぱーてぃー\}\{ ,\}\{people,ぴーぷる\}\{ ,\}\{put,ぷっと\}\{ ,\}\{your,ゆあ\}\{ ,\}\{hands,はんず\}\{ ,\}\{in,いん\}\{ ,\}\{the,じ\}\{ ,\}\{air,えあー\}\{ ,\}\{slow,すろー\}\{ ,\}\{your,ゆあ\}\{ ,\}\{hands,はんず\}\{ ,\}\{in,いん\}\{ ,\}\{the,じ\}\{ ,\}\{air,えあー\}\{ ,\}\{now,なう\}\{ ,\}\{wave,うぇーぶ\}\{ ,\}\{like,らいく\}\{ ,\}\{a,あ\}\{ ,\}\{just,じゃすと\}\{ ,\}\{don\'t,どんと\}\{ ,\}\{care,けあ\}\{ ,\}\{声,こえ\}がかれるくらいに\{シャウト,しゃうと\}かまわない\{ゼ,ぜ\}\{ ,\}\{somebody,さむばでぃ\}\{ ,\}\{say,せい\}\{ ,\}\{oh,おー\}\{ ,\}\{yeah,いぇー\}\{!,\}\{ ,\}\{say,せい\}\{ ,\}\{hoo,ほー\}\{!,\}\{ ,\}\{and,あんど\}\{ ,\}\{you,ゆー\}\{ ,\}\{don\'t,どんと\}\{ ,\}\{stop,すとっぷ\}\{ ,\}\{come on,かもん\}\{ ,\}\{ブル,ぶる\}\{ルル,るる\}\{ルル,るる\}\{ ,\}\{step,すてっぷ\}\{ ,\}\{up,あっぷ\}\{ ,\}\{ハッ,はっ\}\{ハッ,はっ\}はじけろ\{ ,\}\{ウノ,うの\}\{ ,\}\{ドス,どす\}\{ ,\}\{トレス,とれす\}\{ ,\}\{クワ,くわ\}\{トロ,とろ\}\{ ,\}\{シンコ,しんこ\}\{ ,\}',
  lyric_order: 6,
)

