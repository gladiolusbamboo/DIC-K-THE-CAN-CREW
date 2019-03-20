artist_name =    'UL'
lyricUrl_url =   'https://www.utamap.com/showkasi.php?surl=k-150430-116'
cd_name =        'Boys&Gentlemen'
cd_released_at = '2015-04-29'
song_name =      '馬ッ鹿者 feat.増子直純(怒髪天)'
song_lyricist =  'MCU, LITTLE & 増子直純(怒髪天)'
song_composer =  'MCU, LITTLE, 上原子友康(怒髪天) & ALI-KICK'
song_arranger =  'ALI-KICK'
cds_name = []
note =           '歌詞カードではHOOKの歌詞が「馬鹿ッ者」表記（誤植？そのまま入力しています）'

Singer.create(
    name: '増子直純'
)

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
  artist_id: artist.id,
  note: note
)
LyricUrlSong.create(
  lyric_url_id: lyricUrl.id,
  song_id: song.id
)
CdSong.create(
  cd_id: cd.id,
  song_id: song.id
)

singer = Singer.find_by(name: '増子直純')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '行くぜ男道',
  ruby: 'いくぜおとこみち',
  lyric_with_ruby: '\{行く,いく\}ぜ\{ ,\}\{男,おとこ\}\{道,みち\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'MCU')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'やればできる失敗は成功したい無駄な抵抗バタバタさながらだだこねる間違ったらまじこめん(かっこマジで!)いまだ終わらない春休み止まらぬ悪巧みjumpjumpだ少年はjumpおれはもうとっくにヤングjumpまだやってる馬鹿やってる言わしてもらえば戦ってるシワの数だけシワ伸ばす逆境の数だけ舌を出す理屈じゃねんだよライフ(ライフ)チャーハン片手にライス(ナイス)若さゆえ的あやまちなど言い訳はやめて裸に(なり)拝み倒す願い事でっかいこと描いとこ未来は誰の腕の中(俺だ!)まだまだ夢を語る(ya)',
  ruby: 'やればできるしっぱいはせいこうしたいむだなていこうばたばたさながらだだこねるまちがったらまじこめんかっこまじでいまだおわらないはるやすみとまらぬわるだくみじゃんぷじゃんぷだしょうねんはじゃんぷおれはもうとっくにやんぐじゃんぷまだやってるばかやってるいわしてもらえばたたかってるしわのかずだけしわのばすぎゃっきょうのかずだけしたをだすりくつじゃねんだよらいふらいふちゃーはんかたてにらいすないすわかさゆえてきあやまちなどいいわけはやめてはだかになりおがみたおすねがいごとでっかいことえがいとこみらいはだれのうでのなかおれだまだまだゆめをかたるや',
  lyric_with_ruby: 'やればできる\{ ,\}\{失敗,しっぱい\}は\{成功,せいこう\}\{ ,\}したい\{無駄,むだ\}な\{抵抗,ていこう\}\{ ,\}\{バタバタ,ばたばた\}さながらだだこねる\{ ,\}\{間違っ,まちがっ\}たらまじこめん\{ ,\}\{(,\}かっこ\{マジ,まじ\}で\{!),\}\{ ,\}いまだ\{終わら,おわら\}ない\{春休み,はるやすみ\}\{ ,\}\{止まら,とまら\}ぬ\{悪巧み,わるだくみ\}\{ ,\}\{jumpjump,じゃんぷじゃんぷ\}\{ ,\}だ\{少年,しょうねん\}は\{ ,\}\{jump,じゃんぷ\}\{ ,\}おれはもうとっくに\{ヤング,やんぐ\}\{ ,\}\{jump,じゃんぷ\}\{ ,\}まだやってる\{ ,\}\{馬鹿,ばか\}やってる\{ ,\}\{言わし,いわし\}てもらえば\{戦っ,たたかっ\}てる\{ ,\}\{シワ,しわ\}の\{数,かず\}だけ\{シワ,しわ\}\{伸ばす,のばす\}\{ ,\}\{逆境,ぎゃっきょう\}の\{数,かず\}だけ\{舌,した\}を\{出す,だす\}\{ ,\}\{理屈,りくつ\}じゃねんだよ\{ライフ,らいふ\}\{ ,\}\{(,\}\{ライフ,らいふ\}\{),\}\{ ,\}\{チャーハン,ちゃーはん\}\{片手,かたて\}に\{ライス,らいす\}\{ ,\}\{(,\}\{ナイス,ないす\}\{),\}\{ ,\}\{若,わか\}さゆえ\{的,てき\}あやまち\{ ,\}など\{言い訳,いいわけ\}はやめて\{裸,はだか\}に\{ ,\}\{(,\}なり\{),\}\{ ,\}\{拝み倒す,おがみたおす\}\{願い事,ねがいごと\}\{ ,\}でっかいこと\{描い,えがい\}とこ\{ ,\}\{未来,みらい\}は\{誰,だれ\}の\{腕,うで\}の\{中,なか\}\{ ,\}\{(,\}\{俺,おれ\}だ\{!),\}\{ ,\}まだまだ\{夢,ゆめ\}を\{語る,かたる\}\{ ,\}\{(,\}\{ya,や\}\{),\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: '増子直純')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'ふざけた時代蹴っ飛ばし馬鹿げた夢と愛を抱いて男は今日も旅する嗚呼明日も見えぬ旅を',
  ruby: 'ふざけたじだいけっとばしばかげたゆめとあいをだいておとこはきょうもたびするあああすもみえぬたびを',
  lyric_with_ruby: 'ふざけた\{時代,じだい\}\{ ,\}\{蹴っ飛ばし,けっとばし\}\{ ,\}\{馬鹿げ,ばかげ\}た\{夢,ゆめ\}と\{ ,\}\{愛,あい\}を\{抱い,だい\}て\{ ,\}\{男,おとこ\}は\{今日,きょう\}も\{旅,たび\}する\{ ,\}\{嗚呼,ああ\}\{ ,\}\{明日,あす\}も\{ ,\}\{見え,みえ\}ぬ\{ ,\}\{旅,たび\}を\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'UL')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '馬鹿ッ者',
  ruby: 'ばっかもん',
  lyric_with_ruby: '\{馬鹿ッ者,ばっかもん\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: '増子直純')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '行くぜ男道',
  ruby: 'いくぜおとこみち',
  lyric_with_ruby: '\{行く,いく\}ぜ\{ ,\}\{男,おとこ\}\{道,みち\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'ろくでもないそんな音楽やってるまるで売れっこない歌を歌ってる(yeah)ゴメンが言えないでアハハ笑ってるありがとうの代わりに皿を洗ってるまだまだ冒険好きなら同士頭は少年麦わら帽子嫁の口からbullshitオチのつかねえ夢みたいな話続けようぜすれ違いは悲しい空も飛べるはずそりゃあ飛べないけど飛べそうだと思えるヤツじゃなきゃ遊べない',
  ruby: 'ろくでもないそんなおんがくやってるまるでうれっこないうたをうたってるいぇーごめんがいえないであははわらってるありがとうのかわりにさらをあらってるまだまだぼうけんずきならどうしあたまはしょうねんむぎわらぼうしよめのくちからぶるしっとおちのつかねえゆめみたいなはなしつづけようぜすれちがいはかなしいそらもとべるはずそりゃあとべないけどとべそうだとおもえるやつじゃなきゃあそべない',
  lyric_with_ruby: 'ろくでもない\{ ,\}そんな\{音楽,おんがく\}やってる\{ ,\}まるで\{売れっこ,うれっこ\}ない\{ ,\}\{歌,うた\}を\{歌っ,うたっ\}てる\{ ,\}\{(,\}\{yeah,いぇー\}\{),\}\{ ,\}\{ゴメン,ごめん\}が\{言え,いえ\}ないで\{アハハ,あはは\}\{笑っ,わらっ\}てる\{ ,\}ありがとうの\{代わり,かわり\}に\{皿,さら\}を\{洗っ,あらっ\}てる\{ ,\}まだまだ\{冒険,ぼうけん\}\{好き,ずき\}なら\{同士,どうし\}\{ ,\}\{頭,あたま\}は\{少年,しょうねん\}\{ ,\}\{麦わら帽子,むぎわらぼうし\}\{ ,\}\{嫁,よめ\}の\{口,くち\}から\{ ,\}\{bull,ぶる\}\{ ,\}\{shit,しっと\}\{ ,\}\{オチ,おち\}のつかねえ\{夢,ゆめ\}みたいな\{話,はなし\}\{ ,\}\{続けよ,つづけよ\}うぜ\{ ,\}\{すれ違い,すれちがい\}は\{悲しい,かなしい\}\{ ,\}\{空,そら\}も\{飛べる,とべる\}はず\{ ,\}そりゃあ\{飛べ,とべ\}ないけど\{ ,\}\{飛べ,とべ\}そうだと\{思える,おもえる\}\{ヤツ,やつ\}じゃなきゃ\{遊べ,あそべ\}ない\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: '増子直純')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'ふざけた時代蹴っ飛ばし馬鹿げた夢と愛を抱いて男は今日も旅する嗚呼明日も見えぬ旅を',
  ruby: 'ふざけたじだいけっとばしばかげたゆめとあいをだいておとこはきょうもたびするあああすもみえぬたびを',
  lyric_with_ruby: 'ふざけた\{時代,じだい\}\{ ,\}\{蹴っ飛ばし,けっとばし\}\{ ,\}\{馬鹿げ,ばかげ\}た\{夢,ゆめ\}と\{ ,\}\{愛,あい\}を\{抱い,だい\}て\{ ,\}\{男,おとこ\}は\{今日,きょう\}も\{旅,たび\}する\{ ,\}\{嗚呼,ああ\}\{ ,\}\{明日,あす\}も\{ ,\}\{見え,みえ\}ぬ\{ ,\}\{旅,たび\}を\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'MCU')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '誰かは言うもう止まんなきゃ無理でもこのまんま突っ込むど真ん中節どうせ一度っきりの(ハイ)人生だろ?その中今生きてる人間だもん',
  ruby: 'だれかはいうもうとまんなきゃむりでもこのまんまつっこむどまんなかぶしどうせいちどっきりのはいじんせいだろそのなかいまいきてるにんげんだもん',
  lyric_with_ruby: '\{誰,だれ\}かは\{言う,いう\}\{ ,\}もう\{止まん,とまん\}なきゃ\{無理,むり\}\{ ,\}でもこのまんま\{突っ込む,つっこむ\}\{ ,\}ど\{真ん中,まんなか\}\{節,ぶし\}\{ ,\}どうせ\{ ,\}\{一,いち\}\{度,ど\}っきりの\{ ,\}\{(,\}\{ハイ,はい\}\{),\}\{ ,\}\{人生,じんせい\}だろ\{?,\}\{ ,\}その\{中,なか\}\{今,いま\}\{生き,いき\}てる\{人間,にんげん\}だもん\{ ,\}',
  lyric_order: 8,
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: '相変わらずオレは物わかりのわりい方もっと遊ぼうぜアミーゴ分かった気になって肩肘張ってんならいきがって息上がるまで生きる',
  ruby: 'あいかわらずおれはものわかりのわりいほうもっとあそぼうぜあみーごわかったきになってかたひじはってんならいきがっていきあがるまでいきる',
  lyric_with_ruby: '\{相変わらず,あいかわらず\}\{ ,\}\{オレ,おれ\}は\{物わかり,ものわかり\}のわりい\{方,ほう\}\{ ,\}もっと\{遊ぼ,あそぼ\}うぜ\{ ,\}\{アミーゴ,あみーご\}\{ ,\}\{分かっ,わかっ\}た\{気,き\}になって\{ ,\}\{肩肘,かたひじ\}\{張っ,はっ\}てんなら\{ ,\}いきがって\{ ,\}\{息,いき\}\{上がる,あがる\}まで\{生きる,いきる\}\{ ,\}',
  lyric_order: 9,
)

singer = Singer.find_by(name: '増子直純')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'ふざけた時代蹴っ飛ばし馬鹿げた夢と愛を抱いて男は今日も旅する嗚呼明日も見えぬ旅を',
  ruby: 'ふざけたじだいけっとばしばかげたゆめとあいをだいておとこはきょうもたびするあああすもみえぬたびを',
  lyric_with_ruby: 'ふざけた\{時代,じだい\}\{ ,\}\{蹴っ飛ばし,けっとばし\}\{ ,\}\{馬鹿げ,ばかげ\}た\{夢,ゆめ\}と\{愛,あい\}を\{抱い,だい\}て\{ ,\}\{男,おとこ\}は\{今日,きょう\}も\{旅,たび\}する\{ ,\}\{嗚呼,ああ\}\{ ,\}\{明日,あす\}も\{ ,\}\{見え,みえ\}ぬ\{ ,\}\{旅,たび\}を\{ ,\}',
  lyric_order: 10,
)

