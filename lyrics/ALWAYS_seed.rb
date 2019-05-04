artist_name =    ''
lyricUrl_url =   ''
cd_name =        ''
cd_released_at = ''
song_name =      ''
song_lyricist =  ''
song_composer =  ''
song_arranger =  ''
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
  lyric: '確かな気持ちがこの胸にある限り一人じゃないがこの部屋に君が残した跡が記憶をあの日に戻した飲みかけのジュースの空き缶がハッキリと物語るはにかんだ笑顔がまた浮かぶ交差する思いが時に逆らうようだあの日二人確かそう堅い約束を交わした今日は横に君がいない以外一切変わりはしない未来に対し堅く誓った思いはこの時までにつちかった素直な気持ちのまま変わらないから離さないから',
  ruby: 'たしかなきもちがこのむねにあるかぎりひとりじゃないがこのへやにきみがのこしたあとがきおくをあのひにもどしたのみかけのじゅーすのあきかんがはっきりとものがたるはにかんだえがおがまたうかぶこうさするおもいがときにさからうようだあのひふたりたしかそうかたいやくそくをかわしたきょうはよこにきみがいないいがいいっさいかわりはしないみらいにたいしかたくちかったおもいはこのときまでにつちかったすなおなきもちのままかわらないからはなさないから',
  lyric_with_ruby: '\{確か,たしか\}な\{気持ち,きもち\}が\{ ,\}この\{胸,むね\}にある\{限り,かぎり\}\{ ,\}\{一人,ひとり\}じゃないが\{ ,\}この\{部屋,へや\}に\{君,きみ\}が\{残し,のこし\}た\{跡,あと\}が\{ ,\}\{記憶,きおく\}をあの\{日,ひ\}に\{戻し,もどし\}た\{ ,\}\{飲み,のみ\}かけの\{ ,\}\{ジュース,じゅーす\}の\{空き缶,あきかん\}が\{ ,\}\{ハッキリ,はっきり\}と\{物語る,ものがたる\}\{ ,\}はにかんだ\{笑顔,えがお\}がまた\{浮かぶ,うかぶ\}\{ ,\}\{交差,こうさ\}する\{思い,おもい\}が\{時に,ときに\}\{逆らう,さからう\}ようだ\{ ,\}あの\{日,ひ\}\{ ,\}\{二人,ふたり\}\{ ,\}\{確か,たしか\}そう\{堅い,かたい\}\{約束,やくそく\}を\{交わし,かわし\}た\{ ,\}\{今日,きょう\}は\{横,よこ\}に\{君,きみ\}がいない\{以外,いがい\}\{一切,いっさい\}\{変わり,かわり\}はしない\{ ,\}\{未来,みらい\}\{に対し,にたいし\}\{堅く,かたく\}\{誓っ,ちかっ\}た\{思い,おもい\}は\{ ,\}この\{時,とき\}までにつちかった\{素直,すなお\}な\{気持ち,きもち\}のまま\{ ,\}\{変わら,かわら\}ないから\{ ,\}\{離さ,はなさ\}ないから\{ ,\}',
  lyric_order: 1,
)

