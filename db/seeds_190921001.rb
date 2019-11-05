artist_name =    'KREVA'
lyricUrl_url =   nil
cd_name =        'AFTERMIXTAPE'
cd_released_at = '2019-09-18'
song_name =      'S.O.S.が出る前に'
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
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '働いてる朝から晩まではまらないあの歌の「頑張れ」このままでいいのかって不安になってなんで私だけとか考えてる疲れてる怒ることにどうすれば届く思いどこに向かう方角もわからないままただ試行錯誤',
  ruby: 'はたらいてるあさからばんまではまらないあのうたのがんばれこのままでいいのかってふあんになってなんでわたしだけとかかんがえてるつかれてるおこることにどうすればとどくおもいどこにむかうほうがくもわからないままただしこうさくご',
  lyric_with_ruby: '\{働い,はたらい\}てる\{朝,あさ\}から\{晩,ばん\}まで\{ ,\}はまらないあの\{歌,うた\}の\{「,\}\{頑張れ,がんばれ\}\{」,\}\{ ,\}このままでいいのかって\{不安,ふあん\}になって\{ ,\}なんで\{私,わたし\}だけとか\{考え,かんがえ\}てる\{ ,\}\{疲れ,つかれ\}てる\{ ,\}\{怒る,おこる\}ことに\{ ,\}どうすれば\{ ,\}\{届く,とどく\}\{思い,おもい\}\{ ,\}どこに\{向かう,むかう\}\{ ,\}\{方角,ほうがく\}も\{ ,\}わからないままただ\{試行錯誤,しこうさくご\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'S.O.S.が出てからじゃ遅いから作った応援歌失敗いっぱい当然さもうケンカしてる場合じゃない洗いざらい聞いてあげるそして俺が言ってあげる誰だってダメな時ももちろんあるそれでも',
  ruby: 'えすおーえすがでてからじゃおそいからつくったおうえんかしっぱいいっぱいとうぜんさもうけんかしてるばあいじゃないあらいざらいきいてあげるそしておれがいってあげるだれだってだめなときももちろんあるそれでも',
  lyric_with_ruby: '\{S,えす\}\{.,\}\{O,おー\}\{.,\}\{S,えす\}\{.,\}が\{ ,\}\{出,で\}てからじゃ\{遅い,おそい\}から\{作っ,つくっ\}た\{応援,おうえん\}\{歌,か\}\{ ,\}\{失敗,しっぱい\}\{ ,\}いっぱい\{当然,とうぜん\}さ\{ ,\}もう\{ケンカ,けんか\}してる\{場合,ばあい\}じゃない\{ ,\}\{洗いざらい,あらいざらい\}\{ ,\}\{聞い,きい\}てあげる\{ ,\}そして\{俺,おれ\}が\{言っ,いっ\}てあげる\{ ,\}\{誰,だれ\}だって\{ダメ,だめ\}な\{ ,\}\{時,とき\}ももちろんある\{ ,\}それでも\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '頑張ってると思うよ頑張ってると思うよわかってると思うけど一応言うよ俺らはまだまだ発展途上',
  ruby: 'がんばってるとおもうよがんばってるとおもうよわかってるとおもうけどいちおういうよおれらはまだまだはってんとじょう',
  lyric_with_ruby: '\{頑張っ,がんばっ\}てると\{思う,おもう\}よ\{ ,\}\{頑張っ,がんばっ\}てると\{思う,おもう\}よ\{ ,\}わかってると\{思う,おもう\}けど\{ ,\}\{一応,いちおう\}\{言う,いう\}よ\{ ,\}\{俺,おれ\}らはまだまだ\{発展,はってん\}\{途上,とじょう\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '頑張ってると思うよ頑張ってると思うよわかってると思うけど一応言うよ俺らはまだまだ発展途上',
  ruby: 'がんばってるとおもうよがんばってるとおもうよわかってるとおもうけどいちおういうよおれらはまだまだはってんとじょう',
  lyric_with_ruby: '\{頑張っ,がんばっ\}てると\{思う,おもう\}よ\{ ,\}\{頑張っ,がんばっ\}てると\{思う,おもう\}よ\{ ,\}わかってると\{思う,おもう\}けど\{ ,\}\{一応,いちおう\}\{言う,いう\}よ\{ ,\}\{俺,おれ\}らはまだまだ\{発展,はってん\}\{途上,とじょう\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '隣の芝生が青すぎてウチのはまるで枯れ草どうしたらああなれるか教えてくれない?アレクサ踊らされてる神の手アンバランスやじろべえ何を捨て何を得るそれよりちゃんと支えて私の手',
  ruby: 'となりのしばふがあおすぎてうちのはまるでかれくさどうしたらああなれるかおしえてくれないあれくさおどらされてるかみのてあんばらんすやじろべえなにをすてなにをえるそれよりちゃんとささえてわたしのて',
  lyric_with_ruby: '\{隣,となり\}の\{芝生,しばふ\}が\{青,あお\}すぎて\{ ,\}\{ウチ,うち\}のはまるで\{枯れ草,かれくさ\}\{ ,\}どうしたらああなれるか\{ ,\}\{教え,おしえ\}てくれない\{?,\}\{ ,\}\{アレクサ,あれくさ\}\{ ,\}\{踊ら,おどら\}されてる\{神,かみ\}の\{手,て\}\{ ,\}\{アンバランス,あんばらんす\}\{ ,\}やじろべえ\{ ,\}\{何,なに\}を\{捨て,すて\}\{ ,\}\{何,なに\}を\{得る,える\}\{ ,\}それよりちゃんと\{支え,ささえ\}て\{私,わたし\}の\{手,て\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'S.O.S.が出てからじゃ遅いから今そこまで飛んでっちゃう出来なくても面と向かいたいこの気持ち伝えてWi-Fi失敗いっぱい無くなんないまだいらないファイナルアンサー正解はいつか出そう今はまず言いたい',
  ruby: 'えすおーえすがでてからじゃおそいからいまそこまでとんでっちゃうできなくてもめんとむかいたいこのきもちつたえてわいふぁいしっぱいいっぱいなくなんないまだいらないふぁいなるあんさーせいかいはいつかだそういまはまずいいたい',
  lyric_with_ruby: '\{S,えす\}\{.,\}\{O,おー\}\{.,\}\{S,えす\}\{.,\}が\{ ,\}\{出,で\}てからじゃ\{遅い,おそい\}から\{今,いま\}そこまで\{飛ん,とん\}でっちゃう\{ ,\}\{出来,でき\}なくても\{面,めん\}と\{向かい,むかい\}たい\{ ,\}この\{気持ち,きもち\}\{伝え,つたえ\}て\{Wi-Fi,わいふぁい\}\{ ,\}\{失敗,しっぱい\}\{ ,\}いっぱい\{ ,\}\{無くなん,なくなん\}ない\{ ,\}まだいらない\{ファイナルアンサー,ふぁいなるあんさー\}\{ ,\}\{正解,せいかい\}はいつか\{出そ,だそ\}う\{ ,\}\{今,いま\}はまず\{言い,いい\}たい\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '頑張ってると思うよ頑張ってると思うよわかってると思うけど一応言うよ俺らはまだまだ発展途上',
  ruby: 'がんばってるとおもうよがんばってるとおもうよわかってるとおもうけどいちおういうよおれらはまだまだはってんとじょう',
  lyric_with_ruby: '\{頑張っ,がんばっ\}てると\{思う,おもう\}よ\{ ,\}\{頑張っ,がんばっ\}てると\{思う,おもう\}よ\{ ,\}わかってると\{思う,おもう\}けど\{ ,\}\{一応,いちおう\}\{言う,いう\}よ\{ ,\}\{俺,おれ\}らはまだまだ\{発展,はってん\}\{途上,とじょう\}\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: '頑張ってると思うよ頑張ってると思うよわかってると思うけど一応言うよ俺らはまだまだ発展途上',
  ruby: 'がんばってるとおもうよがんばってるとおもうよわかってるとおもうけどいちおういうよおれらはまだまだはってんとじょう',
  lyric_with_ruby: '\{頑張っ,がんばっ\}てると\{思う,おもう\}よ\{ ,\}\{頑張っ,がんばっ\}てると\{思う,おもう\}よ\{ ,\}わかってると\{思う,おもう\}けど\{ ,\}\{一応,いちおう\}\{言う,いう\}よ\{ ,\}\{俺,おれ\}らはまだまだ\{発展,はってん\}\{途上,とじょう\}\{ ,\}',
  lyric_order: 8,
)

