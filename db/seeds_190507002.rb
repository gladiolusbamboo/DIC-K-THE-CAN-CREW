song = Song.find_by(name: '2丁拳銃')
lyric = Lyric.find_by(song: song, lyric_order: 2);
if song
  lyric.lyric = 'ゲットーの銃より言論の自由Check1.2(1.2)機関銃言いにくいことガンガン言う唇から散弾銃(Bang)これが最新盤羅針盤SEXにピストルマシンガンRound1&2&Bang(Bang)Bang(Bang)SHURE58ハンドガン'
  lyric.ruby = 'げっとーのじゅうよりげんろんのじゆうちぇっくわんつーわんつーきかんじゅういいにくいことがんがんいうくちびるからさんだんじゅうばんこれがさいしんばんらしんばんせっくすにぴすとるましんがんらうんどわんあんどつーあんどばんばんばんばんしゅあーごじゅうはちはんどがん'
  lyric.lyric_with_ruby = '\{ゲットー,げっとー\}の\{銃,じゅう\}より\{言論,げんろん\}の\{自由,じゆう\}\{ ,\}\{Check,ちぇっく\}\{1,わん\}\{.,\}\{2,つー\}\{(,\}\{1,わん\}\{.,\}\{2,つー\}\{),\}\{ ,\}\{機関,きかん\}\{銃,じゅう\}\{ ,\}\{言い,いい\}にくいこと\{ガンガン,がんがん\}\{言う,いう\}\{ ,\}\{唇,くちびる\}から\{散弾,さんだん\}\{銃,じゅう\}\{ ,\}\{(,\}\{Bang,ばん\}\{),\}\{ ,\}これが\{最新,さいしん\}\{盤,ばん\}\{ ,\}\{羅針盤,らしんばん\}\{ ,\}\{SEX,せっくす\}に\{ピストルマシンガン,ぴすとるましんがん\}\{ ,\}\{Round,らうんど\}\{1,わん\}\{&,あんど\}\{2,つー\}\{&,あんど\}\{Bang,ばん\}\{(,\}\{Bang,ばん\}\{),\}\{Bang,ばん\}\{(,\}\{Bang,ばん\}\{),\}\{ ,\}\{SHURE,しゅあー\}\{58,ごじゅうはち\}\{ ,\}\{ハンド,はんど\}\{ガン,がん\}\{ ,\}'
  lyric.save
else
  p '見つからない -> ' + lyric
end