artist_name =    'UL'
lyricUrl_url =   'https://www.utamap.com/showkasi.php?surl=k-140305-152'
cd_name =        'ULTRAP'
cd_released_at = ''
song_name =      '寄り添う'
song_lyricist =  'MCU & LITTLE'
song_composer =  'MCU, LITTLE & KREVA'
song_arranger =  'KREVA'
cds_name = []

artist = Artist.find_by(name: artist_name) || Artist.create(name: artist_name)
cd = Cd.find_by(name: cd_name) || Cd.create(name: cd_name, released_at: cd_released_at)
lyricUrl = LyricUrl.create(
  url: lyricUrl_url,
  lyric_website_id: LyricWebsite.find_by(name: 'うたまっぷ').id
)
song = Song.create(
  lyric_url_id: lyricUrl.id,
  name: song_name,
  lyricist: song_lyricist,
  composer: song_composer,
  arranger: song_arranger,
  cd_id: cd.id,
  artist_id: artist.id
)
LyricUrlSong.create(
  lyric_url_id: lyricUrl.id,
  song_id: song.id
)
CdSong.create(
  cd_id: cd.id,
  song_id: song.id
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '夜が明ける朝日が差す闇を抜けまた陽が差す今日は希望語り明かすより一層寄り添う沈む陽もあるたまにはある悲しがらす話題じゃなく聞かせたい話がある寄り添うよ理想',
  ruby: 'よるがあけるあさひがさすやみをぬけまたひがさすきょうはきぼうかたりあかすよりいっそうよりそうしずむひもあるたまにはあるかなしがらすわだいじゃなくきかせたいはなしがあるよりそうよりそう',
  lyric_with_ruby: '\{夜,よる\}が\{明ける,あける\}\{ ,\}\{朝日,あさひ\}が\{差す,さす\}\{ ,\}\{闇,やみ\}を\{抜け,ぬけ\}\{ ,\}また\{陽,ひ\}が\{差す,さす\}\{ ,\}\{今日,きょう\}は\{希望,きぼう\}\{ ,\}\{語り明かす,かたりあかす\}\{ ,\}より\{一層,いっそう\}\{ ,\}\{寄り添う,よりそう\}\{ ,\}\{沈む,しずむ\}\{陽,ひ\}もある\{ ,\}たまにはある\{ ,\}\{悲し,かなし\}がらす\{話題,わだい\}じゃなく\{ ,\}\{聞か,きか\}せたい\{話,はなし\}がある\{ ,\}\{寄り添う,よりそう\}よ\{ ,\}\{理想,りそう\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '代わり映えのしない今日もNew当たり前に昨日のようなNewDayさらに前の日とも同じ風景肩にかける鞄結ぶシューレース探し出せ普段と違うNuanceカバチタレるより余裕のStance洗いたてのShirtをきたら不安吹き飛ばすプラン語りかける',
  ruby: 'かわりばえのしないきょうもにゅーあたりまえにきのうのようなにゅーでーさらにまえのひともおなじふうけいかたにかけるかばんむすぶしゅーれーすさがしだせふだんとちがうにゅあんすかばちたれるよりよゆうのすたんすあらいたてのしゃつをきたらふあんふきとばすぷらんかたりかける',
  lyric_with_ruby: '\{代わり映え,かわりばえ\}のしない\{今日,きょう\}も\{ ,\}\{New,にゅー\}\{ ,\}\{当たり前,あたりまえ\}に\{昨日,きのう\}のような\{ ,\}\{New,にゅー\}\{ ,\}\{Day,でー\}\{ ,\}さらに\{前,まえ\}の\{日,ひ\}とも\{同じ,おなじ\}\{風景,ふうけい\}\{ ,\}\{肩,かた\}にかける\{鞄,かばん\}\{ ,\}\{結ぶ,むすぶ\}\{シュー,しゅー\}\{レース,れーす\}\{ ,\}\{探し出せ,さがしだせ\}\{普段,ふだん\}と\{違う,ちがう\}\{ ,\}\{Nuance,にゅあんす\}\{ ,\}\{カバチタレ,かばちたれ\}るより\{余裕,よゆう\}の\{ ,\}\{Stance,すたんす\}\{ ,\}\{洗いたて,あらいたて\}の\{ ,\}\{Shirt,しゃつ\}\{ ,\}をきたら\{ ,\}\{不安,ふあん\}\{吹き飛ばす,ふきとばす\}\{プラン,ぷらん\}\{ ,\}\{語りかける,かたりかける\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'MCU')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'おはようございます新しい今日にこんにちは騒がしい日々でもお日様華々しいこんばんは夜空は輝かしいバカ話でもマジ話でも何でもいい話したらいいしがらみなんか飛び越え明日に歌えば何かが起きそうでさー行こうぜ何ができるいや何かできるほら手を取り合って大丈夫です失敗しても空に伸ばしなよいっぱいに手を今日がダメならばまた明日これは逃げじゃなく輝きさ希望ある明日に口笛を今日にくちづけを',
  ruby: 'おはようございますあたらしいきょうにこんにちはさわがしいひびでもおひさまはなばなしいこんばんはよぞらはかがやかしいばかばなしでもまじばなしでもなんでもいいはなしたらいいしがらみなんかとびこえあすにうたえばなにかがおきそうでさーいこうぜなにができるいやなにかできるほらてをとりあってだいじょうぶですしっぱいしてもそらにのばしなよいっぱいにてをきょうがだめならばまたあしたこれはにげじゃなくかがやきさきぼうあるあすにくちぶえをきょうにくちづけを',
  lyric_with_ruby: 'おはようございます\{ ,\}\{新しい,あたらしい\}\{今日,きょう\}にこんにちは\{ ,\}\{騒がしい,さわがしい\}\{日々,ひび\}でも\{お日様,おひさま\}\{華々しい,はなばなしい\}\{ ,\}こんばんは\{夜空,よぞら\}は\{輝かしい,かがやかしい\}\{ ,\}\{バカ,ばか\}\{話,ばなし\}でも\{マジ,まじ\}\{話,ばなし\}でも\{ ,\}\{何,なん\}でもいい\{ ,\}\{話し,はなし\}たらいい\{ ,\}しがらみなんか\{ ,\}\{飛び越え,とびこえ\}\{ ,\}\{明日,あす\}に\{歌え,うたえ\}ば\{何,なに\}かが\{起き,おき\}そうで\{ ,\}さー\{行こ,いこ\}うぜ\{ ,\}\{何,なに\}ができる\{ ,\}いや\{何,なに\}かできる\{ ,\}ほら\{手,て\}を\{取り合っ,とりあっ\}て\{ ,\}\{大丈夫,だいじょうぶ\}です\{失敗,しっぱい\}しても\{ ,\}\{空,そら\}に\{伸ばし,のばし\}なよ\{ ,\}いっぱいに\{手,て\}を\{ ,\}\{今日,きょう\}が\{ダメ,だめ\}ならばまた\{明日,あした\}\{ ,\}これは\{逃げ,にげ\}じゃなく\{輝き,かがやき\}さ\{ ,\}\{希望,きぼう\}ある\{明日,あす\}に\{口笛,くちぶえ\}を\{ ,\}\{今日,きょう\}にくちづけを\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '夜が明ける朝日が差す闇を抜けまた陽が差す今日は希望語り明かすより一層寄り添う沈む陽もあるたまにはある悲しがらす話題じゃなく聞かせたい話がある寄り添うよ理想',
  ruby: 'よるがあけるあさひがさすやみをぬけまたひがさすきょうはきぼうかたりあかすよりいっそうよりそうしずむひもあるたまにはあるかなしがらすわだいじゃなくきかせたいはなしがあるよりそうよりそう',
  lyric_with_ruby: '\{夜,よる\}が\{明ける,あける\}\{ ,\}\{朝日,あさひ\}が\{差す,さす\}\{ ,\}\{闇,やみ\}を\{抜け,ぬけ\}\{ ,\}また\{陽,ひ\}が\{差す,さす\}\{ ,\}\{今日,きょう\}は\{希望,きぼう\}\{ ,\}\{語り明かす,かたりあかす\}\{ ,\}より\{一層,いっそう\}\{ ,\}\{寄り添う,よりそう\}\{ ,\}\{沈む,しずむ\}\{陽,ひ\}もある\{ ,\}たまにはある\{ ,\}\{悲し,かなし\}がらす\{話題,わだい\}じゃなく\{ ,\}\{聞か,きか\}せたい\{話,はなし\}がある\{ ,\}\{寄り添う,よりそう\}よ\{ ,\}\{理想,りそう\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'MCU')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '笑ったり泣いたり喧嘩したり君に告ったり告られたり勇気が湧いたりなくなったりいつもの仲間で集まったり踏んだり蹴ったりまたがっかり(えい)空見上げ気持ち高まったり(えい)いい日もあるが違う日もあるでも今日もNEWDAY始まる',
  ruby: 'わらったりないたりけんかしたりきみにこくったりこくられたりゆうきがわいたりなくなったりいつものなかまであつまったりふんだりけったりまたがっかりえいそらみあげきもちたかまったりえいいいひもあるがちがうひもあるでもきょうもにゅーでーはじまる',
  lyric_with_ruby: '\{笑っ,わらっ\}たり\{ ,\}\{泣い,ない\}たり\{ ,\}\{喧嘩,けんか\}したり\{ ,\}\{君,きみ\}に\{告,こく\}ったり\{ ,\}\{告,こく\}られたり\{ ,\}\{勇気,ゆうき\}が\{湧い,わい\}たり\{ ,\}なくなったり\{ ,\}いつもの\{仲間,なかま\}で\{集まっ,あつまっ\}たり\{ ,\}\{踏ん,ふん\}だり\{蹴っ,けっ\}たり\{ ,\}またがっかり\{ ,\}\{(,\}えい\{),\}\{ ,\}\{空見,そらみ\}\{上げ,あげ\}\{気持ち,きもち\}\{高,たか\}まったり\{ ,\}\{(,\}えい\{),\}\{ ,\}いい\{日,ひ\}もあるが\{違う,ちがう\}\{日,ひ\}もある\{ ,\}でも\{今日,きょう\}も\{ ,\}\{NEW,にゅー\}\{ ,\}\{DAY,でー\}\{ ,\}\{始まる,はじまる\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: '二つとないたったひとつ握りしめスタートラインに立った人つぶやけば歌のない夜に歌繋げばスターのない空にスター明日きっと晴れだ日めくりカレンダーめくり俺は逃げずにやれんだいきなり息巻いてすみませんがともに前を向いて行きませんか希望的観測やたらいいだったらいいならいい新しい日嘘でもいい俺が信じて真実にしておく先んじて悪い予感のかけらもないスローバラードじゃないしわけなどない何故か?もないクエスチョンはそぐわないだって明けない夜はない',
  ruby: 'ふたつとないたったひとつにぎりしめすたーとらいんにたったひとつぶやけばうたのないよるにうたつなげばすたーのないそらにすたーあしたきっとはれだひめくりかれんだーめくりおれはにげずにやれんだいきなりいきまいてすみませんがともにまえをむいていきませんかきぼうてきかんそくやたらいいだったらいいならいいあたらしいひうそでもいいおれがしんじてしんじつにしておくさきんじてわるいよかんのかけらもないすろーばらーどじゃないしわけなどないなぜかもないくえすちょんはそぐわないだってあけないよるはない',
  lyric_with_ruby: '\{二つ,ふたつ\}とないたったひとつ\{ ,\}\{握りしめ,にぎりしめ\}\{スタートライン,すたーとらいん\}に\{立っ,たっ\}た\{人,ひと\}\{ ,\}つぶやけば\{ ,\}\{歌,うた\}のない\{夜,よる\}に\{歌,うた\}\{ ,\}\{繋げ,つなげ\}ば\{スター,すたー\}のない\{空,そら\}に\{スター,すたー\}\{ ,\}\{明日,あした\}きっと\{晴れ,はれ\}だ\{ ,\}\{日めくり,ひめくり\}\{カレンダー,かれんだー\}めくり\{ ,\}\{俺,おれ\}は\{逃げ,にげ\}ずにやれんだ\{ ,\}いきなり\{息巻い,いきまい\}てすみませんが\{ ,\}ともに\{前,まえ\}を\{向い,むい\}て\{行き,いき\}ませんか\{ ,\}\{希望,きぼう\}\{的,てき\}\{観測,かんそく\}\{ ,\}やたらいい\{ ,\}だったらいいならいい\{ ,\}\{新しい,あたらしい\}\{日,ひ\}\{ ,\}\{嘘,うそ\}でもいい\{俺,おれ\}が\{信じ,しんじ\}て\{ ,\}\{真実,しんじつ\}にしておく\{ ,\}\{先んじ,さきんじ\}て\{ ,\}\{悪い,わるい\}\{予感,よかん\}のかけらもない\{ ,\}\{スロー,すろー\}\{バラード,ばらーど\}じゃないし\{ ,\}わけなどない\{ ,\}\{何故か,なぜか\}\{?,\}もない\{クエスチョン,くえすちょん\}はそぐわない\{ ,\}だって\{ ,\}\{明け,あけ\}ない\{夜,よる\}はない\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '夜が明ける朝日が差す闇を抜けまた陽が差す今日は希望語り明かすより一層寄り添う沈む陽もあるたまにはある悲しがらす話題じゃなく聞かせたい話がある寄り添うよ理想',
  ruby: 'よるがあけるあさひがさすやみをぬけまたひがさすきょうはきぼうかたりあかすよりいっそうよりそうしずむひもあるたまにはあるかなしがらすわだいじゃなくきかせたいはなしがあるよりそうよりそう',
  lyric_with_ruby: '\{夜,よる\}が\{明ける,あける\}\{ ,\}\{朝日,あさひ\}が\{差す,さす\}\{ ,\}\{闇,やみ\}を\{抜け,ぬけ\}\{ ,\}また\{陽,ひ\}が\{差す,さす\}\{ ,\}\{今日,きょう\}は\{希望,きぼう\}\{ ,\}\{語り明かす,かたりあかす\}\{ ,\}より\{一層,いっそう\}\{ ,\}\{寄り添う,よりそう\}\{ ,\}\{沈む,しずむ\}\{陽,ひ\}もある\{ ,\}たまにはある\{ ,\}\{悲し,かなし\}がらす\{話題,わだい\}じゃなく\{ ,\}\{聞か,きか\}せたい\{話,はなし\}がある\{ ,\}\{寄り添う,よりそう\}よ\{ ,\}\{理想,りそう\}\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: '夜が明ける朝日が差す闇を抜けまた陽が差す今日は希望語り明かすより一層寄り添う沈む陽もあるたまにはある悲しがらす話題じゃなく聞かせたい話がある寄り添うよ理想',
  ruby: 'よるがあけるあさひがさすやみをぬけまたひがさすきょうはきぼうかたりあかすよりいっそうよりそうしずむひもあるたまにはあるかなしがらすわだいじゃなくきかせたいはなしがあるよりそうよりそう',
  lyric_with_ruby: '\{夜,よる\}が\{明ける,あける\}\{ ,\}\{朝日,あさひ\}が\{差す,さす\}\{ ,\}\{闇,やみ\}を\{抜け,ぬけ\}\{ ,\}また\{陽,ひ\}が\{差す,さす\}\{ ,\}\{今日,きょう\}は\{希望,きぼう\}\{ ,\}\{語り明かす,かたりあかす\}\{ ,\}より\{一層,いっそう\}\{ ,\}\{寄り添う,よりそう\}\{ ,\}\{沈む,しずむ\}\{陽,ひ\}もある\{ ,\}たまにはある\{ ,\}\{悲し,かなし\}がらす\{話題,わだい\}じゃなく\{ ,\}\{聞か,きか\}せたい\{話,はなし\}がある\{ ,\}\{寄り添う,よりそう\}よ\{ ,\}\{理想,りそう\}\{ ,\}',
  lyric_order: 8,
)

