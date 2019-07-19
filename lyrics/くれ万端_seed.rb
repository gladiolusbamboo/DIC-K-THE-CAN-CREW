artist_name =    'BY PHAR THE DOPEST'
lyricUrl_url =   'https://www.utamap.com/showkasi.php?surl=B20388'
cd_name =        'だからどうした!'
cd_released_at = '2006-12-31'
song_name =      'くれ万端'
song_lyricist =  'BY PHAR THE DOPEST'
song_composer =  'BY PHAR THE DOPEST'
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
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'タイの仏様みたいにリクライニンそんなフローで優しくライミン君の耳から進入開始あ～こりゃ著しく斬新Hey世の中の男子女子パーティーの最中に感極まって泣き出したりしちゃう歌詞出しちゃうぜもしかしたらもしかしちゃう短期集中ヴァイブス注入その実力を発揮する十中八九すぐラップ尽きない言葉のスクラップブック約束すぐ破る甘ちゃんはシカトでマイペースキープ競馬のことはあんましんないが余裕でつける3馬身差',
  ruby: 'たいのほとけさまみたいにりくらいにんそんなふろーでやさしくらいみんきみのみみからしんにゅうかいしあーこりゃいちじるしくざんしんへいよのなかのだんしじょしぱーてぃーのさいちゅうにかんきわまってなきだしたりしちゃうかしだしちゃうぜもしかしたらもしかしちゃうたんきしゅうちゅうゔぁいぶすちゅうにゅうそのじつりょくをはっきするじゅっちゅうはっくすぐらっぷつきないことばのすくらっぷぶっくやくそくすぐやぶるあまちゃんはしかとでまいぺーすきーぷけいばのことはあんましんないがよゆうでつけるさんばしんさ',
  lyric_with_ruby: '\{タイ,たい\}の\{仏,ほとけ\}\{様,さま\}みたいに\{リクライニン,りくらいにん\}\{ ,\}そんな\{フロー,ふろー\}で\{優しく,やさしく\}\{ライ,らい\}\{ミン,みん\}\{ ,\}\{君,きみ\}の\{耳,みみ\}から\{進入,しんにゅう\}\{開始,かいし\}\{ ,\}あ\{～,ー\}こりゃ\{著しく,いちじるしく\}\{斬新,ざんしん\}\{ ,\}\{Hey,へい\}\{ ,\}\{世の中,よのなか\}の\{男子,だんし\}\{ ,\}\{女子,じょし\}\{ ,\}\{パーティー,ぱーてぃー\}の\{最中,さいちゅう\}に\{感極まっ,かんきわまっ\}て\{ ,\}\{泣き,なき\}\{出し,だし\}たりしちゃう\{歌詞,かし\}\{出し,だし\}ちゃうぜ\{ ,\}もしかしたら\{ ,\}もしかしちゃう\{ ,\}\{短期,たんき\}\{集中,しゅうちゅう\}\{ ,\}\{ヴァイ,ゔぁい\}\{ブス,ぶす\}\{注入,ちゅうにゅう\}\{ ,\}その\{実力,じつりょく\}を\{発揮,はっき\}する\{ ,\}\{十中八九,じゅっちゅうはっく\}\{ ,\}すぐ\{ラップ,らっぷ\}\{ ,\}\{尽き,つき\}ない\{言葉,ことば\}の\{スクラップブック,すくらっぷぶっく\}\{ ,\}\{約束,やくそく\}すぐ\{破る,やぶる\}\{ ,\}\{甘,あま\}ちゃんは\{シカト,しかと\}で\{マイペース,まいぺーす\}\{キープ,きーぷ\}\{ ,\}\{競馬,けいば\}のことはあんましんないが\{ ,\}\{余裕,よゆう\}でつける\{3,さん\}\{馬身,ばしん\}\{差,さ\}\{ ,\}',
  lyric_order: 1,
)

Singer.create(
  name: 'CUEZERO & 天狗?',
  is_kick: false
)


singer = Singer.find_by(name: 'CUEZERO & 天狗?')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '速いペースが飽きないペースそのマイペースがマジ大切吐いて捨てる程ある言葉の配列、奪うパイレーツ',
  ruby: 'はやいぺーすがあきないぺーすそのまいぺーすがまじたいせつはいてすてるほどあることばのはいれつうばうぱいれーつ',
  lyric_with_ruby: '\{速い,はやい\}\{ペース,ぺーす\}が\{飽き,あき\}ない\{ペース,ぺーす\}\{ ,\}その\{マイペース,まいぺーす\}が\{マジ,まじ\}\{大切,たいせつ\}\{ ,\}\{吐い,はい\}て\{捨てる,すてる\}\{程,ほど\}ある\{言葉,ことば\}の\{配列,はいれつ\}\{、,\}\{奪う,うばう\}\{パイレーツ,ぱいれーつ\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'CUEZERO & 天狗?')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '長いレースに負けない秘訣その回転数慌てないです自分と対決で解決!示す最大係数',
  ruby: 'ながいれーすにまけないひけつそのかいてんすうあわてないですじぶんとたいけつでかいけつしめすさいだいけいすう',
  lyric_with_ruby: '\{長い,ながい\}\{レース,れーす\}に\{負け,まけ\}ない\{秘訣,ひけつ\}\{ ,\}その\{回転,かいてん\}\{数,すう\}\{慌て,あわて\}ないです\{ ,\}\{自分,じぶん\}と\{対決,たいけつ\}で\{解決,かいけつ\}\{!,\}\{示す,しめす\}\{最大,さいだい\}\{係数,けいすう\}\{ ,\}',
  lyric_order: 3,
)

