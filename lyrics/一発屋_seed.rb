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

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '一発屋(BYPHARTHEDOPEST)当店当然すご腕他と違う感覚に気付いてついつい手が出る2発3発一発屋(BYPHARTHEDOPEST)カジュアルもフォーマルもOK!',
  ruby: 'いっぱつやばいふぁーざどーぺすととうてんとうぜんすごうでほかとちがうかんかくにきづいてついついてがでるにはつさんぱついっぱつやばいふぁーざどーぺすとかじゅあるもふぉーまるもおーけー',
  lyric_with_ruby: '\{一発,いっぱつ\}\{屋,や\}\{ ,\}\{(,\}\{BY,ばい\}\{ ,\}\{PHAR,ふぁー\}\{ ,\}\{THE,ざ\}\{ ,\}\{DOPEST,どーぺすと\}\{),\}\{ ,\}\{当店,とうてん\}\{ ,\}\{当然,とうぜん\}\{すご腕,すごうで\}\{ ,\}\{他,ほか\}と\{違う,ちがう\}\{感覚,かんかく\}に\{気付い,きづい\}て\{ ,\}ついつい\{手,て\}が\{出る,でる\}\{2,に\}\{発,はつ\}\{3,さん\}\{発,ぱつ\}\{ ,\}\{一発,いっぱつ\}\{屋,や\}\{ ,\}\{(,\}\{BY,ばい\}\{ ,\}\{PHAR,ふぁー\}\{ ,\}\{THE,ざ\}\{ ,\}\{DOPEST,どーぺすと\}\{),\}\{ ,\}\{カジュアル,かじゅある\}も\{フォーマル,ふぉーまる\}も\{OK,おーけー\}\{!,\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '一発当てたい世界にでっかい花火をあげたい足りねぇよまだ足りねぇよ欲求は果てないあったりめえよイツナロウバいったろうかボッとしてりゃ速攻で老化幸か不幸かいまだ到達できない境遇目指して勝負だ',
  ruby: 'いっぱつあてたいせかいにでっかいはなびをあげたいたりねぇよまだたりねぇよよっきゅうははてないあったりめえよいつなろうばいったろうかぼっとしてりゃそっこうでろうかこうかふこうかいまだとうたつできないきょうぐうめざしてしょうぶだ',
  lyric_with_ruby: '\{一発,いっぱつ\}\{当て,あて\}たい\{ ,\}\{世界,せかい\}にでっかい\{花火,はなび\}をあげたい\{ ,\}\{足り,たり\}ねぇよ\{ ,\}まだ\{足り,たり\}ねぇよ\{ ,\}\{欲求,よっきゅう\}は\{果て,はて\}ない\{ ,\}あったりめえよ\{ ,\}\{イツナロウバ,いつなろうば\}\{ ,\}いったろうか\{ ,\}\{ボッ,ぼっ\}としてりゃ\{ ,\}\{速攻,そっこう\}で\{老化,ろうか\}\{ ,\}\{幸,こう\}か\{不幸,ふこう\}か\{ ,\}いまだ\{到達,とうたつ\}できない\{境遇,きょうぐう\}\{ ,\}\{目指し,めざし\}て\{勝負,しょうぶ\}だ\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'CUEZERO')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '一発キックザバースまず丁寧にリリック書くジクザグで四苦八苦合わせるちぐはぐ感情閉じ込める真空パック脳の倉庫に冷凍保存ゆっくりと解凍思う存分ご賞味あれその味覚が試されます老舗の一発屋',
  ruby: 'いっぱつきっくざばーすまずていねいにりりっくかくじくざぐでしくはっくあわせるちぐはぐかんじょうとじこめるしんくうぱっくのうのそうこにれいとうほぞんゆっくりとかいとうおもうぞんぶんごしょうみあれそのみかくがためされますしにせのいっぱつや',
  lyric_with_ruby: '\{一発,いっぱつ\}\{ ,\}\{キックザバース,きっくざばーす\}\{ ,\}まず\{丁寧,ていねい\}に\{リリック,りりっく\}\{書く,かく\}\{ ,\}\{ジクザグ,じくざぐ\}で\{四苦八苦,しくはっく\}\{ ,\}\{合わせる,あわせる\}ちぐはぐ\{ ,\}\{感情,かんじょう\}\{閉じ込める,とじこめる\}\{ ,\}\{真空,しんくう\}\{パック,ぱっく\}\{ ,\}\{脳,のう\}の\{倉庫,そうこ\}に\{冷凍,れいとう\}\{保存,ほぞん\}\{ ,\}ゆっくりと\{解凍,かいとう\}\{ ,\}\{思う存分,おもうぞんぶん\}ご\{賞味,しょうみ\}あれ\{ ,\}その\{味覚,みかく\}が\{試さ,ためさ\}れます\{老舗,しにせ\}の\{一発,いっぱつ\}\{屋,や\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '(営業)スタートの合図それすらなしじゃもともこもない勘弁してずっと横ばい増やしてこうぜ音の友達をHey世界最高級DR.Kのビートを大量入荷一発屋入り口はあるくぐり抜けてく切り口はシャープ',
  ruby: 'えいぎょうすたーとのあいずそれすらなしじゃもともこもないかんべんしてずっとよこばいふやしてこうぜおとのともだちをへいせかいさいこうきゅうどくたーけーのびーとをたいりょうにゅうかいっぱつやいりぐちはあるくぐりぬけてくきりくちはしゃーぷ',
  lyric_with_ruby: '\{(,\}\{営業,えいぎょう\}\{),\}\{スタート,すたーと\}の\{合図,あいず\}\{ ,\}それすらなしじゃもともこもない\{ ,\}\{勘弁,かんべん\}して\{ ,\}ずっと\{横ばい,よこばい\}\{ ,\}\{増やし,ふやし\}てこうぜ\{音,おと\}の\{友達,ともだち\}を\{ ,\}\{Hey,へい\}\{ ,\}\{世界,せかい\}\{最,さい\}\{高級,こうきゅう\}\{ ,\}\{DR,どくたー\}\{.,\}\{K,けー\}の\{ビート,びーと\}を\{大量,たいりょう\}\{入荷,にゅうか\}\{ ,\}\{一発,いっぱつ\}\{屋,や\}\{ ,\}\{入り口,いりぐち\}はある\{ ,\}\{くぐり抜け,くぐりぬけ\}てく\{ ,\}\{切り口,きりくち\}は\{シャープ,しゃーぷ\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'CUEZERO')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'はい、こちら一発屋主な商品このヒップホップサウンド奥さん今回76特産裏方さん達毎度ごくろうさん俺らレペゼンちょっとだけマニアック!でもいい?まず一発屋になりたくて当店まだまだ悪あがきまたツレヅレなるままに',
  ruby: 'はいこちらいっぱつやおもなしょうひんこのひっぷほっぷさうんどおくさんこんかいななろくとくさんうらかたさんたちまいどごくろうさんおれられぺぜんちょっとだけまにあっくでもいいまずいっぱつやになりたくてとうてんまだまだわるあがきまたつれづれなるままに',
  lyric_with_ruby: 'はい\{、,\}こちら\{一発,いっぱつ\}\{屋,や\}\{ ,\}\{主,おも\}な\{商品,しょうひん\}この\{ヒップホップサウンド,ひっぷほっぷさうんど\}\{ ,\}\{奥さん,おくさん\}\{今回,こんかい\}\{76,ななろく\}\{特産,とくさん\}\{ ,\}\{裏方,うらかた\}さん\{達,たち\}\{毎度,まいど\}ごくろうさん\{ ,\}\{俺,おれ\}ら\{レペゼン,れぺぜん\}\{ ,\}ちょっとだけ\{マニアック,まにあっく\}\{!,\}でもいい\{?,\}\{ ,\}まず\{一発,いっぱつ\}\{屋,や\}になりたくて\{ ,\}\{当店,とうてん\}まだまだ\{悪あがき,わるあがき\}\{ ,\}また\{ツレヅレ,つれづれ\}なるままに\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'BRIDGE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'ねもっともっともっとしゃべらせてもっともっともっとしゃべらせて',
  ruby: 'ねもっともっともっとしゃべらせてもっともっともっとしゃべらせて',
  lyric_with_ruby: 'ね\{ ,\}もっともっともっとしゃべらせて\{ ,\}もっともっともっとしゃべらせて\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 5,
  lyric: '一度バイタライズしたがリバイタライズあれからどんだけ磨いたライム磨いたビーツ磨いたスニーカー磨いたダイヤ足りないみたいだWOW出し惜しみなし標的は行列の君達いらっしゃいませ違い味わってしまったらもう他じゃ無理無理無理無理',
  ruby: 'いちどばいたらいずしたがりばいたらいずあれからどんだけみがいたらいむみがいたびーつみがいたすにーかーみがいただいやたりないみたいだうぉうだしおしみなしひょうてきはぎょうれつのきみたちいらっしゃいませちがいあじわってしまったらもうほかじゃむりむりむりむり',
  lyric_with_ruby: '\{一度,いちど\}\{バイタライズ,ばいたらいず\}したが\{リバイタライズ,りばいたらいず\}\{ ,\}あれからどんだけ\{磨い,みがい\}た\{ライム,らいむ\}\{ ,\}\{磨い,みがい\}た\{ビーツ,びーつ\}\{ ,\}\{磨い,みがい\}た\{スニーカー,すにーかー\}\{ ,\}\{磨い,みがい\}た\{ダイヤ,だいや\}\{ ,\}\{足り,たり\}ないみたいだ\{ ,\}\{WOW,うぉう\}\{ ,\}\{出し,だし\}\{惜しみ,おしみ\}なし\{ ,\}\{標的,ひょうてき\}は\{行列,ぎょうれつ\}の\{君達,きみたち\}\{ ,\}いらっしゃいませ\{ ,\}\{違い,ちがい\}\{味わっ,あじわっ\}てしまったら\{ ,\}もう\{他,ほか\}じゃ\{無理,むり\}\{無理,むり\}\{無理,むり\}\{無理,むり\}\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '一発屋(BYPHARTHEDOPEST)当店当然すご腕他と違う感覚に気付いてついつい手が出る2発3発一発屋(BYPHARTHEDOPEST)カジュアルもフォーマルもOK!',
  ruby: 'いっぱつやばいふぁーざどーぺすととうてんとうぜんすごうでほかとちがうかんかくにきづいてついついてがでるにはつさんぱついっぱつやばいふぁーざどーぺすとかじゅあるもふぉーまるもおーけー',
  lyric_with_ruby: '\{一発,いっぱつ\}\{屋,や\}\{ ,\}\{(,\}\{BY,ばい\}\{ ,\}\{PHAR,ふぁー\}\{ ,\}\{THE,ざ\}\{ ,\}\{DOPEST,どーぺすと\}\{),\}\{ ,\}\{当店,とうてん\}\{ ,\}\{当然,とうぜん\}\{すご腕,すごうで\}\{ ,\}\{他,ほか\}と\{違う,ちがう\}\{感覚,かんかく\}に\{気付い,きづい\}て\{ ,\}ついつい\{手,て\}が\{出る,でる\}\{2,に\}\{発,はつ\}\{3,さん\}\{発,ぱつ\}\{ ,\}\{一発,いっぱつ\}\{屋,や\}\{ ,\}\{(,\}\{BY,ばい\}\{ ,\}\{PHAR,ふぁー\}\{ ,\}\{THE,ざ\}\{ ,\}\{DOPEST,どーぺすと\}\{),\}\{ ,\}\{カジュアル,かじゅある\}も\{フォーマル,ふぉーまる\}も\{OK,おーけー\}\{!,\}\{ ,\}',
  lyric_order: 8,
)

