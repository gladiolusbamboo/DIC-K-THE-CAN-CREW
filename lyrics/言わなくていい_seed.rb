artist_name =    ''
lyricUrl_url =   ''
cd_name =        ''
cd_released_at = ''
song_name =      ''
song_lyricist =  ''
song_composer =  ''
song_arranger =  ''
cds_name = []

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
  artist_id: artist.id
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
  lyric: '言わなくていい言わなくていい俺たちが真のMCだなんて言わなくていい言わなくていい',
  ruby: 'いわなくていいいわなくていいおれたちがしんのえむしーだなんていわなくていいいわなくていい',
  lyric_with_ruby: '\{言わ,いわ\}なくていい\{ ,\}\{言わ,いわ\}なくていい\{ ,\}\{俺,おれ\}たちが\{真,しん\}の\{MC,えむしー\}だなんて\{ ,\}\{言わ,いわ\}なくていい\{ ,\}\{言わ,いわ\}なくていい\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '言わなくていい言わなくていい俺たちが真のMCだなんて言わなくていい言わなくていい',
  ruby: 'いわなくていいいわなくていいおれたちがしんのえむしーだなんていわなくていいいわなくていい',
  lyric_with_ruby: '\{言わ,いわ\}なくていい\{ ,\}\{言わ,いわ\}なくていい\{ ,\}\{俺,おれ\}たちが\{真,しん\}の\{MC,えむしー\}だなんて\{ ,\}\{言わ,いわ\}なくていい\{ ,\}\{言わ,いわ\}なくていい\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'CUEZERO')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '猛烈な嵐の中舞い降りた不利にある戦況にややたじろいだ吹き荒れる風を受けて飛び出す降りしきる雨で体を癒すいいぞ史上最強を未知から伝導戦闘機西田暴れん坊光史が高く産声を上げた生きるための糧を高く掲げた左の羽に彫った文字次々と敵機を打ち取ったのち刻み込んでく俺のカラダ誇り高き勲章は宝目指すそれらの的悪人ヅラったく品すら感じられ無く陳腐なアイデア相手は俺なのに最低な武器で挑みこづきゃ泣いてら優秀に吸収し集中し空中で織り成すオーケストラあぁバイファー・ザ・ドーペストだ韋駄天と組んだ鋼鉄の輪',
  ruby: 'もうれつなあらしのなかまいおりたふりにあるせんきょうにややたじろいだふきあれるかぜをうけてとびだすふりしきるあめでからだをいやすいいぞしじょうさいきょうをみちからでんどうせんとうきにしだあばれんぼうこうじがたかくうぶごえをあげたいきるためのかてをたかくかかげたひだりのはねにほったもじつぎつぎとてききをうちとったのちきざみこんでくおれのからだほこりたかきくんしょうはたからめざすそれらのまとあくにんづらったくひんすらかんじられなくちんぷなあいでああいてはおれなのにさいていなぶきでいどみこづきゃないてらゆうしゅうにきゅうしゅうししゅうちゅうしくうちゅうでおりなすおーけすとらあぁだいだてんとくんだこうてつのわ',
  lyric_with_ruby: '\{猛烈,もうれつ\}な\{嵐,あらし\}の\{中,なか\}\{舞い降り,まいおり\}た\{ ,\}\{不利,ふり\}にある\{戦況,せんきょう\}にややたじろいだ\{ ,\}\{吹き荒れる,ふきあれる\}\{風,かぜ\}を\{受け,うけ\}て\{飛び出す,とびだす\}\{ ,\}\{降りしきる,ふりしきる\}\{雨,あめ\}で\{体,からだ\}を\{癒す,いやす\}\{ ,\}いいぞ\{ ,\}\{史上,しじょう\}\{最強,さいきょう\}を\{未知,みち\}から\{伝導,でんどう\}\{ ,\}\{戦闘,せんとう\}\{機,き\}\{ ,\}\{西田,にしだ\}\{ ,\}\{暴れん,あばれん\}\{坊,ぼう\}\{ ,\}\{光史,こうじ\}が\{高く,たかく\}\{産声,うぶごえ\}を\{上げ,あげ\}た\{ ,\}\{生きる,いきる\}ための\{糧,かて\}を\{高く,たかく\}\{掲げ,かかげ\}た\{ ,\}\{左,ひだり\}の\{羽,はね\}に\{彫っ,ほっ\}た\{文字,もじ\}\{ ,\}\{次々,つぎつぎ\}と\{敵,てき\}\{機,き\}を\{打ち取っ,うちとっ\}たのち\{ ,\}\{刻み込ん,きざみこん\}でく\{俺,おれ\}の\{カラダ,からだ\}\{ ,\}\{誇り,ほこり\}\{高き,たかき\}\{勲章,くんしょう\}は\{宝,たから\}\{ ,\}\{目指す,めざす\}それらの\{的,まと\}\{ ,\}\{悪人,あくにん\}\{ヅラ,づら\}\{ ,\}ったく\{品,ひん\}すら\{感じ,かんじ\}られ\{無く,なく\}\{ ,\}\{陳腐,ちんぷ\}な\{アイデア,あいであ\}\{ ,\}\{相手,あいて\}は\{俺,おれ\}なのに\{ ,\}\{最低,さいてい\}な\{武器,ぶき\}で\{挑み,いどみ\}\{ ,\}こづきゃ\{ ,\}\{泣い,ない\}てら\{ ,\}\{優秀,ゆうしゅう\}に\{吸収,きゅうしゅう\}し\{ ,\}\{集中,しゅうちゅう\}し\{空中,くうちゅう\}で\{織り成す,おりなす\}\{オーケストラ,おーけすとら\}\{ ,\}あぁ\{ ,\}\{バイファー・ザ・ドーペスト,\}だ\{ ,\}\{韋駄,いだ\}\{天,てん\}と\{組ん,くん\}だ\{鋼鉄,こうてつ\}の\{輪,わ\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '言わなくていい言わなくていい俺たちが真のMCだなんて言わなくていい言わなくていい',
  ruby: 'いわなくていいいわなくていいおれたちがしんのえむしーだなんていわなくていいいわなくていい',
  lyric_with_ruby: '\{言わ,いわ\}なくていい\{ ,\}\{言わ,いわ\}なくていい\{ ,\}\{俺,おれ\}たちが\{真,しん\}の\{MC,えむしー\}だなんて\{ ,\}\{言わ,いわ\}なくていい\{ ,\}\{言わ,いわ\}なくていい\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: '言わなくていい言わなくていい俺たちが真のMCだなんて言わなくていい言わなくていい',
  ruby: 'いわなくていいいわなくていいおれたちがしんのえむしーだなんていわなくていいいわなくていい',
  lyric_with_ruby: '\{言わ,いわ\}なくていい\{ ,\}\{言わ,いわ\}なくていい\{ ,\}\{俺,おれ\}たちが\{真,しん\}の\{MC,えむしー\}だなんて\{ ,\}\{言わ,いわ\}なくていい\{ ,\}\{言わ,いわ\}なくていい\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'OnefortheBeats,TwofortheRhymeあったり前だけど今おさらいこの場所でこそ再確認だって閉じる暇もない開いた口どうなってんの本末転倒なライムしなくちゃ現状打開しょうが無いじゃ蒔いた文化の種もちょっと芽を出した程度(ケツの一文字合わせが「韻を踏む」?)そんな横暴極まりないことが堂々と横行数も相当もうどうすりゃいいの?探す方法溜まるフラストレーションまるで絡み合った二つの迷路勘違いも判らないスゲーおめでたい奴等「HaveaniceDay!」',
  ruby: 'わんふぉーざびーつつーふぉーざらいむあったりまえだけどいまおさらいこのばしょでこそさいかくにんだってとじるひまもないあいたくちどうなってんのほんまつてんとうならいむしなくちゃげんじょうだかいしょうがないじゃまいたぶんかのたねもちょっとめをだしたていどけつのひともじあわせがいんをふむそんなおうぼうきわまりないことがどうどうとおうこうかずもそうとうもうどうすりゃいいのさがすほうほうたまるふらすとれーしょんまるでからみあったふたつのめいろかんちがいもわからないすげーおめでたいやつらはぶあないすでー',
  lyric_with_ruby: '\{One,わん\}\{ ,\}\{for,ふぉー\}\{ ,\}\{the,ざ\}\{ ,\}\{Beats,びーつ\}\{,,\}\{ ,\}\{Two,つー\}\{ ,\}\{for,ふぉー\}\{ ,\}\{the,ざ\}\{ ,\}\{Rhyme,らいむ\}\{ ,\}あったり\{前,まえ\}だけど\{今,いま\}おさらい\{ ,\}この\{場所,ばしょ\}でこそ\{再,さい\}\{確認,かくにん\}\{ ,\}だって\{閉じる,とじる\}\{暇,ひま\}もない\{開い,あい\}た\{口,くち\}\{ ,\}どうなってんの\{ ,\}\{本末転倒,ほんまつてんとう\}な\{ライム,らいむ\}\{ ,\}しなくちゃ\{現状,げんじょう\}\{打開,だかい\}\{ ,\}しょうが\{無い,ない\}じゃ\{ ,\}\{蒔い,まい\}た\{文化,ぶんか\}の\{種,たね\}も\{ ,\}ちょっと\{芽,め\}を\{出し,だし\}た\{程度,ていど\}\{ ,\}\{(,\}\{ケツ,けつ\}の\{一文字,ひともじ\}\{合わせ,あわせ\}が\{「,\}\{韻,いん\}を\{踏む,ふむ\}\{」,\}\{?),\}\{ ,\}そんな\{ ,\}\{横暴,おうぼう\}\{極まりない,きわまりない\}ことが\{ ,\}\{堂々,どうどう\}と\{横行,おうこう\}\{ ,\}\{数,かず\}も\{相当,そうとう\}\{ ,\}もう\{ ,\}どうすりゃいいの\{?,\}\{ ,\}\{探す,さがす\}\{方法,ほうほう\}\{ ,\}\{溜まる,たまる\}\{フラストレーション,ふらすとれーしょん\}\{ ,\}まるで\{絡み合っ,からみあっ\}た\{二つ,ふたつ\}の\{迷路,めいろ\}\{ ,\}\{勘違い,かんちがい\}も\{判ら,わから\}ない\{スゲー,すげー\}おめでたい\{奴等,やつら\}\{ ,\}\{「,\}\{Have,はぶ\}\{ ,\}\{a,あ\}\{ ,\}\{nice,ないす\}\{ ,\}\{Day,でー\}\{!」,\}\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 5,
  lyric: '言わなくていい言わなくていい俺たちが真のMCだなんて言わなくていい言わなくていい',
  ruby: 'いわなくていいいわなくていいおれたちがしんのえむしーだなんていわなくていいいわなくていい',
  lyric_with_ruby: '\{言わ,いわ\}なくていい\{ ,\}\{言わ,いわ\}なくていい\{ ,\}\{俺,おれ\}たちが\{真,しん\}の\{MC,えむしー\}だなんて\{ ,\}\{言わ,いわ\}なくていい\{ ,\}\{言わ,いわ\}なくていい\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 6,
  lyric: '言わなくていい言わなくていい俺たちが真のMCだなんて言わなくていいみんな分かってる',
  ruby: 'いわなくていいいわなくていいおれたちがしんのえむしーだなんていわなくていいみんなわかってる',
  lyric_with_ruby: '\{言わ,いわ\}なくていい\{ ,\}\{言わ,いわ\}なくていい\{ ,\}\{俺,おれ\}たちが\{真,しん\}の\{MC,えむしー\}だなんて\{ ,\}\{言わ,いわ\}なくていい\{ ,\}みんな\{分かっ,わかっ\}てる\{ ,\}',
  lyric_order: 8,
)

