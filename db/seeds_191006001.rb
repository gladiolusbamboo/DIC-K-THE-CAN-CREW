artist_name =    'KREVA'
lyricUrl_url =   nil
cd_name =        'AFTERMIXTAPE'
cd_released_at = '2019-09-18'
song_name =      '君の愛 Bring Me To Life'
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
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '(～bringmetoLife???～があれば生き返る、か…)',
  ruby: 'ほにゃららぶりんぐみーとぅーらいふほにゃららがあればいきかえるか',
  lyric_with_ruby: '\{(～,ほにゃらら\}\{bring,ぶりんぐ\}\{ ,\}\{me,みー\}\{ ,\}\{to,とぅー\}\{ ,\}\{Life,らいふ\}\{???,\}\{ ,\}\{～,ほにゃらら\}があれば\{生き返る,いきかえる\}\{、,\}か\{…,\}\{),\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '何がBringMeToLifeもちろん君の愛愛愛愛BringMeToLifeもちろん君の愛愛愛愛BringMeToLifeもちろん君の愛愛愛愛Yeah',
  ruby: 'なにがぶりんぐみーとぅーらいふもちろんきみのあいあいあいあいぶりんぐみーとぅーらいふもちろんきみのあいあいあいあいぶりんぐみーとぅーらいふもちろんきみのあいあいあいあいいぇー',
  lyric_with_ruby: '\{何,なに\}が\{ ,\}\{Bring,ぶりんぐ\}\{ ,\}\{Me,みー\}\{ ,\}\{To,とぅー\}\{ ,\}\{Life,らいふ\}\{ ,\}もちろん\{君,きみ\}の\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{Bring,ぶりんぐ\}\{ ,\}\{Me,みー\}\{ ,\}\{To,とぅー\}\{ ,\}\{Life,らいふ\}\{ ,\}もちろん\{君,きみ\}の\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{Bring,ぶりんぐ\}\{ ,\}\{Me,みー\}\{ ,\}\{To,とぅー\}\{ ,\}\{Life,らいふ\}\{ ,\}もちろん\{君,きみ\}の\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{Yeah,いぇー\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'いつからか昼間っからでも呑みたいと思ってしまう今日はなにひとつためらうことはないよこうゆう時言っちゃう「大人最高!」かわいたノドと心潤すお酒がBringMeToLife',
  ruby: 'いつからかひるまっからでものみたいとおもってしまうきょうはなにひとつためらうことはないよこうゆうときいっちゃうおとなさいこうかわいたのどとこころうるおすおさけがぶりんぐみーとぅーらいふ',
  lyric_with_ruby: 'いつからか\{ ,\}\{昼間,ひるま\}っからでも\{ ,\}\{呑み,のみ\}たいと\{思っ,おもっ\}てしまう\{ ,\}\{今日,きょう\}はなにひとつためらうことはないよ\{ ,\}こうゆう\{時,とき\}\{言っ,いっ\}ちゃう\{「,\}\{大人,おとな\}\{最高,さいこう\}\{!」,\}\{ ,\}かわいた\{ノド,のど\}と\{心,こころ\}\{ ,\}\{潤す,うるおす\}お\{酒,さけ\}が\{ ,\}\{Bring,ぶりんぐ\}\{ ,\}\{Me,みー\}\{ ,\}\{To,とぅー\}\{ ,\}\{Life,らいふ\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '人は見た目で判断ならどんな格好ってゆうかファッションが大事でも誰かのためじゃなく自分に似合う服選べたら気分いいどうする?迷いつつ頑張って買ったりする洋服がBringMeToLife',
  ruby: 'ひとはみためではんだんならどんなかっこうってゆうかふぁっしょんがだいじでもだれかのためじゃなくじぶんににあうふくえらべたらきぶんいいどうするまよいつつがんばってかったりするようふくがぶりんぐみーとぅーらいふ',
  lyric_with_ruby: '\{人,ひと\}は\{見た目,みため\}で\{判断,はんだん\}\{ ,\}なら\{ ,\}どんな\{格好,かっこう\}\{ ,\}ってゆうか\{ファッション,ふぁっしょん\}が\{大事,だいじ\}\{ ,\}でも\{誰,だれ\}かのためじゃなく\{自分,じぶん\}に\{ ,\}\{似合う,にあう\}\{服,ふく\}\{選べ,えらべ\}たら\{気分,きぶん\}いい\{ ,\}どうする\{?,\}\{ ,\}\{迷い,まよい\}つつ\{ ,\}\{頑張っ,がんばっ\}て\{買っ,かっ\}たりする\{洋服,ようふく\}が\{ ,\}\{Bring,ぶりんぐ\}\{ ,\}\{Me,みー\}\{ ,\}\{To,とぅー\}\{ ,\}\{Life,らいふ\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'やっぱりないよりあるほうがいい急になくなること考えたら怖い天下の回りものなら財布の中にもっと入ってこいや!全て忘れて働いて急に舞い込むお金がBringMeToLife',
  ruby: 'やっぱりないよりあるほうがいいきゅうになくなることかんがえたらこわいてんかのまわりものならさいふのなかにもっとはいってこいやすべてわすれてはたらいてきゅうにまいこむおかねがぶりんぐみーとぅーらいふ',
  lyric_with_ruby: 'やっぱりないよりあるほうがいい\{ ,\}\{急,きゅう\}になくなること\{考え,かんがえ\}たら\{怖い,こわい\}\{ ,\}\{天下,てんか\}の\{回り,まわり\}ものなら\{ ,\}\{財布,さいふ\}の\{中,なか\}にもっと\{入っ,はいっ\}てこいや\{!,\}\{ ,\}\{全て,すべて\}\{忘れ,わすれ\}て\{働い,はたらい\}て\{ ,\}\{急,きゅう\}に\{舞い込む,まいこむ\}\{お金,おかね\}が\{ ,\}\{Bring,ぶりんぐ\}\{ ,\}\{Me,みー\}\{ ,\}\{To,とぅー\}\{ ,\}\{Life,らいふ\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: 'でも物じゃ満たせないこの胸のロンリネス超本気で与え与えられるあの幸せで全てに耐えられる死ぬなら今がいい他には何もいらないと思えるほど俺を生かすのはそうだ君の愛愛愛愛',
  ruby: 'でもものじゃみたせないこのむねのろんりねすちょうほんきであたえあたえられるあのしあわせですべてにたえられるしぬならいまがいいほかにはなにもいらないとおもえるほどおれをいかすのはそうだきみのあいあいあいあい',
  lyric_with_ruby: 'でも\{ ,\}\{物,もの\}じゃ\{満たせ,みたせ\}ない\{ ,\}この\{胸,むね\}の\{ロンリネス,ろんりねす\}\{ ,\}\{超,ちょう\}\{本気,ほんき\}で\{与え,あたえ\}\{与え,あたえ\}られる\{ ,\}あの\{幸せ,しあわせ\}で\{全て,すべて\}に\{耐え,たえ\}られる\{ ,\}\{死ぬ,しぬ\}なら\{今,いま\}がいい\{ ,\}\{他,ほか\}には\{何,なに\}もいらない\{ ,\}と\{思える,おもえる\}ほど\{ ,\}\{俺,おれ\}を\{生かす,いかす\}のは\{ ,\}そうだ\{ ,\}\{君,きみ\}の\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'BringMeToLifeもちろん君の愛愛愛愛BringMeToLifeもちろん君の愛愛愛愛BringMeToLifeもちろん君の愛愛愛愛Yeah',
  ruby: 'ぶりんぐみーとぅーらいふもちろんきみのあいあいあいあいぶりんぐみーとぅーらいふもちろんきみのあいあいあいあいぶりんぐみーとぅーらいふもちろんきみのあいあいあいあいいぇー',
  lyric_with_ruby: '\{Bring,ぶりんぐ\}\{ ,\}\{Me,みー\}\{ ,\}\{To,とぅー\}\{ ,\}\{Life,らいふ\}\{ ,\}もちろん\{君,きみ\}の\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{Bring,ぶりんぐ\}\{ ,\}\{Me,みー\}\{ ,\}\{To,とぅー\}\{ ,\}\{Life,らいふ\}\{ ,\}もちろん\{君,きみ\}の\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{Bring,ぶりんぐ\}\{ ,\}\{Me,みー\}\{ ,\}\{To,とぅー\}\{ ,\}\{Life,らいふ\}\{ ,\}もちろん\{君,きみ\}の\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{愛,あい\}\{ ,\}\{Yeah,いぇー\}\{ ,\}',
  lyric_order: 7,
)

