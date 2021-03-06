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

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'テーブルの上に飾ったベーブルースの人形が君に手振る思い出してみなあの遠い日を幼いころの夢よもう一度あの夢は日々の生活の中で現実という言葉にとらわれ飛ばされていった心の深い暗いところ見失ったつかみどころそういえばあれを機会にまるで全て忘れたみたいに常識の沸き出す蛇口ひねり全部洗い流してたときめきキセキ?たまには信じてみたいでもこの気持ち分る奴が居ない以外や以外に近いとこに二人理解しているやつがいたり',
  ruby: 'てーぶるのうえにかざったべーぶるーすのにんぎょうがきみにてふるおもいだしてみなあのとおいひをおさないころのゆめよもういちどあのゆめはひびのせいかつのなかでげんじつということばにとらわれとばされていったこころのふかいくらいところみうしなったつかみどころそういえばあれをきかいにまるですべてわすれたみたいにじょうしきのわきだすじゃぐちひねりぜんぶあらいながしてたときめききせきたまにはしんじてみたいでもこのきもちわかるやつがいないいがいやいがいにちかいとこにふたりりかいしているやつがいたり',
  lyric_with_ruby: '\{テーブル,てーぶる\}の\{上,うえ\}に\{飾っ,かざっ\}た\{ ,\}\{ベーブルース,べーぶるーす\}の\{人形,にんぎょう\}が\{君,きみ\}に\{手,て\}\{振る,ふる\}\{ ,\}\{思い出し,おもいだし\}てみなあの\{遠い,とおい\}\{日,ひ\}を\{ ,\}\{幼い,おさない\}ころの\{夢,ゆめ\}よ\{もう一度,もういちど\}\{ ,\}あの\{夢,ゆめ\}は\{日々,ひび\}の\{生活,せいかつ\}の\{中,なか\}で\{ ,\}\{現実,げんじつ\}という\{言葉,ことば\}にとらわれ\{ ,\}\{飛ばさ,とばさ\}れていった\{心,こころ\}の\{深い,ふかい\}\{暗い,くらい\}ところ\{ ,\}\{見失っ,みうしなっ\}たつかみどころ\{ ,\}そういえばあれを\{機会,きかい\}に\{ ,\}まるで\{全て,すべて\}\{忘れ,わすれ\}たみたいに\{ ,\}\{常識,じょうしき\}の\{沸き,わき\}\{出す,だす\}\{蛇口,じゃぐち\}ひねり\{ ,\}\{全部,ぜんぶ\}\{洗い流し,あらいながし\}てたときめき\{ ,\}\{キセキ,きせき\}\{?,\}たまには\{信じ,しんじ\}てみたい\{ ,\}でもこの\{気持ち,きもち\}\{ ,\}\{分る,わかる\}\{奴,やつ\}が\{居,い\}ない\{ ,\}\{以外,いがい\}や\{以外,いがい\}に\{近い,ちかい\}とこに\{ ,\}\{二人,ふたり\}\{ ,\}\{理解,りかい\}しているやつがいたり\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '大丈夫君は大丈夫誰かが君を待っているよ大丈夫君は大丈夫その気持ちは分かっているよ大丈夫君は大丈夫だってここからがほんとの勝負だってたとえもし何が起こってもオレらがここに立っているよ',
  ruby: 'だいじょうぶきみはだいじょうぶだれかがきみをまっているよだいじょうぶきみはだいじょうぶそのきもちはわかっているよだいじょうぶきみはだいじょうぶだってここからがほんとのしょうぶだってたとえもしなにがおこってもおれらがここにたっているよ',
  lyric_with_ruby: '\{大丈夫,だいじょうぶ\}\{ ,\}\{君,きみ\}は\{大丈夫,だいじょうぶ\}\{ ,\}\{誰,だれ\}かが\{君,きみ\}を\{待っ,まっ\}ているよ\{ ,\}\{大丈夫,だいじょうぶ\}\{ ,\}\{君,きみ\}は\{大丈夫,だいじょうぶ\}\{ ,\}その\{気持ち,きもち\}は\{分かっ,わかっ\}ているよ\{ ,\}\{大丈夫,だいじょうぶ\}\{ ,\}\{君,きみ\}は\{大丈夫,だいじょうぶ\}だって\{ ,\}ここからがほんとの\{勝負,しょうぶ\}だって\{ ,\}たとえもし\{何,なに\}が\{起こっ,おこっ\}ても\{ ,\}\{オレ,おれ\}らがここに\{立っ,たっ\}ているよ\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'CUEZERO')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'Hey!壁に寄りかかりそっと休憩空を見上げれば走る流星あわてさけぶね無我夢中でこの思いを今すぐ手中へ目の前のこの現実を排除過去の栄光だけをすぐまた回想フッだめならダメでもともとだ見守り続けてくれるアイツこそが神がくれた一つの切り札また意地になってさ孤独に生きるなニヒルな顔で俺に手振る時につながるケーブルIt\'salright!迷いなんてもう無い築き上げてくぜ俺の将来It\'salright!この夢は超大奴がくれた力こそ膨大',
  ruby: 'へいかべによりかかりそっときゅうけいそらをみあげればはしるりゅうせいあわてさけぶねむがむちゅうでこのおもいをいますぐしゅちゅうへめのまえのこのげんじつをはいじょかこのえいこうだけをすぐまたかいそうふっだめならだめでもともとだみまもりつづけてくれるあいつこそがかみがくれたひとつのきりふだまたいじになってさこどくにいきるなにひるなかおでおれにてふるときにつながるけーぶるいっつおーるらいとまよいなんてもうないきずきあげてくぜおれのしょうらいいっつおーるらいとこのゆめはちょうだいやつがくれたちからこそぼうだい',
  lyric_with_ruby: '\{Hey,へい\}\{!,\}\{ ,\}\{壁,かべ\}に\{寄りかかり,よりかかり\}そっと\{休憩,きゅうけい\}\{ ,\}\{空,そら\}を\{見上げれ,みあげれ\}ば\{走る,はしる\}\{流星,りゅうせい\}\{ ,\}あわて\{ ,\}さけぶね\{無我夢中,むがむちゅう\}で\{ ,\}この\{思い,おもい\}を\{今,いま\}すぐ\{手中,しゅちゅう\}へ\{ ,\}\{目,め\}の\{前,まえ\}のこの\{現実,げんじつ\}を\{排除,はいじょ\}\{ ,\}\{過去,かこ\}の\{栄光,えいこう\}だけをすぐまた\{回想,かいそう\}\{ ,\}\{フッ,ふっ\}\{ ,\}だめなら\{ダメ,だめ\}でもともとだ\{ ,\}\{見守り,みまもり\}\{続け,つづけ\}てくれる\{アイツ,あいつ\}こそが\{ ,\}\{神,かみ\}がくれた\{一つ,ひとつ\}の\{切り札,きりふだ\}\{ ,\}また\{意地,いじ\}になってさ\{ ,\}\{孤独,こどく\}に\{生きる,いきる\}な\{ ,\}\{ニヒル,にひる\}な\{顔,かお\}で\{ ,\}\{俺,おれ\}に\{手,て\}\{振る,ふる\}\{時,とき\}につながる\{ケーブル,けーぶる\}\{ ,\}\{It\'s,いっつ\}\{ ,\}\{alright,おーるらいと\}\{!,\}\{ ,\}\{迷い,まよい\}なんてもう\{無い,ない\}\{ ,\}\{築き上げ,きずきあげ\}てくぜ\{俺,おれ\}の\{将来,しょうらい\}\{ ,\}\{It\'s,いっつ\}\{ ,\}\{alright,おーるらいと\}\{!,\}\{ ,\}この\{夢,ゆめ\}は\{超大,ちょうだい\}\{ ,\}\{奴,やつ\}がくれた\{力,ちから\}こそ\{膨大,ぼうだい\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '大丈夫君は大丈夫誰かが君を待っているよ大丈夫君は大丈夫その気持ちは分かっているよ大丈夫君は大丈夫だってここからがほんとの勝負だってたとえもし何が起こってもオレらがここに立っているよ',
  ruby: 'だいじょうぶきみはだいじょうぶだれかがきみをまっているよだいじょうぶきみはだいじょうぶそのきもちはわかっているよだいじょうぶきみはだいじょうぶだってここからがほんとのしょうぶだってたとえもしなにがおこってもおれらがここにたっているよ',
  lyric_with_ruby: '\{大丈夫,だいじょうぶ\}\{ ,\}\{君,きみ\}は\{大丈夫,だいじょうぶ\}\{ ,\}\{誰,だれ\}かが\{君,きみ\}を\{待っ,まっ\}ているよ\{ ,\}\{大丈夫,だいじょうぶ\}\{ ,\}\{君,きみ\}は\{大丈夫,だいじょうぶ\}\{ ,\}その\{気持ち,きもち\}は\{分かっ,わかっ\}ているよ\{ ,\}\{大丈夫,だいじょうぶ\}\{ ,\}\{君,きみ\}は\{大丈夫,だいじょうぶ\}だって\{ ,\}ここからがほんとの\{勝負,しょうぶ\}だって\{ ,\}たとえもし\{何,なに\}が\{起こっ,おこっ\}ても\{ ,\}\{オレ,おれ\}らがここに\{立っ,たっ\}ているよ\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '大丈夫君は大丈夫誰かが君を待っているよ大丈夫君は大丈夫その気持ちは分かっているよ大丈夫君は大丈夫だってここからがほんとの勝負だってたとえもし何が起こってもオレらがここに立っているよ',
  ruby: 'だいじょうぶきみはだいじょうぶだれかがきみをまっているよだいじょうぶきみはだいじょうぶそのきもちはわかっているよだいじょうぶきみはだいじょうぶだってここからがほんとのしょうぶだってたとえもしなにがおこってもおれらがここにたっているよ',
  lyric_with_ruby: '\{大丈夫,だいじょうぶ\}\{ ,\}\{君,きみ\}は\{大丈夫,だいじょうぶ\}\{ ,\}\{誰,だれ\}かが\{君,きみ\}を\{待っ,まっ\}ているよ\{ ,\}\{大丈夫,だいじょうぶ\}\{ ,\}\{君,きみ\}は\{大丈夫,だいじょうぶ\}\{ ,\}その\{気持ち,きもち\}は\{分かっ,わかっ\}ているよ\{ ,\}\{大丈夫,だいじょうぶ\}\{ ,\}\{君,きみ\}は\{大丈夫,だいじょうぶ\}だって\{ ,\}ここからがほんとの\{勝負,しょうぶ\}だって\{ ,\}たとえもし\{何,なに\}が\{起こっ,おこっ\}ても\{ ,\}\{オレ,おれ\}らがここに\{立っ,たっ\}ているよ\{ ,\}',
  lyric_order: 5,
)

