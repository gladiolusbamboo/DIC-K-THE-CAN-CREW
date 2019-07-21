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

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'あるならあるだけまるでアレ心弾ませるまるでアレ人を狂わせるまるでアレにせもんは潰されるまるでアレ良いライクアレ悪いライクアレわかっちゃいるが欲しいライクアレ結局アレアレ言いたいだけかね?バレバレ見透かすjustlikeアレ',
  ruby: 'あるならあるだけまるであれこころはずませるまるであれひとをくるわせるまるであれにせもんはつぶされるまるであれいいらいくあれわるいらいくあれわかっちゃいるがほしいらいくあれけっきょくあれあれいいたいだけかねばればれみすかすじゃすとらいくあれ',
  lyric_with_ruby: 'あるならあるだけ\{ ,\}まるで\{アレ,あれ\}\{ ,\}\{心,こころ\}\{弾ま,はずま\}せる\{ ,\}まるで\{アレ,あれ\}\{ ,\}\{人,ひと\}を\{狂わせる,くるわせる\}\{ ,\}まるで\{アレ,あれ\}\{ ,\}にせもんは\{潰さ,つぶさ\}れる\{ ,\}まるで\{アレ,あれ\}\{ ,\}\{良い,いい\}\{ライクアレ,らいくあれ\}\{ ,\}\{悪い,わるい\}\{ライクアレ,らいくあれ\}\{ ,\}わかっちゃいるが\{欲しい,ほしい\}\{ライクアレ,らいくあれ\}\{ ,\}\{結局,けっきょく\}\{アレアレ,あれあれ\}\{言い,いい\}たいだけかね\{?,\}\{ ,\}\{バレ,ばれ\}\{バレ,ばれ\}\{見透かす,みすかす\}\{just,じゃすと\}\{ ,\}\{like,らいく\}\{ ,\}\{アレ,あれ\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'CUEZERO')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'あれ!?気付きゃもうないよアレ社長さん分けてちょーだいよアレまーね?!何をするんでもアレそいつが大きく運命を分ける満面の笑みで数えるアレ性格さえもを染めるアレあればあるだけ求めるアレ誰も止めらんねぇ…',
  ruby: 'あれきづきゃもうないよあれしゃちょうさんわけてちょーだいよあれまーねなにをするんでもあれそいつがおおきくうんめいをわけるまんめんのえみでかぞえるあれせいかくさえもをそめるあれあればあるだけもとめるあれだれもとめらんねぇ',
  lyric_with_ruby: 'あれ\{!?,\}\{ ,\}\{気付きゃ,きづきゃ\}もうないよ\{アレ,あれ\}\{ ,\}\{社長,しゃちょう\}さん\{ ,\}\{分け,わけ\}てちょーだいよ\{アレ,あれ\}\{ ,\}まーね\{?!,\}\{ ,\}\{何,なに\}をするんでも\{アレ,あれ\}\{ ,\}そいつが\{大きく,おおきく\}\{運命,うんめい\}を\{分ける,わける\}\{ ,\}\{満面,まんめん\}の\{笑み,えみ\}で\{数える,かぞえる\}\{アレ,あれ\}\{ ,\}\{性格,せいかく\}さえもを\{染める,そめる\}\{アレ,あれ\}\{ ,\}あればあるだけ\{求める,もとめる\}\{アレ,あれ\}\{ ,\}\{誰,だれ\}も\{止め,とめ\}らんねぇ\{…,\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'Let\'stalkaboutアレ!!',
  ruby: 'れっつとーくあばうとあれ',
  lyric_with_ruby: '\{Let\'s,れっつ\}\{ ,\}\{talk,とーく\}\{ ,\}\{about,あばうと\}\{ ,\}\{アレ,あれ\}\{!!,\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'ちゃんと選びたいまるでアレそれだけじゃ足りないまるでアレ気軽に出会いたいまるでアレちょいとひっかけるjustlikeアレ甘いライクアレ辛いライクアレオレをほっとかないまるでアレ確かに興味は尽きねぇようだが(danger)止めとけ趣味程度(あれぇ～～)',
  ruby: 'ちゃんとえらびたいまるであれそれだけじゃたりないまるであれきがるにであいたいまるであれちょいとひっかけるじゃすとらいくあれあまいらいくあれからいらいくあれおれをほっとかないまるであれたしかにきょうみはつきねぇようだがでんじゃーやめとけしゅみていどあれぇーー',
  lyric_with_ruby: 'ちゃんと\{選び,えらび\}たい\{ ,\}まるで\{アレ,あれ\}\{ ,\}それだけじゃ\{足り,たり\}ない\{ ,\}まるで\{アレ,あれ\}\{ ,\}\{気軽,きがる\}に\{出会い,であい\}たい\{ ,\}まるで\{アレ,あれ\}\{ ,\}ちょいとひっかける\{just,じゃすと\}\{ ,\}\{like,らいく\}\{ ,\}\{アレ,あれ\}\{ ,\}\{甘い,あまい\}\{ライクアレ,らいくあれ\}\{ ,\}\{辛い,からい\}\{ライクアレ,らいくあれ\}\{ ,\}\{オレ,おれ\}をほっとかない\{ ,\}まるで\{アレ,あれ\}\{ ,\}\{確か,たしか\}に\{興味,きょうみ\}は\{尽き,つき\}ねぇようだが\{ ,\}\{(,\}\{danger,でんじゃー\}\{),\}\{ ,\}\{止め,やめ\}とけ\{趣味,しゅみ\}\{程度,ていど\}\{ ,\}\{(,\}あれぇ\{～,ー\}\{～,ー\}\{),\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'CUEZERO')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: '真っ赤に染めあげるそれはアレ一気も止められるそれはアレ本当はやめたいと思ってるアレそれでも今夜は特別だぜ純度高めのイカツいアレ子供の教育に悪いアレ大人のたしなみ求められるよこせもっとうめーアレ',
  ruby: 'まっかにそめあげるそれはあれいっきもとめられるそれはあれほんとうはやめたいとおもってるあれそれでもこんやはとくべつだぜじゅんどたかめのいかついあれこどものきょういくにわるいあれおとなのたしなみもとめられるよこせもっとうめーあれ',
  lyric_with_ruby: '\{真っ赤,まっか\}に\{染めあげる,そめあげる\}\{ ,\}それは\{アレ,あれ\}\{ ,\}\{一気,いっき\}も\{止め,とめ\}られる\{ ,\}それは\{アレ,あれ\}\{ ,\}\{本当は,ほんとうは\}やめたいと\{思っ,おもっ\}てる\{アレ,あれ\}\{ ,\}それでも\{今夜,こんや\}は\{特別,とくべつ\}だぜ\{ ,\}\{純度,じゅんど\}\{高め,たかめ\}の\{イカツ,いかつ\}い\{アレ,あれ\}\{ ,\}\{子供,こども\}の\{教育,きょういく\}に\{悪い,わるい\}\{アレ,あれ\}\{ ,\}\{大人,おとな\}のたしなみ\{求め,もとめ\}られる\{ ,\}よこせもっとうめ\{ーアレ,ーあれ\}\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'BY PHAR THE DOPEST')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'Let\'stalkaboutアレ!!',
  ruby: 'れっつとーくあばうとあれ',
  lyric_with_ruby: '\{Let\'s,れっつ\}\{ ,\}\{talk,とーく\}\{ ,\}\{about,あばうと\}\{ ,\}\{アレ,あれ\}\{!!,\}\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'ESTHETICS')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'HeyHeygivemeアレIwantアレほらIneedアレIloveアレほらIlikeアレアレだよアレHoo～～!!',
  ruby: 'へいへいぎぶみーあれあいうぉんとあれほらあいにーどあれあいらぶあれほらあいらいくあれあれだよあれほーーー',
  lyric_with_ruby: '\{Hey,へい\}\{ ,\}\{Hey,へい\}\{ ,\}\{give,ぎぶ\}\{ ,\}\{me,みー\}\{ ,\}\{アレ,あれ\}\{ ,\}\{I,あい\}\{ ,\}\{want,うぉんと\}\{ ,\}\{アレ,あれ\}\{ ,\}ほら\{ ,\}\{I,あい\}\{ ,\}\{need,にーど\}\{ ,\}\{アレ,あれ\}\{ ,\}\{I,あい\}\{ ,\}\{love,らぶ\}\{ ,\}\{アレ,あれ\}\{ ,\}ほら\{ ,\}\{I,あい\}\{ ,\}\{like,らいく\}\{ ,\}\{アレ,あれ\}\{ ,\}\{アレ,あれ\}だよ\{アレ,あれ\}\{ ,\}\{Hoo,ほー\}\{～,ー\}\{～,ー\}\{!!,\}\{ ,\}',
  lyric_order: 7,
)

