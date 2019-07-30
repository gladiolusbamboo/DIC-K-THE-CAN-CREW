artist_name =    'BY PHAR THE DOPEST'
lyricUrl_url =   'https://www.utamap.com/showkasi.php?surl=B20393'
cd_name =        'だからどうした!'
cd_released_at = '2006-12-31'
song_name =      '1976のノイズ'
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

singer = Singer.find_by(name: 'CUEZERO')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '1976へ逆のぼるフレッシュなやつキュウからフォーユー生誕30周年記念シット自問自答で脳内念視レンジでチンして3分サッと温め届けるサンプル農薬じゃないライム散布ビガッ!エローン話のアンサンブルアナログもデジタル化たどるカタログだって電波が型取るはかどるかな!?トーク赤毛布でかわすマタドール坊主頭の30オレが死ぬまで地球はあと何周もう一丁サンキュー!Dr俺らの生まれたあの時代のヒューマンエナジーにビガッ!!',
  ruby: 'いちきゅうななろくへさかのぼるふれっしゅなやつきゅうからふぉーゆーせいたんさんじゅっしゅうねんきねんしっとじもんじとうでのうないねんしれんじでちんしてさんぷんさっとあっためとどけるさんぷるのうやくじゃないらいむさんぷびがっえろーんはなしのあんさんぶるあなろぐもでじたるかたどるかたろぐだってでんぱがかたどるはかどるかなとーくあかもうふでかわすまたどーるぼうずあたまのさんじゅうおれがしぬまでちきゅうはあとなんしゅうもういっちょうさんきゅーどくたーおれらのうまれたあのじだいのひゅーまんえなじーにびがっ',
  lyric_with_ruby: '\{1976,いちきゅうななろく\}へ\{逆,さか\}のぼる\{ ,\}\{フレッシュ,ふれっしゅ\}なやつ\{キュウ,きゅう\}から\{フォーユー,ふぉーゆー\}\{ ,\}\{生誕,せいたん\}\{30,さんじゅっ\}\{周年,しゅうねん\}\{記念,きねん\}\{シット,しっと\}\{ ,\}\{自問自答,じもんじとう\}で\{脳,のう\}\{内,ない\}\{念,ねん\}\{視,し\}\{ ,\}\{レンジ,れんじ\}で\{チン,ちん\}して\{3,さん\}\{分,ぷん\}\{ ,\}\{サッと,さっと\}\{温め,あっため\}\{届ける,とどける\}\{サンプル,さんぷる\}\{ ,\}\{農薬,のうやく\}じゃない\{ライム,らいむ\}\{散布,さんぷ\}\{ ,\}\{ビガッ,びがっ\}\{!,\}\{エローン,えろーん\}\{ ,\}\{話,はなし\}の\{アンサンブル,あんさんぶる\}\{ ,\}\{アナログ,あなろぐ\}も\{デジタル,でじたる\}\{化,か\}たどる\{ ,\}\{カタログ,かたろぐ\}だって\{ ,\}\{電波,でんぱ\}が\{型,かた\}\{取る,どる\}\{ ,\}はかどるかな\{!?,\}\{トーク,とーく\}\{ ,\}\{赤,あか\}\{毛布,もうふ\}でかわす\{マタドール,またどーる\}\{ ,\}\{坊主,ぼうず\}\{頭,あたま\}の\{30,さんじゅう\}\{ ,\}\{オレ,おれ\}が\{死ぬ,しぬ\}まで\{地球,ちきゅう\}はあと\{何,なん\}\{周,しゅう\}\{ ,\}もう\{一丁,いっちょう\}\{ ,\}\{サンキュー,さんきゅー\}\{!,\}\{ ,\}\{Dr,どくたー\}\{ ,\}\{俺,おれ\}らの\{生まれ,うまれ\}た\{ ,\}あの\{時代,じだい\}の\{ヒューマン,ひゅーまん\}\{エナジー,えなじー\}に\{ビガッ,びがっ\}\{!!,\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'ちりばめた1と9と7と6のノイズステレオ(あなたの心に)ちりばめた1と9と7と6のノイズステレオ(あなたの心に)',
  ruby: 'ちりばめたいちときゅうとななとろくののいずすてれおあなたのこころにちりばめたいちときゅうとななとろくののいずすてれおあなたのこころに',
  lyric_with_ruby: 'ちりばめた\{1,いち\}と\{9,きゅう\}と\{7,なな\}と\{6,ろく\}の\{ノイズ,のいず\}\{ ,\}\{ステレオ,すてれお\}\{(,\}あなたの\{心,こころ\}に\{),\}\{ ,\}ちりばめた\{1,いち\}と\{9,きゅう\}と\{7,なな\}と\{6,ろく\}の\{ノイズ,のいず\}\{ ,\}\{ステレオ,すてれお\}\{(,\}あなたの\{心,こころ\}に\{),\}\{ ,\}',
  lyric_order: 2,
)

