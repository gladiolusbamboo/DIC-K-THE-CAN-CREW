artist_name =    'KREVA'
lyricUrl_url =   nil
cd_name =        'AFTERMIXTAPE'
cd_released_at = '2019-09-18'
song_name =      'もしかしない'
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
  lyric: 'もしかして…いや、もしかしない君は君しかいないただ先延ばしにしても何も変わらないんですもしかして…いや、もしかしない君が自分でやるしかない終わらせることだけを考えてごまかさないでいて',
  ruby: 'もしかしていやもしかしないきみはきみしかいないたださきのばしにしてもなにもかわらないんですもしかしていやもしかしないきみがじぶんでやるしかないおわらせることだけをかんがえてごまかさないでいて',
  lyric_with_ruby: 'もしかして\{…,\}いや\{、,\}もしかしない\{ ,\}\{君,きみ\}は\{君,きみ\}しかいない\{ ,\}ただ\{先,さき\}\{延ばし,のばし\}にしても\{何,なに\}も\{変わら,かわら\}ないんです\{ ,\}もしかして\{…,\}いや\{、,\}もしかしない\{ ,\}\{君,きみ\}が\{自分,じぶん\}でやるしかない\{ ,\}\{終わら,おわら\}せることだけを\{考え,かんがえ\}て\{ ,\}ごまかさないでいて\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'もしかして…いや、もしかしないやらなけりゃ終わりはしない誰かがいつの間に片付けしておいてくれたらってわかるけどそれはないんだ残念ながら黙ってそこに座っていたまま待っていたっていいわけない無駄なことないってのは言い訳さタイミングが来るのを待つな自分で作り出すんだあのねあのねって話そらす暇あったら先にやって後で遊べ',
  ruby: 'もしかしていやもしかしないやらなけりゃおわりはしないだれかがいつのまにかたづけしておいてくれたらってわかるけどそれはないんだざんねんながらだまってそこにすわっていたまままっていたっていいわけないむだなことないってのはいいわけさたいみんぐがくるのをまつなじぶんでつくりだすんだあのねあのねってはなしそらすひまあったらさきにやってあとであそべ',
  lyric_with_ruby: 'もしかして\{…,\}いや\{、,\}もしかしない\{ ,\}やらなけりゃ\{終わり,おわり\}はしない\{ ,\}\{誰,だれ\}かが\{いつの間に,いつのまに\}\{片付け,かたづけ\}\{ ,\}しておいてくれたらってわかるけど\{ ,\}それはないんだ\{ ,\}\{残念,ざんねん\}ながら\{ ,\}\{黙っ,だまっ\}てそこに\{座っ,すわっ\}ていたまま\{ ,\}\{待っ,まっ\}ていたっていいわけない\{ ,\}\{無駄,むだ\}なことないってのは\{言い訳,いいわけ\}さ\{ ,\}\{タイミング,たいみんぐ\}が\{来る,くる\}のを\{待つ,まつ\}な\{ ,\}\{自分,じぶん\}で\{作り出す,つくりだす\}んだ\{ ,\}あのねあのね\{ ,\}って\{話,はなし\}そらす\{暇,ひま\}あったら\{ ,\}\{先,さき\}にやって\{ ,\}\{後で,あとで\}\{遊べ,あそべ\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'もしかして…いや、もしかしない君は君しかいないただ先延ばしにしても何も変わらないんですもしかして…いや、もしかしない君が自分でやるしかない終わらせることだけを考えてごまかさないでいて',
  ruby: 'もしかしていやもしかしないきみはきみしかいないたださきのばしにしてもなにもかわらないんですもしかしていやもしかしないきみがじぶんでやるしかないおわらせることだけをかんがえてごまかさないでいて',
  lyric_with_ruby: 'もしかして\{…,\}いや\{、,\}もしかしない\{ ,\}\{君,きみ\}は\{君,きみ\}しかいない\{ ,\}ただ\{先,さき\}\{延ばし,のばし\}にしても\{何,なに\}も\{変わら,かわら\}ないんです\{ ,\}もしかして\{…,\}いや\{、,\}もしかしない\{ ,\}\{君,きみ\}が\{自分,じぶん\}でやるしかない\{ ,\}\{終わら,おわら\}せることだけを\{考え,かんがえ\}て\{ ,\}ごまかさないでいて\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '目が覚めても自分は自分片付いてなきゃ沈んだ気分うるさい奴だって憎んでますか気持ちわかるがいずれわかるさやるべきことを後回しにし続けるのはかっこ悪い',
  ruby: 'めがさめてもじぶんはじぶんかたづいてなきゃしずんだきぶんうるさいやつだってにくんでますかきもちわかるがいずれわかるさやるべきことをあとまわしにしつづけるのはかっこわるい',
  lyric_with_ruby: '\{目,め\}が\{覚め,さめ\}ても\{ ,\}\{自分,じぶん\}は\{自分,じぶん\}\{ ,\}\{片付い,かたづい\}てなきゃ\{ ,\}\{沈ん,しずん\}だ\{気分,きぶん\}\{ ,\}うるさい\{奴,やつ\}だって\{ ,\}\{憎ん,にくん\}でますか\{ ,\}\{気持ち,きもち\}わかるが\{ ,\}いずれわかるさ\{ ,\}やるべきことを\{ ,\}\{後回し,あとまわし\}にし\{続ける,つづける\}のはかっこ\{悪い,わるい\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'もしかして…いや、もしかしない君は君しかいないただ先延ばしにしても何も変わらないんですもしかして…いや、もしかしない君が自分でやるしかない終わらせることだけを考えてごまかさないでいて',
  ruby: 'もしかしていやもしかしないきみはきみしかいないたださきのばしにしてもなにもかわらないんですもしかしていやもしかしないきみがじぶんでやるしかないおわらせることだけをかんがえてごまかさないでいて',
  lyric_with_ruby: 'もしかして\{…,\}いや\{、,\}もしかしない\{ ,\}\{君,きみ\}は\{君,きみ\}しかいない\{ ,\}ただ\{先,さき\}\{延ばし,のばし\}にしても\{何,なに\}も\{変わら,かわら\}ないんです\{ ,\}もしかして\{…,\}いや\{、,\}もしかしない\{ ,\}\{君,きみ\}が\{自分,じぶん\}でやるしかない\{ ,\}\{終わら,おわら\}せることだけを\{考え,かんがえ\}て\{ ,\}ごまかさないでいて\{ ,\}',
  lyric_order: 5,
)

