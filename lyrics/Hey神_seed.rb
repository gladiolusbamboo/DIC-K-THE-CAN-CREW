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
lyrict_type = LyricType.find_by(name: 'BRIDGE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'HEY!神cametorockinthisplace',
  ruby: 'へいしんけいむとぅーろっくいんでぃすぷれーす',
  lyric_with_ruby: '\{HEY,へい\}\{!,\}\{ ,\}\{神,しん\}\{ ,\}\{came,けいむ\}\{ ,\}\{to,とぅー\}\{ ,\}\{rock,ろっく\}\{ ,\}\{in,いん\}\{ ,\}\{this,でぃす\}\{ ,\}\{place,ぷれーす\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'もう大丈夫っしょ盛り上がるっしょ今日もヤバいっしょHe\'scametorockinthisplaceもう大丈夫っしょ今日も来てるっしょ呼んでないのにいつもいる',
  ruby: 'もうだいじょうぶっしょもりあがるっしょきょうもやばいっしょひーずけいむとぅーろっくいんでぃすぷれーすもうだいじょうぶっしょきょうもきてるっしょよんでないのにいつもいる',
  lyric_with_ruby: 'もう\{大丈夫,だいじょうぶ\}っしょ\{ ,\}\{盛り上がる,もりあがる\}っしょ\{ ,\}\{今日,きょう\}も\{ヤバ,やば\}いっしょ\{ ,\}\{He\'s,ひーず\}\{ ,\}\{came,けいむ\}\{ ,\}\{to,とぅー\}\{ ,\}\{rock,ろっく\}\{ ,\}\{in,いん\}\{ ,\}\{this,でぃす\}\{ ,\}\{place,ぷれーす\}\{ ,\}もう\{大丈夫,だいじょうぶ\}っしょ\{ ,\}\{今日,きょう\}も\{来,き\}てるっしょ\{ ,\}\{呼ん,よん\}でないのにいつもいる\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'ヤツは何処に居る?ココに居る問いかけてみるワツダディール?かすかな気配をフィールすでに君の隣でchillマスアピール',
  ruby: 'やつはどこにいるここにいるといかけてみるわつだでぃーるかすかなけはいをふぃーるすでにきみのとなりでちるますあぴーる',
  lyric_with_ruby: '\{ヤツ,やつ\}は\{何処,どこ\}に\{居る,いる\}\{?,\}\{ ,\}\{ココ,ここ\}に\{居る,いる\}\{ ,\}\{問いかけ,といかけ\}てみる\{ ,\}\{ワツダディール,わつだでぃーる\}\{?,\}\{ ,\}かすかな\{気配,けはい\}を\{フィール,ふぃーる\}\{ ,\}すでに\{君,きみ\}の\{隣,となり\}で\{ ,\}\{chill,ちる\}\{ ,\}\{マス,ます\}\{アピール,あぴーる\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'HEYダンスフロア不毛時代無法地帯に降臨いつの間に憑依ヒカンザローズ時間ですよオッサン神々の遊びポージング',
  ruby: 'へいだんすふろあふもうじだいむほうちたいにこうりんいつのまにひょういひかんざろーずじかんですよおっさんかみがみのあそびぽーじんぐ',
  lyric_with_ruby: '\{HEY,へい\}\{ ,\}\{ダンス,だんす\}\{フロア,ふろあ\}\{ ,\}\{不毛,ふもう\}\{時代,じだい\}\{ ,\}\{無法,むほう\}\{地帯,ちたい\}に\{降臨,こうりん\}\{ ,\}\{いつの間に,いつのまに\}\{憑依,ひょうい\}\{ ,\}\{ヒカンザローズ,ひかんざろーず\}\{ ,\}\{時間,じかん\}ですよ\{オッサン,おっさん\}\{ ,\}\{神々,かみがみ\}の\{遊び,あそび\}\{ポージング,ぽーじんぐ\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'ローリンローリンロールユーロールミーギュっとキツくholdonmeもういいもういい拝み倒し抱きたくねぇし抱かれたくねぇワユヲナゴエドゥダアッアッアッHEY神HEY神まさかの迷信何て言わしゃしないぜだって今正に此処に居る!',
  ruby: 'ろーりんろーりんろーるゆーろーるみーぎゅっときつくほーるどおんみーもういいもういいおがみたおしだきたくねぇしだかれたくねぇわゆをなごえどぅだあっあっあっへいしんへいしんまさかのめいしんなんていわしゃしないぜだっていままさにここにいる',
  lyric_with_ruby: '\{ローリン,ろーりん\}\{ ,\}\{ローリン,ろーりん\}\{ ,\}\{ロールユー,ろーるゆー\}\{ ,\}\{ロールミー,ろーるみー\}\{ ,\}\{ギュ,ぎゅ\}っと\{キツ,きつ\}く\{ ,\}\{hold,ほーるど\}\{ ,\}\{on,おん\}\{ ,\}\{me,みー\}\{ ,\}もういい\{ ,\}もういい\{ ,\}\{拝み倒し,おがみたおし\}\{ ,\}\{抱き,だき\}たくねぇし\{ ,\}\{抱か,だか\}れたくねぇ\{ ,\}\{ワユヲナゴエドゥダ,わゆをなごえどぅだ\}\{ ,\}\{アッ,あっ\}\{ ,\}\{アッ,あっ\}\{ ,\}\{アッ,あっ\}\{ ,\}\{HEY,へい\}\{ ,\}\{神,しん\}\{ ,\}\{HEY,へい\}\{ ,\}\{神,しん\}\{ ,\}まさかの\{迷信,めいしん\}\{ ,\}\{何,なん\}て\{言わしゃ,いわしゃ\}しないぜ\{ ,\}だって\{今,いま\}\{正に,まさに\}\{此処,ここ\}に\{居る,いる\}\{!,\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'BRIDGE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'HEY!神cametorockinthisplace',
  ruby: 'へいしんけいむとぅーろっくいんでぃすぷれーす',
  lyric_with_ruby: '\{HEY,へい\}\{!,\}\{ ,\}\{神,しん\}\{ ,\}\{came,けいむ\}\{ ,\}\{to,とぅー\}\{ ,\}\{rock,ろっく\}\{ ,\}\{in,いん\}\{ ,\}\{this,でぃす\}\{ ,\}\{place,ぷれーす\}\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'もう大丈夫っしょ盛り上がるっしょ今日もヤバいっしょHe\'scametorockinthisplaceもう大丈夫っしょ今日も来てるっしょ呼んでないのにいつもいる',
  ruby: 'もうだいじょうぶっしょもりあがるっしょきょうもやばいっしょひーずけいむとぅーろっくいんでぃすぷれーすもうだいじょうぶっしょきょうもきてるっしょよんでないのにいつもいる',
  lyric_with_ruby: 'もう\{大丈夫,だいじょうぶ\}っしょ\{ ,\}\{盛り上がる,もりあがる\}っしょ\{ ,\}\{今日,きょう\}も\{ヤバ,やば\}いっしょ\{ ,\}\{He\'s,ひーず\}\{ ,\}\{came,けいむ\}\{ ,\}\{to,とぅー\}\{ ,\}\{rock,ろっく\}\{ ,\}\{in,いん\}\{ ,\}\{this,でぃす\}\{ ,\}\{place,ぷれーす\}\{ ,\}もう\{大丈夫,だいじょうぶ\}っしょ\{ ,\}\{今日,きょう\}も\{来,き\}てるっしょ\{ ,\}\{呼ん,よん\}でないのにいつもいる\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'BRIDGE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '来る～きっと来る～来る?やつが来る～居る～いつも居る～誰も呼んでないでもいつもいる',
  ruby: 'くるーきっとくるーくるやつがくるーいるーいつもいるーだれもよんでないでもいつもいる',
  lyric_with_ruby: '\{来る,くる\}\{～,ー\}\{ ,\}きっと\{来る,くる\}\{～,ー\}\{ ,\}\{来る,くる\}\{?,\}\{ ,\}やつが\{来る,くる\}\{～,ー\}\{ ,\}\{居る,いる\}\{～,ー\}\{ ,\}いつも\{居る,いる\}\{～,ー\}\{ ,\}\{誰,だれ\}も\{呼ん,よん\}でない\{ ,\}でもいつもいる\{ ,\}',
  lyric_order: 8,
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'ときにはワッサ!ときにはヤーマンみたいにヘイシ神の言霊街の噂飛び交い山越え海を越えてパーティーマザファカ',
  ruby: 'ときにはわっさときにはやーまんみたいにへいしかみのことだままちのうわさとびかいやまこえうみをこえてぱーてぃーまざふぁか',
  lyric_with_ruby: 'ときには\{ワッサ,わっさ\}\{!,\}ときには\{ヤーマン,やーまん\}\{ ,\}みたいに\{ヘイシ,へいし\}\{ ,\}\{神,かみ\}の\{言霊,ことだま\}\{ ,\}\{街,まち\}の\{噂,うわさ\}\{飛び交い,とびかい\}\{ ,\}\{山越え,やまこえ\}\{ ,\}\{海,うみ\}を\{越え,こえ\}て\{パーティーマザファカ,ぱーてぃーまざふぁか\}\{ ,\}',
  lyric_order: 9,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 5,
  lyric: 'HEY座敷童的わっぱ小童困ったのばっか集まるweekendシーケンスするparty誠心誠意HEY神ついてるあんたよかった',
  ruby: 'へいざしきわらしてきわっぱこわっぱこまったのばっかあつまるうぃーくえんどしーけんすするぱーてぃーせいしんせいいへいしんついてるあんたよかった',
  lyric_with_ruby: '\{HEY,へい\}\{ ,\}\{座敷,ざしき\}\{童,わらし\}\{的,てき\}わっぱ\{小童,こわっぱ\}\{ ,\}\{困っ,こまっ\}たのばっか\{集まる,あつまる\}\{ ,\}\{weekend,うぃーくえんど\}\{ ,\}\{シーケンス,しーけんす\}する\{ ,\}\{party,ぱーてぃー\}\{ ,\}\{誠心,せいしん\}\{誠意,せいい\}\{ ,\}\{HEY,へい\}\{ ,\}\{神,しん\}ついてるあんたよかった\{ ,\}',
  lyric_order: 10,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 6,
  lyric: '捨てきれん捨てきれへんwhat\'sthename?仲間じゃないのに何か変志村も三村もみんなの木村が居るから今日も安心なんだー',
  ruby: 'すてきれんすてきれへんわっつざねーむなかまじゃないのになんかへんしむらもみむらもみんなのきむらがいるからきょうもあんしんなんだー',
  lyric_with_ruby: '\{捨て,すて\}きれん\{捨て,すて\}きれへん\{ ,\}\{what\'s,わっつ\}\{ ,\}\{the,ざ\}\{ ,\}\{name,ねーむ\}\{?,\}\{ ,\}\{仲間,なかま\}じゃないのに\{何,なん\}か\{変,へん\}\{ ,\}\{志村,しむら\}も\{三村,みむら\}もみんなの\{木村,きむら\}が\{居る,いる\}から\{今日,きょう\}も\{安心,あんしん\}なんだー\{ ,\}',
  lyric_order: 11,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 7,
  lyric: 'ミスターHEY!神三宿WebからBacktothebasic乗っかるブレイクビーツSomanyladies&ladies捕まえたスイートスイートベイビーズ大丈夫っしょまじ大丈夫っしょ盛り上げるのがマイジョブっしょS.O.SN.O.NNONNONNONレッツゴーHey!神',
  ruby: 'みすたーへいしんみしゅくうぇぶからばっくとぅーざべーしっくのっかるぶれいくびーつそーめにーれでぃーすあんどれでぃーすつかまえたすいーとすいーとべいびーずだいじょうぶっしょまじだいじょうぶっしょもりあげるのがまいじょぶっしょえすおーえすえぬおーえぬのんのんのんれっつごーへいしん',
  lyric_with_ruby: '\{ミスター,みすたー\}\{ ,\}\{HEY,へい\}\{!,\}\{神,しん\}\{ ,\}\{三宿,みしゅく\}\{ ,\}\{Web,うぇぶ\}\{ ,\}から\{ ,\}\{Back,ばっく\}\{ ,\}\{to,とぅー\}\{ ,\}\{the,ざ\}\{ ,\}\{basic,べーしっく\}\{ ,\}\{乗っかる,のっかる\}\{ブレイクビーツ,ぶれいくびーつ\}\{ ,\}\{So,そー\}\{ ,\}\{many,めにー\}\{ ,\}\{ladies,れでぃーす\}\{ ,\}\{&,あんど\}\{ ,\}\{ladies,れでぃーす\}\{ ,\}\{捕まえ,つかまえ\}た\{スイートスイートベイビーズ,すいーとすいーとべいびーず\}\{ ,\}\{大丈夫,だいじょうぶ\}っしょ\{ ,\}まじ\{大丈夫,だいじょうぶ\}っしょ\{ ,\}\{盛り上げる,もりあげる\}のが\{マイジョブ,まいじょぶ\}っしょ\{ ,\}\{S,えす\}\{.,\}\{O,おー\}\{.,\}\{S,えす\}\{ ,\}\{N,えぬ\}\{.,\}\{O,おー\}\{.,\}\{N,えぬ\}\{ ,\}\{NON,のん\}\{ ,\}\{NON,のん\}\{ ,\}\{NON,のん\}\{ ,\}\{レッツゴー,れっつごー\}\{ ,\}\{Hey,へい\}\{!,\}\{ ,\}\{神,しん\}\{ ,\}',
  lyric_order: 12,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'もう大丈夫っしょ盛り上がるっしょ今日もヤバいっしょHe\'scametorockinthisplaceもう大丈夫っしょ今日も来てるっしょ呼んでないのにいつもいる',
  ruby: 'もうだいじょうぶっしょもりあがるっしょきょうもやばいっしょひーずけいむとぅーろっくいんでぃすぷれーすもうだいじょうぶっしょきょうもきてるっしょよんでないのにいつもいる',
  lyric_with_ruby: 'もう\{大丈夫,だいじょうぶ\}っしょ\{ ,\}\{盛り上がる,もりあがる\}っしょ\{ ,\}\{今日,きょう\}も\{ヤバ,やば\}いっしょ\{ ,\}\{He\'s,ひーず\}\{ ,\}\{came,けいむ\}\{ ,\}\{to,とぅー\}\{ ,\}\{rock,ろっく\}\{ ,\}\{in,いん\}\{ ,\}\{this,でぃす\}\{ ,\}\{place,ぷれーす\}\{ ,\}もう\{大丈夫,だいじょうぶ\}っしょ\{ ,\}\{今日,きょう\}も\{来,き\}てるっしょ\{ ,\}\{呼ん,よん\}でないのにいつもいる\{ ,\}',
  lyric_order: 13,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'もう大丈夫っしょ盛り上がるっしょ今日もヤバいっしょHe\'scametorockinthisplaceもう大丈夫っしょ今日も来てるっしょ呼んでないのにいつもいる',
  ruby: 'もうだいじょうぶっしょもりあがるっしょきょうもやばいっしょひーずけいむとぅーろっくいんでぃすぷれーすもうだいじょうぶっしょきょうもきてるっしょよんでないのにいつもいる',
  lyric_with_ruby: 'もう\{大丈夫,だいじょうぶ\}っしょ\{ ,\}\{盛り上がる,もりあがる\}っしょ\{ ,\}\{今日,きょう\}も\{ヤバ,やば\}いっしょ\{ ,\}\{He\'s,ひーず\}\{ ,\}\{came,けいむ\}\{ ,\}\{to,とぅー\}\{ ,\}\{rock,ろっく\}\{ ,\}\{in,いん\}\{ ,\}\{this,でぃす\}\{ ,\}\{place,ぷれーす\}\{ ,\}もう\{大丈夫,だいじょうぶ\}っしょ\{ ,\}\{今日,きょう\}も\{来,き\}てるっしょ\{ ,\}\{呼ん,よん\}でないのにいつもいる\{ ,\}',
  lyric_order: 14,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'HEY!神cametorockinthisplace誰も呼んでないでもいつもいる',
  ruby: 'へいしんけいむとぅーろっくいんでぃすぷれーすだれもよんでないでもいつもいる',
  lyric_with_ruby: '\{HEY,へい\}\{!,\}\{ ,\}\{神,しん\}\{ ,\}\{came,けいむ\}\{ ,\}\{to,とぅー\}\{ ,\}\{rock,ろっく\}\{ ,\}\{in,いん\}\{ ,\}\{this,でぃす\}\{ ,\}\{place,ぷれーす\}\{ ,\}\{誰,だれ\}も\{呼ん,よん\}でない\{ ,\}でもいつもいる\{ ,\}',
  lyric_order: 15,
)

