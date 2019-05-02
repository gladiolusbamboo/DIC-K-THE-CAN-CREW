artist_name =    ''
lyricUrl_url =   ''
cd_name =        ''
cd_released_at = ''
song_name =      ''
song_lyricist =  ''
song_composer =  ''
song_arranger =  ''
cds_name = []
note          = ''

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
  lyric: 'また増えるたばこの煙りとまた浅い浅い眠りのある意味規則的な生活の中贅沢に思いにふける',
  ruby: 'またふえるたばこのけむりとまたあさいあさいねむりのあるいみきそくてきなせいかつのなかぜいたくにおもいにふける',
  lyric_with_ruby: 'また\{増える,ふえる\}たばこの\{煙り,けむり\}と\{ ,\}また\{浅い,あさい\}\{浅い,あさい\}\{眠り,ねむり\}の\{ ,\}ある\{意味,いみ\}\{規則,きそく\}\{的,てき\}な\{生活,せいかつ\}の\{中,なか\}\{ ,\}\{贅沢,ぜいたく\}に\{思い,おもい\}にふける\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'また増えるたばこの煙りとまた浅い浅い眠りのある意味規則的な生活の中贅沢に思いにふける',
  ruby: 'またふえるたばこのけむりとまたあさいあさいねむりのあるいみきそくてきなせいかつのなかぜいたくにおもいにふける',
  lyric_with_ruby: 'また\{増える,ふえる\}たばこの\{煙り,けむり\}と\{ ,\}また\{浅い,あさい\}\{浅い,あさい\}\{眠り,ねむり\}の\{ ,\}ある\{意味,いみ\}\{規則,きそく\}\{的,てき\}な\{生活,せいかつ\}の\{中,なか\}\{ ,\}\{贅沢,ぜいたく\}に\{思い,おもい\}にふける\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'アイツが9階オレが7階だった一分あったら間に合った遊び場山の公園だったすること何もかも冒険だったその近くに駄菓子屋があった万引きした時かなりヤバかったよく食ったアンコ玉ばっか陽の落ちる時間も早かったゲームするよりサッカーだった一回大会で戦ったデブなあいつをよくからかった仲良くなるのはなぜか早かったまだまだ遊び足りなかった帰り道青い橋があった自転車で一気に駆けおりる夕陽写す影家まで伸びる',
  ruby: 'あいつがきゅうかいおれがななかいだったいっぷんあったらまにあったあそびばやまのこうえんだったすることなにもかもぼうけんだったそのちかくにだがしやがあったまんびきしたときかなりやばかったよくくったあんこだまばっかひのおちるじかんもはやかったげーむするよりさっかーだったいっかいたいかいでたたかったでぶなあいつをよくからかったなかよくなるのはなぜかはやかったまだまだあそびたりなかったかえりみちあおいはしがあったじてんしゃでいっきにかけおりるゆうひうつすかげいえまでのびる',
  lyric_with_ruby: '\{アイツ,あいつ\}が\{9,きゅう\}\{階,かい\}\{ ,\}\{オレ,おれ\}が\{7,なな\}\{階,かい\}だった\{ ,\}\{一分,いっぷん\}あったら\{間に合っ,まにあっ\}た\{ ,\}\{遊び場,あそびば\}\{山,やま\}の\{公園,こうえん\}だった\{ ,\}すること\{何もかも,なにもかも\}\{冒険,ぼうけん\}だった\{ ,\}その\{近く,ちかく\}に\{駄菓子,だがし\}\{屋,や\}があった\{ ,\}\{万引き,まんびき\}した\{時,とき\}かなり\{ヤバ,やば\}かった\{ ,\}よく\{食っ,くっ\}た\{アンコ,あんこ\}\{玉,だま\}ばっか\{ ,\}\{陽,ひ\}の\{落ちる,おちる\}\{時間,じかん\}も\{早かっ,はやかっ\}た\{ ,\}\{ゲーム,げーむ\}するより\{サッカー,さっかー\}だった\{ ,\}\{一,いっ\}\{回,かい\}\{大会,たいかい\}で\{戦っ,たたかっ\}た\{ ,\}\{デブ,でぶ\}なあいつをよくからかった\{ ,\}\{仲良く,なかよく\}なるのはなぜか\{早かっ,はやかっ\}た\{ ,\}まだまだ\{遊び,あそび\}\{足り,たり\}なかった\{ ,\}\{帰り道,かえりみち\}\{ ,\}\{青い,あおい\}\{橋,はし\}があった\{ ,\}\{自転車,じてんしゃ\}で\{一気に,いっきに\}\{駆け,かけ\}おりる\{ ,\}\{夕陽,ゆうひ\}\{写す,うつす\}\{影,かげ\}\{ ,\}\{家,いえ\}まで\{伸びる,のびる\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'また増えるたばこの煙りとまた浅い浅い眠りのある意味規則的な生活の中贅沢に思いにふける',
  ruby: 'またふえるたばこのけむりとまたあさいあさいねむりのあるいみきそくてきなせいかつのなかぜいたくにおもいにふける',
  lyric_with_ruby: 'また\{増える,ふえる\}たばこの\{煙り,けむり\}と\{ ,\}また\{浅い,あさい\}\{浅い,あさい\}\{眠り,ねむり\}の\{ ,\}ある\{意味,いみ\}\{規則,きそく\}\{的,てき\}な\{生活,せいかつ\}の\{中,なか\}\{ ,\}\{贅沢,ぜいたく\}に\{思い,おもい\}にふける\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'また増えるたばこの煙りとまた浅い浅い眠りのある意味規則的な生活の中贅沢に思いにふける',
  ruby: 'またふえるたばこのけむりとまたあさいあさいねむりのあるいみきそくてきなせいかつのなかぜいたくにおもいにふける',
  lyric_with_ruby: 'また\{増える,ふえる\}たばこの\{煙り,けむり\}と\{ ,\}また\{浅い,あさい\}\{浅い,あさい\}\{眠り,ねむり\}の\{ ,\}ある\{意味,いみ\}\{規則,きそく\}\{的,てき\}な\{生活,せいかつ\}の\{中,なか\}\{ ,\}\{贅沢,ぜいたく\}に\{思い,おもい\}にふける\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'CUEZERO')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'ディディディダッタ意地になった日々にばっか道があった何も欲しくなかった「?達」を付けられたくはなかったただ本音を言えれば良かった転んでも死ねはしなかった一人で偉そうとのぼった声と白い目が僕を襲った沈んでく夕陽に似合った影が今生きてく勇気になった今に見てろと明日に誓った皆に聞けよと歌詞にうたったなにが大事なのか判ったそれは今愛した奴らだったもう認めよう意地になった日々それが俺の駆け抜けた十代',
  ruby: 'でぃでぃでぃだったいじになったひびにばっかみちがあったなにもほしくなかったたちをつけられたくはなかったただほんねをいえればよかったころんでもしねはしなかったひとりでえらそうとのぼったこえとしろいめがぼくをおそったしずんでくゆうひににあったかげがいまいきてくゆうきになったいまにみてろとあすにちかったみなにきけよとかしにうたったなにがだいじなのかわかったそれはいまあいしたやつらだったもうみとめよういじになったひびそれがおれのかけぬけたじゅうだい',
  lyric_with_ruby: '\{ディディディダッタ,でぃでぃでぃだった\}\{ ,\}\{意地,いじ\}になった\{ ,\}\{日々,ひび\}にばっか\{ ,\}\{道,みち\}があった\{ ,\}\{何,なに\}も\{欲しく,ほしく\}なかった\{ ,\}\{「,\}\{?,\}\{達,たち\}\{」,\}を\{付け,つけ\}られたくはなかった\{ ,\}ただ\{本音,ほんね\}を\{言えれ,いえれ\}ば\{良かっ,よかっ\}た\{ ,\}\{転ん,ころん\}でも\{死ね,しね\}はしなかった\{ ,\}\{一人,ひとり\}で\{偉,えら\}そうとのぼった\{ ,\}\{声,こえ\}と\{白い,しろい\}\{目,め\}が\{僕,ぼく\}を\{襲っ,おそっ\}た\{ ,\}\{沈ん,しずん\}でく\{夕陽,ゆうひ\}に\{似合っ,にあっ\}た\{影,かげ\}が\{ ,\}\{今,いま\}\{生き,いき\}てく\{勇気,ゆうき\}になった\{ ,\}\{今,いま\}に\{見,み\}てろと\{明日,あす\}に\{誓っ,ちかっ\}た\{ ,\}\{皆,みな\}に\{聞けよ,きけよ\}と\{歌詞,かし\}にうたった\{ ,\}なにが\{大事,だいじ\}なのか\{判っ,わかっ\}た\{ ,\}それは\{今,いま\}\{愛し,あいし\}た\{奴ら,やつら\}だった\{ ,\}もう\{認めよ,みとめよ\}う\{ ,\}\{意地,いじ\}になった\{日々,ひび\}\{ ,\}それが\{俺,おれ\}の\{駆け抜け,かけぬけ\}た\{十,じゅう\}\{代,だい\}\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 5,
  lyric: 'また増えるたばこの煙りとまた浅い浅い眠りのある意味規則的な生活の中贅沢に思いにふける',
  ruby: 'またふえるたばこのけむりとまたあさいあさいねむりのあるいみきそくてきなせいかつのなかぜいたくにおもいにふける',
  lyric_with_ruby: 'また\{増える,ふえる\}たばこの\{煙り,けむり\}と\{ ,\}また\{浅い,あさい\}\{浅い,あさい\}\{眠り,ねむり\}の\{ ,\}ある\{意味,いみ\}\{規則,きそく\}\{的,てき\}な\{生活,せいかつ\}の\{中,なか\}\{ ,\}\{贅沢,ぜいたく\}に\{思い,おもい\}にふける\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 6,
  lyric: 'また増えるたばこの煙りとまた浅い浅い眠りのある意味規則的な生活の中贅沢に思いにふける',
  ruby: 'またふえるたばこのけむりとまたあさいあさいねむりのあるいみきそくてきなせいかつのなかぜいたくにおもいにふける',
  lyric_with_ruby: 'また\{増える,ふえる\}たばこの\{煙り,けむり\}と\{ ,\}また\{浅い,あさい\}\{浅い,あさい\}\{眠り,ねむり\}の\{ ,\}ある\{意味,いみ\}\{規則,きそく\}\{的,てき\}な\{生活,せいかつ\}の\{中,なか\}\{ ,\}\{贅沢,ぜいたく\}に\{思い,おもい\}にふける\{ ,\}',
  lyric_order: 8,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '明日の事なんて気にしなかった笑い声だけ響き渡った一年がやけに長かったそういやあんまりカゼひかなかった今はただこう目をつぶって思い出すとそこにあることは時間もしがらみも無くあのころのまま同じ色のはず',
  ruby: 'あすのことなんてきにしなかったわらいごえだけひびきわたったいちねんがやけにながかったそういやあんまりかぜひかなかったいまはただこうめをつぶっておもいだすとそこにあることはじかんもしがらみもなくあのころのままおなじいろのはず',
  lyric_with_ruby: '\{明日,あす\}の\{事,こと\}なんて\{ ,\}\{気,き\}にしなかった\{ ,\}\{笑い声,わらいごえ\}だけ\{響き,ひびき\}\{渡っ,わたっ\}た\{ ,\}\{一,いち\}\{年,ねん\}がやけに\{長かっ,ながかっ\}た\{ ,\}そういやあんまり\{カゼ,かぜ\}ひかなかった\{ ,\}\{今,いま\}はただこう\{目,め\}をつぶって\{思い出す,おもいだす\}\{ ,\}とそこにあることは\{ ,\}\{時間,じかん\}もしがらみも\{無く,なく\}\{ ,\}あのころのまま\{同じ,おなじ\}\{色,いろ\}のはず\{ ,\}',
  lyric_order: 9,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 7,
  lyric: 'また増えるたばこの煙りとまた浅い浅い眠りのある意味規則的な生活の中贅沢に思いにふける',
  ruby: 'またふえるたばこのけむりとまたあさいあさいねむりのあるいみきそくてきなせいかつのなかぜいたくにおもいにふける',
  lyric_with_ruby: 'また\{増える,ふえる\}たばこの\{煙り,けむり\}と\{ ,\}また\{浅い,あさい\}\{浅い,あさい\}\{眠り,ねむり\}の\{ ,\}ある\{意味,いみ\}\{規則,きそく\}\{的,てき\}な\{生活,せいかつ\}の\{中,なか\}\{ ,\}\{贅沢,ぜいたく\}に\{思い,おもい\}にふける\{ ,\}',
  lyric_order: 10,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 8,
  lyric: 'また増えるたばこの煙りとまた浅い浅い眠りのある意味規則的な生活の中贅沢に思いにふける',
  ruby: 'またふえるたばこのけむりとまたあさいあさいねむりのあるいみきそくてきなせいかつのなかぜいたくにおもいにふける',
  lyric_with_ruby: 'また\{増える,ふえる\}たばこの\{煙り,けむり\}と\{ ,\}また\{浅い,あさい\}\{浅い,あさい\}\{眠り,ねむり\}の\{ ,\}ある\{意味,いみ\}\{規則,きそく\}\{的,てき\}な\{生活,せいかつ\}の\{中,なか\}\{ ,\}\{贅沢,ぜいたく\}に\{思い,おもい\}にふける\{ ,\}',
  lyric_order: 11,
)

