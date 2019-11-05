artist_name =    'KREVA'
lyricUrl_url =   nil
cd_name =        'AFTERMIXTAPE'
cd_released_at = '2019-09-18'
song_name =      'リアルドクターK'
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
  lyric: '俺がドクターなんだからお客さんじゃなくて患者さんだ収まりきらないUndergroundじゃいらないな客寄せパンダなんか待合所足りないよ場所が無いなら無いなりの心を込めたおもてなしで見てみな誰も怒ってないどころかこの病院笑顔が多い全然おさまらない動悸聴診器ずっと胸に当てる今日一日大丈夫それで正常ですよ平均値定期的な通院でいいって言ってるのに入院希望人気者',
  ruby: 'おれがどくたーなんだからおきゃくさんじゃなくてかんじゃさんだおさまりきらないあんだーぐらうんどじゃいらないなきゃくよせぱんだなんかまちあいじょたりないよばしょがないならないなりのこころをこめたおもてなしでみてみなだれもおこってないどころかこのびょういんえがおがおおいぜんぜんおさまらないどうきちょうしんきずっとむねにあてるきょういちにちだいじょうぶそれでせいじょうですよへいきんちていきてきなつういんでいいっていってるのににゅういんきぼうにんきもの',
  lyric_with_ruby: '\{俺,おれ\}が\{ドクター,どくたー\}なんだから\{ ,\}\{お客,おきゃく\}さん\{ ,\}じゃなくて\{ ,\}\{患者,かんじゃ\}さんだ\{ ,\}\{収まり,おさまり\}きらない\{ ,\}\{Underground,あんだーぐらうんど\}じゃ\{ ,\}いらないな\{ ,\}\{客寄せ,きゃくよせ\}\{パンダ,ぱんだ\}なんか\{ ,\}\{待合,まちあい\}\{所,じょ\}\{ ,\}\{足り,たり\}ないよ\{ ,\}\{場所,ばしょ\}が\{無い,ない\}なら\{無い,ない\}なりの\{ ,\}\{心,こころ\}を\{込め,こめ\}たおもてなしで\{ ,\}\{見,み\}てみな\{ ,\}\{誰,だれ\}も\{怒っ,おこっ\}てない\{ ,\}どころか\{ ,\}この\{病院,びょういん\}\{ ,\}\{笑顔,えがお\}が\{多い,おおい\}\{ ,\}\{全然,ぜんぜん\}おさまらない\{動悸,どうき\}\{ ,\}\{聴診,ちょうしん\}\{器,き\}\{ ,\}ずっと\{胸,むね\}に\{当てる,あてる\}\{ ,\}\{今日,きょう\}\{一,いち\}\{日,にち\}\{ ,\}\{大丈夫,だいじょうぶ\}\{ ,\}それで\{正常,せいじょう\}ですよ\{ ,\}\{平均,へいきん\}\{値,ち\}\{ ,\}\{定期,ていき\}\{的,てき\}な\{通院,つういん\}でいい\{ ,\}って\{言っ,いっ\}てるのに\{入院,にゅういん\}\{希望,きぼう\}\{ ,\}\{人気,にんき\}\{者,もの\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'KREVA')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'リラックスして力抜いて服はいいから!被ったカラ抜いで心をもっとさらけ出し今はただ流れに乗っかってりゃいい血圧計体温計Idon\'tcare決まりは無いも同然全て私の独断ですDr.K',
  ruby: 'りらっくすしてちからぬいてふくはいいからかぶったからぬいでこころをもっとさらけだしいまはただながれにのっかってりゃいいけつあつけいたいおんけいあいどんとけあきまりはないもどうぜんすべてわたしのどくだんですどくたーけー',
  lyric_with_ruby: '\{リラックス,りらっくす\}して\{力,ちから\}\{抜い,ぬい\}て\{ ,\}\{服,ふく\}はいいから\{!,\}\{ ,\}\{被っ,かぶっ\}た\{カラ,から\}\{抜い,ぬい\}で\{ ,\}\{心,こころ\}をもっと\{さらけ出し,さらけだし\}\{ ,\}\{今,いま\}はただ\{流れ,ながれ\}に\{乗っかっ,のっかっ\}てりゃいい\{ ,\}\{血圧,けつあつ\}\{計,けい\}\{ ,\}\{体温計,たいおんけい\}\{ ,\}\{I,あい\}\{ ,\}\{don\'t,どんと\}\{ ,\}\{care,けあ\}\{ ,\}\{決まり,きまり\}は\{無い,ない\}も\{同然,どうぜん\}\{ ,\}\{全て,すべて\}\{私,わたし\}の\{独断,どくだん\}です\{ ,\}\{Dr,どくたー\}\{.,\}\{ ,\}\{K,けー\}\{ ,\}',
  lyric_order: 2,
)

