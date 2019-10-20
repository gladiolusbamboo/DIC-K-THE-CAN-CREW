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
  lyric: 'That\'sme!Heyロマンスの海神ジャッジメントを君へ渡す日この思いはいつの間につのる消えないはずさIt\'ssnow,マリンスノー愛してるなんて言葉は照れくさいからまずはこの場はこの音に乗せてこの夏をいつもいつもいつまでも歌うにょ',
  ruby: 'ざっつみーへいろまんすのわたつみじゃっじめんとをきみへわたすひこのおもいはいつのまにつのるきえないはずさいっつすのーまりんすのーあいしてるなんてことばはてれくさいからまずはこのばはこのおとにのせてこのなつをいつもいつもいつまでもうたうにょ',
  lyric_with_ruby: '\{That\'s,ざっつ\}\{ ,\}\{me,みー\}\{!,\}\{ ,\}\{Hey,へい\}\{ ,\}\{ロマンス,ろまんす\}の\{海神,わたつみ\}\{ ,\}\{ジャッジメント,じゃっじめんと\}を\{君,きみ\}へ\{渡す,わたす\}\{日,ひ\}\{ ,\}この\{思い,おもい\}は\{いつの間に,いつのまに\}つのる\{ ,\}\{消え,きえ\}ないはずさ\{ ,\}\{It\'s,いっつ\}\{ ,\}\{snow,すのー\}\{,,\}\{ ,\}\{マリンスノー,まりんすのー\}\{ ,\}\{愛し,あいし\}てるなんて\{言葉,ことば\}は\{ ,\}\{照れくさい,てれくさい\}からまずはこの\{場,ば\}は\{ ,\}この\{音,おと\}に\{乗せ,のせ\}てこの\{夏,なつ\}を\{ ,\}いつもいつもいつまでも\{歌う,うたう\}にょ\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'あっつう間過ごした時間互いのウィィ時も嫌な時も含めて一つ一つ積み重ねて来たんだ二人だけのかけがえのない日々覚悟決める今日こそ半端な気持ちじゃないんだ病む時も健やかなる時もずっと君の隣に居ると誓うにょ',
  ruby: 'あっつうますごしたじかんたがいのうぃぃときもいやなときもふくめてひとつひとつつみかさねてきたんだふたりだけのかけがえのないひびかくごきめるきょうこそはんぱなきもちじゃないんだやむときもすこやかなるときもずっときみのとなりにいるとちかうにょ',
  lyric_with_ruby: 'あっつう\{間,ま\}\{過ごし,すごし\}た\{時間,じかん\}\{ ,\}\{互い,たがい\}の\{ウィィ,うぃぃ\}\{時,とき\}も\{嫌,いや\}な\{時,とき\}も\{含め,ふくめ\}て\{ ,\}\{一つ,ひとつ\}\{一つ,ひとつ\}\{積み重ね,つみかさね\}て\{来,き\}たんだ\{ ,\}\{二人,ふたり\}だけのかけがえのない\{日々,ひび\}\{ ,\}\{覚悟,かくご\}\{決める,きめる\}\{今日,きょう\}こそ\{ ,\}\{半端,はんぱ\}な\{気持ち,きもち\}じゃないんだ\{ ,\}\{病む,やむ\}\{時,とき\}も\{健やか,すこやか\}なる\{時,とき\}も\{ ,\}ずっと\{君,きみ\}の\{隣,となり\}に\{居る,いる\}と\{誓う,ちかう\}にょ\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'ホントにこんな俺で良いの?勝手気まま風見鶏のウィィのね?本当ウィィのね?なら今すぐ俺に嫁ぎーニョ',
  ruby: 'ほんとにこんなおれでいいのかってきままかざみどりのうぃぃのねほんとううぃぃのねならいますぐおれにとつぎーにょ',
  lyric_with_ruby: '\{ホント,ほんと\}にこんな\{俺,おれ\}で\{良い,いい\}の\{?,\}\{ ,\}\{勝手,かって\}\{気まま,きまま\}\{風見鶏,かざみどり\}の\{ ,\}\{ウィィ,うぃぃ\}のね\{?,\}\{ ,\}\{本当,ほんとう\}\{ウィィ,うぃぃ\}のね\{?,\}\{ ,\}なら\{今,いま\}すぐ\{俺,おれ\}に\{嫁ぎ,とつぎ\}\{ーニョ,ーにょ\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '潮風にょ渚にはマーメイド君と暮らせるならいつまでも愛のうた歌うよ幸せにするよ嫁ぎーニョ',
  ruby: 'しおかぜにょなぎさにはまーめいどきみとくらせるならいつまでもあいのうたうたうよしあわせにするよとつぎーにょ',
  lyric_with_ruby: '\{潮風,しおかぜ\}にょ\{ ,\}\{渚,なぎさ\}には\{マーメイド,まーめいど\}\{ ,\}\{君,きみ\}と\{暮らせる,くらせる\}なら\{ ,\}いつまでも\{ ,\}\{愛,あい\}のうた\{歌う,うたう\}よ\{ ,\}\{幸せ,しあわせ\}にするよ\{ ,\}\{嫁ぎ,とつぎ\}\{ーニョ,ーにょ\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'この水平線の向こうに続いてる永遠のストーリーシェイビングクリームみたいな雲にヒゲのカモメカモン嫁ライスシャワーフラワーシャワー僕らいつまでも手を繋がなきゃbrotherloverそんな夫婦心配事は粉にしてFu',
  ruby: 'このすいへいせんのむこうにつづいてるえいえんのすとーりーしぇいびんぐくりーむみたいなくもにひげのかもめかもんよめらいすしゃわーふらわーしゃわーぼくらいつまでもてをつながなきゃぶらざーらばーそんなふうふしんぱいごとはこなにして',
  lyric_with_ruby: 'この\{水平,すいへい\}\{線,せん\}の\{向こう,むこう\}に\{ ,\}\{続い,つづい\}てる\{永遠,えいえん\}の\{ストーリー,すとーりー\}\{ ,\}\{シェイビングクリーム,しぇいびんぐくりーむ\}みたいな\{雲,くも\}に\{ ,\}\{ヒゲ,ひげ\}の\{カモメ,かもめ\}\{ ,\}\{カモン,かもん\}\{嫁,よめ\}\{ ,\}\{ライス,らいす\}\{シャワー,しゃわー\}\{ ,\}\{フラワー,ふらわー\}\{シャワー,しゃわー\}\{ ,\}\{僕ら,ぼくら\}いつまでも\{手,て\}を\{繋が,つなが\}なきゃ\{ ,\}\{brotherlover,ぶらざーらばー\}\{ ,\}そんな\{夫婦,ふうふ\}\{ ,\}\{心配,しんぱい\}\{事,ごと\}は\{粉,こな\}にして\{ ,\}\{Fu,\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 5,
  lyric: 'パッと目があったちょっと笑顔になれた初めて二人で星の海へ(KissingToMe)3年が過ぎお互い年を取りいつかなる一人その日まで幸せにさせて',
  ruby: 'ぱっとめがあったちょっとえがおになれたはじめてふたりでほしのうみへきっしんぐとぅーみーさんねんがすぎおたがいとしをとりいつかなるひとりそのひまでしあわせにさせて',
  lyric_with_ruby: '\{パッ,ぱっ\}と\{目,め\}があった\{ ,\}ちょっと\{笑顔,えがお\}になれた\{ ,\}\{初めて,はじめて\}\{二人,ふたり\}で\{星,ほし\}の\{海,うみ\}へ\{ ,\}\{(,\}\{Kissing,きっしんぐ\}\{ ,\}\{To,とぅー\}\{ ,\}\{Me,みー\}\{),\}\{ ,\}\{3,さん\}\{年,ねん\}が\{過ぎ,すぎ\}\{ ,\}\{お互い,おたがい\}\{年,とし\}を\{取り,とり\}\{ ,\}いつかなる\{一人,ひとり\}\{ ,\}その\{日,ひ\}まで\{幸せ,しあわせ\}にさせて\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 6,
  lyric: 'やっぱりそんな君がいいのお節介アンド早とちりーのウィィのね?本当ウィィのね?なら今すぐ俺に嫁ぎーニョ',
  ruby: 'やっぱりそんなきみがいいのおせっかいあんどはやとちりーのうぃぃのねほんとううぃぃのねならいますぐおれにとつぎーにょ',
  lyric_with_ruby: 'やっぱりそんな\{君,きみ\}がいいの\{ ,\}\{お節介,おせっかい\}\{アンド,あんど\}\{早とちり,はやとちり\}ーの\{ ,\}\{ウィィ,うぃぃ\}のね\{?,\}\{ ,\}\{本当,ほんとう\}\{ウィィ,うぃぃ\}のね\{?,\}\{ ,\}なら\{今,いま\}すぐ\{俺,おれ\}に\{嫁ぎ,とつぎ\}\{ーニョ,ーにょ\}\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '潮風にょ渚にはマーメイド君と暮らせるならいつまでも愛のうた歌うよ幸せにするよ嫁ぎーニョ',
  ruby: 'しおかぜにょなぎさにはまーめいどきみとくらせるならいつまでもあいのうたうたうよしあわせにするよとつぎーにょ',
  lyric_with_ruby: '\{潮風,しおかぜ\}にょ\{ ,\}\{渚,なぎさ\}には\{マーメイド,まーめいど\}\{ ,\}\{君,きみ\}と\{暮らせる,くらせる\}なら\{ ,\}いつまでも\{ ,\}\{愛,あい\}のうた\{歌う,うたう\}よ\{ ,\}\{幸せ,しあわせ\}にするよ\{ ,\}\{嫁ぎ,とつぎ\}\{ーニョ,ーにょ\}\{ ,\}',
  lyric_order: 8,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '潮風にょ渚にはマーメイド君と暮らせるならいつまでも愛のうた歌うよ幸せにするよ嫁ぎーニョ',
  ruby: 'しおかぜにょなぎさにはまーめいどきみとくらせるならいつまでもあいのうたうたうよしあわせにするよとつぎーにょ',
  lyric_with_ruby: '\{潮風,しおかぜ\}にょ\{ ,\}\{渚,なぎさ\}には\{マーメイド,まーめいど\}\{ ,\}\{君,きみ\}と\{暮らせる,くらせる\}なら\{ ,\}いつまでも\{ ,\}\{愛,あい\}のうた\{歌う,うたう\}よ\{ ,\}\{幸せ,しあわせ\}にするよ\{ ,\}\{嫁ぎ,とつぎ\}\{ーニョ,ーにょ\}\{ ,\}',
  lyric_order: 9,
)

