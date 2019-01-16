# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

artist =
Artist.create(
    name: 'UL'
)

cd =
Cd.create(
    name: 'ULTRAP',
    released_at: '2014-03-07'
)

lyrUrl =
LyricUrl.create(
    url: 'https://www.utamap.com/showkasi.php?surl=k-140305-145',
    lyric_website_id: LyricWebsite.find_by(name: 'うたまっぷ').id
)

song =
Song.create(
    lyric_url_id: lyrUrl.id,
    name: 'UL-TRAP',
    lyricist: 'MCU & LITTLE',
    composer: 'MCU, LITTLE & KREVA',
    arranger: 'KREVA',
    cd_id: cd.id,
    artist_id: artist.id
)

CdSong.create(
    cd_id: cd.id,
    song_id: song.id
)

LyricUrlSong.create(
    lyric_url_id: lyrUrl.id,
    song_id: song.id
)

Lyric.create(
    song_id: song.id,
    singer_id: Singer.find_by(name: 'MCU').id,
    lyric_type_id: LyricType.find_by(name: 'VERSE').id,
    part_lyric_order: 1,
    lyric: '近頃世間は情報噂の宝庫ぼーっとしてちゃ遅れちゃう今日も証拠もなしに預言者たちは垂れ流す曖昧な想像最近僕らの住む街ではいろいろな物がたりねんだだから欲しい飾りじゃなく心を満たす優しさが今届けたい響かしたい抱きしめたいでも君がいないなんて事にならないよーに自分以上にあなた以上に(un)お互いの心に勇気愛はそこら中にまるで空気ほっぺたつねって確かめよう道は続いてる明日へと',
    ruby: 'ちかごろせけんはじょうほううわさのほうこぼーっとしてちゃおくれちゃうきょうもしょうこもなしによげんしゃたちはたれながすあいまいなそうぞうさいきんぼくらのすむまちではいろいろなものがたりねんだだからほしいかざりじゃなくこころをみたすやさしさがいまとどけたいひびかしたいだきしめたいでもきみがいないなんてことにならないよーにじぶんいじょうにあなたいじょうにうんおたがいのこころにゆうきあいはそこらじゅうにまるでくうきほっぺたつねってたしかめようみちはつづいてるあしたへと',
    lyric_with_ruby: '\{近頃,ちかごろ\}\{ ,\}\{世間,せけん\}は\{情報,じょうほう\}\{ ,\}\{噂,うわさ\}の\{宝庫,ほうこ\}\{ ,\}ぼーっとしてちゃ\{遅れ,おくれ\}ちゃう\{今日,きょう\}も\{ ,\}\{証拠,しょうこ\}もなしに\{預言,よげん\}\{者,しゃ\}たちは\{ ,\}\{垂れ,たれ\}\{流す,ながす\}\{曖昧,あいまい\}な\{想像,そうぞう\}\{ ,\}\{最近,さいきん\}\{ ,\}\{僕ら,ぼくら\}の\{住む,すむ\}\{街,まち\}では\{ ,\}いろいろな\{物,もの\}がたりねんだ\{ ,\}だから\{欲しい,ほしい\}\{飾り,かざり\}じゃなく\{ ,\}\{心,こころ\}を\{満たす,みたす\}\{優し,やさし\}さが\{ ,\}\{今,いま\}\{ ,\}\{届け,とどけ\}たい\{ ,\}\{響かし,ひびかし\}たい\{ ,\}\{抱きしめ,だきしめ\}たい\{ ,\}でも\{君,きみ\}がいない\{ ,\}なんて\{事,こと\}にならないよーに\{ ,\}\{自分,じぶん\}\{以上,いじょう\}に\{ ,\}あなた\{以上,いじょう\}に\{ ,\}\{(,\}\{un,うん\}\{),\}\{ ,\}\{お互い,おたがい\}の\{心,こころ\}に\{勇気,ゆうき\}\{ ,\}\{愛,あい\}はそこら\{中,じゅう\}にまるで\{空気,くうき\}\{ ,\}ほっぺたつねって\{確かめよ,たしかめよ\}う\{ ,\}\{道,みち\}は\{続い,つづい\}てる\{ ,\}\{明日,あした\}へと\{ ,\}',
    lyric_order: 1
)

Lyric.create(
    song_id: song.id,
    singer_id: Singer.find_by(name: 'LITTLE').id,
    lyric_type_id: LyricType.find_by(name: 'VERSE').id,
    part_lyric_order: 2,
    lyric: '目を閉じて耳を塞いでこの手をこうして君と繋いでる明日より確かちゃんとしてる明日より間近ちゃんと知ってるよ今ここにいる事実信じるならそれは明日も生きる',
    ruby: 'めをとじてみみをふさいでこのてをこうしてきみとつないでるあしたよりたしかちゃんとしてるあしたよりまじかちゃんとしってるよいまここにいるじじつしんじるならそれはあしたもいきる',
    lyric_with_ruby: '\{目,め\}を\{閉じ,とじ\}て\{ ,\}\{耳,みみ\}を\{塞い,ふさい\}で\{ ,\}この\{手,て\}をこうして\{ ,\}\{君,きみ\}と\{繋い,つない\}でる\{ ,\}\{明日,あした\}より\{確か,たしか\}\{ ,\}ちゃんとしてる\{ ,\}\{明日,あした\}より\{間近,まじか\}\{ ,\}ちゃんと\{知っ,しっ\}てるよ\{ ,\}\{今,いま\}ここにいる\{事実,じじつ\}\{ ,\}\{信じる,しんじる\}なら\{ ,\}それは\{明日,あした\}も\{生きる,いきる\}\{ ,\}',
    lyric_order: 2
)
