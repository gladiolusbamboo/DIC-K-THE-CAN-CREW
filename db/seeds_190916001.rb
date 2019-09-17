artist_name =    'アスタラビスタ'
lyricUrl_url =   nil
cd_name =        'ヤバスタ'
cd_released_at = '2014-03-26'
song_name =      'Shave of My Heart'
song_lyricist =  'アスタラビスタ'
song_composer =  'アスタラビスタ'
song_arranger =  'MASSATTACK'
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
  lyric: 'IStillLonelyIStillLonely君がFindMe本当の僕をIStillLonelyあの日のように戻れないからIWillShaveofMyHeart',
  ruby: 'あいすてぃるろんりーあいすてぃるろんりーきみがふぁいんどみーほんとうのぼくをあいすてぃるろんりーあのひのようにもどれないからあいうぃるしぇーぶおぶまいはーと',
  lyric_with_ruby: '\{I,あい\}\{ ,\}\{Still,すてぃる\}\{ ,\}\{Lonely,ろんりー\}\{ ,\}\{I,あい\}\{ ,\}\{Still,すてぃる\}\{ ,\}\{Lonely,ろんりー\}\{ ,\}\{君,きみ\}が\{ ,\}\{Find,ふぁいんど\}\{ ,\}\{Me,みー\}\{ ,\}\{本当,ほんとう\}の\{僕,ぼく\}を\{ ,\}\{I,あい\}\{ ,\}\{Still,すてぃる\}\{ ,\}\{Lonely,ろんりー\}\{ ,\}あの\{日,ひ\}のように\{ ,\}\{戻れ,もどれ\}ないから\{ ,\}\{I,あい\}\{ ,\}\{Will,うぃる\}\{ ,\}\{Shave,しぇーぶ\}\{ ,\}\{of,おぶ\}\{ ,\}\{My,まい\}\{ ,\}\{Heart,はーと\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'まぶしい陽が差し込んだグッドなモーニング別れの日でもいつもと変わらないそんなGoodなMorningバスルームの鏡に映り花咲くラストシーンがほらゆっくり重なる目を落とすとただ君の姿がまた水面に揺れる',
  ruby: 'まぶしいひがさしこんだぐっどなもーにんぐわかれのひでもいつもとかわらないそんなぐっどなもーにんぐばするーむのかがみにうつりはなさくらすとしーんがほらゆっくりかさなるめをおとすとただきみのすがたがまたみなもにゆれる',
  lyric_with_ruby: 'まぶしい\{陽,ひ\}が\{差し込ん,さしこん\}だ\{ ,\}\{グッド,ぐっど\}な\{モーニング,もーにんぐ\}\{ ,\}\{別れ,わかれ\}の\{日,ひ\}でも\{ ,\}いつもと\{変わら,かわら\}ないそんな\{ ,\}\{Good,ぐっど\}\{ ,\}な\{ ,\}\{Morning,もーにんぐ\}\{ ,\}\{バス,ばす\}\{ルーム,るーむ\}の\{鏡,かがみ\}に\{映り,うつり\}\{花,はな\}\{咲く,さく\}\{ ,\}\{ラストシーン,らすとしーん\}がほらゆっくり\{重なる,かさなる\}\{ ,\}\{目,め\}を\{落とす,おとす\}とただ\{ ,\}\{君,きみ\}の\{姿,すがた\}がまた\{ ,\}\{水面,みなも\}に\{揺れる,ゆれる\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '黒く艶めく君のお陰背伸びしてジェントルになれた気がしてただけおさな過ぎたタッチはいつも俺の負けお前の勝ちだったねでも2人を分かつ運命のT字路はオートマティック別々のさだめへShaveofMyHeartアフターシェーブは無くただソリが合わなかっただけだね',
  ruby: 'くろくつやめくきみのおかげせのびしてじぇんとるになれたきがしてただけおさなすぎたたっちはいつもおれのまけおまえのかちだったねでもふたりをわかつうんめいのてぃーじろはおーとまてぃっくべつべつのさだめへしぇーぶおぶまいはーとあふたーしぇーぶはなくただそりがあわなかっただけだね',
  lyric_with_ruby: '\{黒く,くろく\}\{艶,つや\}めく\{君,きみ\}の\{お陰,おかげ\}\{ ,\}\{背伸び,せのび\}して\{ジェントル,じぇんとる\}になれた\{気,き\}がしてただけ\{ ,\}おさな\{過ぎ,すぎ\}た\{タッチ,たっち\}は\{ ,\}いつも\{俺,おれ\}の\{負け,まけ\}\{ ,\}\{お前,おまえ\}の\{勝ち,かち\}だったね\{ ,\}でも\{2人,ふたり\}を\{分かつ,わかつ\}\{運命,うんめい\}の\{T,てぃー\}\{字,じ\}\{路,ろ\}は\{ ,\}\{オートマティック,おーとまてぃっく\}\{別々,べつべつ\}のさだめへ\{ ,\}\{Shave,しぇーぶ\}\{ ,\}\{of,おぶ\}\{ ,\}\{My,まい\}\{ ,\}\{Heart,はーと\}\{ ,\}\{アフターシェーブ,あふたーしぇーぶ\}は\{無く,なく\}\{ ,\}ただ\{ ,\}\{ソリ,そり\}が\{合わ,あわ\}なかっただけだね\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '君を失うってなんだ?考えてもみなかったそこに在ることが当たり前で出会った頃はまだ控えめだっただけど今じゃ僕を強くしていたんだImissyoubaby昨日までが嘘みたいだloveyoubaby今更気づいても遅いよハートはneedyoubabyヒリヒリさもう上手く笑えないんだDon\'tletgo',
  ruby: 'きみをうしなうってなんだかんがえてもみなかったそこにあることがあたりまえでであったころはまだひかえめだっただけどいまじゃぼくをつよくしていたんだあいみすゆーべいびーきのうまでがうそみたいだらぶゆーべいびーいまさらきづいてもおそいよはーとはにーどゆーべいびーひりひりさもううまくわらえないんだどんとれっとごー',
  lyric_with_ruby: '\{君,きみ\}を\{失う,うしなう\}ってなんだ\{?,\}\{ ,\}\{考え,かんがえ\}てもみなかった\{ ,\}そこに\{在る,ある\}ことが\{当たり前,あたりまえ\}で\{ ,\}\{出会っ,であっ\}た\{頃,ころ\}はまだ\{ ,\}\{控えめ,ひかえめ\}だった\{ ,\}だけど\{今,いま\}じゃ\{僕,ぼく\}を\{強く,つよく\}していたんだ\{ ,\}\{I,あい\}\{ ,\}\{miss,みす\}\{ ,\}\{you,ゆー\}\{ ,\}\{baby,べいびー\}\{ ,\}\{昨日,きのう\}までが\{嘘,うそ\}みたいだ\{ ,\}\{love,らぶ\}\{ ,\}\{you,ゆー\}\{ ,\}\{baby,べいびー\}\{ ,\}\{今更,いまさら\}\{気づい,きづい\}ても\{遅い,おそい\}よ\{ハート,はーと\}は\{ ,\}\{need,にーど\}\{ ,\}\{you,ゆー\}\{ ,\}\{baby,べいびー\}\{ ,\}\{ヒリヒリ,ひりひり\}さもう\{ ,\}\{上手く,うまく\}\{笑え,わらえ\}ないんだ\{ ,\}\{Don\'t,どんと\}\{ ,\}\{let,れっと\}\{ ,\}\{go,ごー\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'IStillLonelyIStillLonely君がFindMe本当の僕をIStillLonelyあの日のように戻れないからIWillShaveofMyHeart',
  ruby: 'あいすてぃるろんりーあいすてぃるろんりーきみがふぁいんどみーほんとうのぼくをあいすてぃるろんりーあのひのようにもどれないからあいうぃるしぇーぶおぶまいはーと',
  lyric_with_ruby: '\{I,あい\}\{ ,\}\{Still,すてぃる\}\{ ,\}\{Lonely,ろんりー\}\{ ,\}\{I,あい\}\{ ,\}\{Still,すてぃる\}\{ ,\}\{Lonely,ろんりー\}\{ ,\}\{君,きみ\}が\{ ,\}\{Find,ふぁいんど\}\{ ,\}\{Me,みー\}\{ ,\}\{本当,ほんとう\}の\{僕,ぼく\}を\{ ,\}\{I,あい\}\{ ,\}\{Still,すてぃる\}\{ ,\}\{Lonely,ろんりー\}\{ ,\}あの\{日,ひ\}のように\{ ,\}\{戻れ,もどれ\}ないから\{ ,\}\{I,あい\}\{ ,\}\{Will,うぃる\}\{ ,\}\{Shave,しぇーぶ\}\{ ,\}\{of,おぶ\}\{ ,\}\{My,まい\}\{ ,\}\{Heart,はーと\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'かっこつけたくて君の前だといつもそんな自分も今一人でミスド思い出すよ君につくカスタードクリーム笑って絡まって拭いた紙ナプキンでも君をJustletGo切り出した自分後悔とめどなくもうあの日は戻らないうっすらでもまた芽生えてくれたら',
  ruby: 'かっこつけたくてきみのまえだといつもそんなじぶんもいまひとりでみすどおもいだすよきみにつくかすたーどくりーむわらってからまってふいたかみなぷきんでもきみをじゃすとれっとごーきりだしたじぶんこうかいとめどなくもうあのひはもどらないうっすらでもまためばえてくれたら',
  lyric_with_ruby: 'かっこつけたくて\{君,きみ\}の\{前,まえ\}だといつも\{ ,\}そんな\{自分,じぶん\}も\{今,いま\}\{一人,ひとり\}で\{ミスド,みすど\}\{ ,\}\{思い出す,おもいだす\}よ\{君,きみ\}につく\{カスタード,かすたーど\}\{クリーム,くりーむ\}\{ ,\}\{笑っ,わらっ\}て\{絡まっ,からまっ\}て\{拭い,ふい\}た\{紙,かみ\}\{ナプキン,なぷきん\}\{ ,\}でも\{君,きみ\}を\{ ,\}\{Just,じゃすと\}\{ ,\}\{let,れっと\}\{ ,\}\{Go,ごー\}\{ ,\}\{切り出し,きりだし\}た\{自分,じぶん\}\{後悔,こうかい\}とめどなく\{ ,\}もうあの\{日,ひ\}は\{戻ら,もどら\}ない\{ ,\}うっすらでもまた\{芽生え,めばえ\}てくれたら\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 5,
  lyric: 'もうこんな恋は最後のヴァースのはず、が、相変わらず伸ばすラブa.k.aマスタッシュまるで昨日のよういくつ剃り落とし君に合ういくつも年をとり君に似合う男になる誰に持て囃されてもおれの気持ちはそらすなよ',
  ruby: 'もうこんなこいはさいごのゔぁーすのはずがあいかわらずのばすらぶあずのうんあずますたっしゅまるできのうのよういくつそりおとしきみにあういくつもとしをとりきみににあうおとこになるだれにもてはやされてもおれのきもちはそらすなよ',
  lyric_with_ruby: 'もうこんな\{恋,こい\}は\{最後,さいご\}の\{ヴァース,ゔぁーす\}のはず\{、,\}が\{、,\}\{ ,\}\{相変わらず,あいかわらず\}\{伸ばす,のばす\}\{ラブ,らぶ\}\{ ,\}\{a,あず\}\{.,\}\{k,のうん\}\{.,\}\{a,あず\}\{ ,\}\{マスタッシュ,ますたっしゅ\}まるで\{昨日,きのう\}のよう\{ ,\}いくつ\{剃り落とし,そりおとし\}\{君,きみ\}に\{合う,あう\}\{ ,\}いくつも\{年,とし\}をとり\{君,きみ\}に\{似合う,にあう\}\{ ,\}\{男,おとこ\}になる\{ ,\}\{誰,だれ\}に\{持て囃さ,もてはやさ\}れてもおれの\{気持ち,きもち\}はそらすなよ\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 6,
  lyric: 'missyoubaby気がつくと口元に手がほらloveyoubaby滑らかなラインを指でなぞればneedyoubaby思い返すあの頃の日々それはかすかに残る君の面影チクチクアンジョリジョリ感',
  ruby: 'みすゆーべいびーきがつくとくちもとにてがほららぶゆーべいびーなめらかならいんをゆびでなぞればにーどゆーべいびーおもいかえすあのころのひびそれはかすかにのこるきみのおもかげちくちくあんじょりじょりかん',
  lyric_with_ruby: '\{miss,みす\}\{ ,\}\{you,ゆー\}\{ ,\}\{baby,べいびー\}\{ ,\}\{気,き\}がつくと\{口元,くちもと\}に\{手,て\}が\{ ,\}ほら\{ ,\}\{love,らぶ\}\{ ,\}\{you,ゆー\}\{ ,\}\{baby,べいびー\}\{ ,\}\{滑らか,なめらか\}な\{ライン,らいん\}を\{指,ゆび\}でなぞれば\{ ,\}\{need,にーど\}\{ ,\}\{you,ゆー\}\{ ,\}\{baby,べいびー\}\{ ,\}\{思い返す,おもいかえす\}あの\{頃,ころ\}の\{日々,ひび\}\{ ,\}それはかすかに\{残る,のこる\}\{君,きみ\}の\{面影,おもかげ\}\{ ,\}\{チクチク,ちくちく\}\{ ,\}\{アン,あん\}\{ ,\}\{ジョリジョリ,じょりじょり\}\{感,かん\}\{ ,\}',
  lyric_order: 8,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'IStillLonelyIStillLonely君がFindMe本当の僕をSunWillberising繰り返すように時が流れればButIShaveofMyHeart',
  ruby: 'あいすてぃるろんりーあいすてぃるろんりーきみがふぁいんどみーほんとうのぼくをさんうぃるびーらいじんぐくりかえすようにときがながれればばっとあいしぇーぶおぶまいはーと',
  lyric_with_ruby: '\{I,あい\}\{ ,\}\{Still,すてぃる\}\{ ,\}\{Lonely,ろんりー\}\{ ,\}\{I,あい\}\{ ,\}\{Still,すてぃる\}\{ ,\}\{Lonely,ろんりー\}\{ ,\}\{君,きみ\}が\{ ,\}\{Find,ふぁいんど\}\{ ,\}\{Me,みー\}\{ ,\}\{本当,ほんとう\}の\{僕,ぼく\}を\{ ,\}\{Sun,さん\}\{ ,\}\{Will,うぃる\}\{ ,\}\{be,びー\}\{ ,\}\{rising,らいじんぐ\}\{ ,\}\{繰り返す,くりかえす\}ように\{ ,\}\{時,とき\}が\{流れれ,ながれれ\}ば\{ ,\}\{But,ばっと\}\{ ,\}\{I,あい\}\{ ,\}\{Shave,しぇーぶ\}\{ ,\}\{of,おぶ\}\{ ,\}\{My,まい\}\{ ,\}\{Heart,はーと\}\{ ,\}',
  lyric_order: 9,
)

