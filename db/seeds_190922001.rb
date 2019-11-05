artist_name =    'KREVA'
lyricUrl_url =   nil
cd_name =        'AFTERMIXTAPE'
cd_released_at = '2019-09-18'
song_name =      'アイソレーター'
song_lyricist =  'KREVA'
song_composer =  'KREVA'
song_arranger =  'KREVA'
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

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'ただ正直に生きている奴らが損する世の中は嫌どうにもこうにも良くない方に向かいそうこのままじゃなぁ世直しなんて大それたもんじゃない自分が嫌なとこ消すだけアイソレーター',
  ruby: 'ただしょうじきにいきているやつらがそんするよのなかはいやどうにもこうにもよくないほうにむかいそうこのままじゃなぁよなおしなんてだいそれたもんじゃないじぶんがいやなとこけすだけあいそれーたー',
  lyric_with_ruby: 'ただ\{正直,しょうじき\}に\{生き,いき\}ている\{奴ら,やつら\}が\{損する,そんする\}\{世の中,よのなか\}は\{ ,\}\{嫌,いや\}\{ ,\}どうにもこうにも\{良く,よく\}ない\{方,ほう\}に\{向かい,むかい\}そうこのままじゃ\{ ,\}なぁ\{ ,\}\{世直し,よなおし\}なんて\{大,だい\}それたもんじゃない\{ ,\}\{自分,じぶん\}が\{嫌,いや\}なとこ\{消す,けす\}だけ\{ ,\}\{アイソレーター,あいそれーたー\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '子供達が見てる前平気で信号無視するヤツ車に注意してるとか言って止まらない口車前の車の窓が開いたと思ったらゴミのポイ捨ていまだにその感覚持ってるなんて逆にすごいっすね!後部座席ではシートベルトをしなくても大丈夫?「ハイ、じょおずぅ?」ってほめてくれるママがいなきゃできない?そうゆうやつ?横いっぱいに広がって歩いて車道まで出てくる危険を感じる力がないんだと思ったら泣けてくる',
  ruby: 'こどもたちがみてるまえへいきでしんごうむしするやつくるまにちゅういしてるとかいってとまらないくちぐるままえのくるまのまどがあいたとおもったらごみのぽいすていまだにそのかんかくもってるなんてぎゃくにすごいっすねこうぶざせきではしーとべるとをしなくてもだいじょうぶはいじょおずぅってほめてくれるままがいなきゃできないそうゆうやつよこいっぱいにひろがってあるいてしゃどうまででてくるきけんをかんじるちからがないんだとおもったらなけてくる',
  lyric_with_ruby: '\{子供,こども\}\{達,たち\}が\{見,み\}てる\{前,まえ\}\{ ,\}\{平気,へいき\}で\{信号,しんごう\}\{無視,むし\}する\{ヤツ,やつ\}\{ ,\}\{車,くるま\}に\{注意,ちゅうい\}してるとか\{言っ,いっ\}て\{ ,\}\{止まら,とまら\}ない\{口車,くちぐるま\}\{ ,\}\{前,まえ\}の\{車,くるま\}の\{窓,まど\}が\{開い,あい\}たと\{思っ,おもっ\}たら\{ゴミ,ごみ\}の\{ポイ捨て,ぽいすて\}\{ ,\}いまだにその\{感覚,かんかく\}\{持っ,もっ\}てるなんて\{逆,ぎゃく\}にすごいっすね\{!,\}\{ ,\}\{後部,こうぶ\}\{座席,ざせき\}では\{シートベルト,しーとべると\}をしなくても\{大丈夫,だいじょうぶ\}\{?,\}\{ ,\}\{「,\}\{ハイ,はい\}\{、,\}じょおずぅ\{?」,\}ってほめてくれる\{ママ,まま\}がいなきゃできない\{?,\}\{ ,\}そうゆうやつ\{?,\}\{ ,\}\{横,よこ\}いっぱいに\{広がっ,ひろがっ\}て\{歩い,あるい\}て\{車道,しゃどう\}まで\{出,で\}てくる\{ ,\}\{危険,きけん\}を\{感じる,かんじる\}\{力,ちから\}がないんだと\{思っ,おもっ\}たら\{泣け,なけ\}てくる\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'ただ正直に生きている奴らが損する世の中は嫌どうにもこうにも良くない方に向かいそうこのままじゃなぁ世直しなんて大それたもんじゃない自分が嫌なとこ消すだけアイソレーター',
  ruby: 'ただしょうじきにいきているやつらがそんするよのなかはいやどうにもこうにもよくないほうにむかいそうこのままじゃなぁよなおしなんてだいそれたもんじゃないじぶんがいやなとこけすだけあいそれーたー',
  lyric_with_ruby: 'ただ\{正直,しょうじき\}に\{生き,いき\}ている\{奴ら,やつら\}が\{損する,そんする\}\{世の中,よのなか\}は\{ ,\}\{嫌,いや\}\{ ,\}どうにもこうにも\{良く,よく\}ない\{方,ほう\}に\{向かい,むかい\}そうこのままじゃ\{ ,\}なぁ\{ ,\}\{世直し,よなおし\}なんて\{大,だい\}それたもんじゃない\{ ,\}\{自分,じぶん\}が\{嫌,いや\}なとこ\{消す,けす\}だけ\{ ,\}\{アイソレーター,あいそれーたー\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '繊細さを大事にしてる店で香水キッツい迷惑そうな視線に耐えられるメンタルにもびっくりせっかく皆でごはん来てるのに別の店の話そんなにいいなら今から一人で行ったらいいんじゃない?普段はそうでもないのに店員さんにだけは強気もう何回聞いたかわからんそのうんちくマジくどいあるはずの無いようなもの注文している得意げにすいません!この人もさげてもらってもいいですか?ついでに',
  ruby: 'せんさいさをだいじにしてるみせでこうすいきっついめいわくそうなしせんにたえられるめんたるにもびっくりせっかくみんなでごはんきてるのにべつのみせのはなしそんなにいいならいまからひとりでいったらいいんじゃないふだんはそうでもないのにてんいんさんにだけはつよきもうなんかいきいたかわからんそのうんちくまじくどいあるはずのないようなものちゅうもんしているとくいげにすいませんこのひともさげてもらってもいいですかついでに',
  lyric_with_ruby: '\{繊細,せんさい\}さを\{大事,だいじ\}にしてる\{店,みせ\}で\{香水,こうすい\}\{キッツ,きっつ\}い\{ ,\}\{迷惑,めいわく\}そうな\{視線,しせん\}に\{耐え,たえ\}られる\{メンタル,めんたる\}にもびっくり\{ ,\}せっかく\{皆,みんな\}でごはん\{来,き\}てるのに\{別,べつ\}の\{店,みせ\}の\{話,はなし\}\{ ,\}そんなにいいなら\{今,いま\}から\{一人,ひとり\}で\{行っ,いっ\}たらいいんじゃない\{?,\}\{ ,\}\{普段,ふだん\}はそうでもないのに\{店員,てんいん\}さんにだけは\{強気,つよき\}\{ ,\}もう\{何,なん\}\{回,かい\}\{聞い,きい\}たかわからん\{ ,\}そのうんちく\{ ,\}\{マジ,まじ\}くどい\{ ,\}あるはずの\{無い,ない\}ようなもの\{注文,ちゅうもん\}している\{得意げ,とくいげ\}に\{ ,\}すいません\{!,\}\{ ,\}この\{人,ひと\}もさげてもらってもいいですか\{?,\}\{ ,\}ついでに\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'ただ正直に生きている奴らが損する世の中は嫌どうにもこうにも良くない方に向かいそうこのままじゃなぁ世直しなんて大それたもんじゃない自分が嫌なとこ消すだけアイソレーター',
  ruby: 'ただしょうじきにいきているやつらがそんするよのなかはいやどうにもこうにもよくないほうにむかいそうこのままじゃなぁよなおしなんてだいそれたもんじゃないじぶんがいやなとこけすだけあいそれーたー',
  lyric_with_ruby: 'ただ\{正直,しょうじき\}に\{生き,いき\}ている\{奴ら,やつら\}が\{損する,そんする\}\{世の中,よのなか\}は\{ ,\}\{嫌,いや\}\{ ,\}どうにもこうにも\{良く,よく\}ない\{方,ほう\}に\{向かい,むかい\}そうこのままじゃ\{ ,\}なぁ\{ ,\}\{世直し,よなおし\}なんて\{大,だい\}それたもんじゃない\{ ,\}\{自分,じぶん\}が\{嫌,いや\}なとこ\{消す,けす\}だけ\{ ,\}\{アイソレーター,あいそれーたー\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'HighCutMidCutLowCutはい、カット',
  ruby: 'はいかっとみっどかっとろーかっとはいかっと',
  lyric_with_ruby: '\{High,はい\}\{ ,\}\{Cut,かっと\}\{ ,\}\{Mid,みっど\}\{ ,\}\{Cut,かっと\}\{ ,\}\{Low,ろー\}\{ ,\}\{Cut,かっと\}\{ ,\}はい\{、,\}\{カット,かっと\}\{ ,\}',
  lyric_order: 6,
)

