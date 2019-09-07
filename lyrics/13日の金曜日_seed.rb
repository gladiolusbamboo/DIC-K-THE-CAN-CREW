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

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'OTHER')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: 'アスタラ!',
  ruby: 'あすたら',
  lyric_with_ruby: '\{アスタラ,あすたら\}\{!,\}\{ ,\}',
  lyric_order: 1,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '13日の金曜日何が起きる?何かおきる!',
  ruby: 'じゅうさんにちのきんようびなにがおきるなにかおきる',
  lyric_with_ruby: '\{13,じゅうさん\}\{日,にち\}の\{ ,\}\{金曜日,きんようび\}\{ ,\}\{何,なに\}が\{起きる,おきる\}\{?,\}\{ ,\}\{何,なに\}かおきる\{!,\}\{ ,\}',
  lyric_order: 2,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 1,
  lyric: '手慣れた手口淫らな気持ちでイカれた体貴方の背後に迫る',
  ruby: 'てなれたてぐちみだらなきもちでいかれたからだあなたのはいごにせまる',
  lyric_with_ruby: '\{手慣れ,てなれ\}た\{手口,てぐち\}\{ ,\}\{淫ら,みだら\}な\{気持ち,きもち\}で\{ ,\}\{イカ,いか\}れた\{体,からだ\}\{ ,\}\{貴方,あなた\}の\{背後,はいご\}に\{迫る,せまる\}\{ ,\}',
  lyric_order: 3,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: 'ぶっ飛んだサウンドロックオンしちゃう圧巻のダンスウィークエンドナイト速攻でセット格好のチャンスノックアウトしちゃうウィークエンドナイト',
  ruby: 'ぶっとんださうんどろっくおんしちゃうあっかんのだんすうぃーくえんどないとそっこうでせっとかっこうのちゃんすのっくあうとしちゃううぃーくえんどないと',
  lyric_with_ruby: 'ぶっ\{飛ん,とん\}だ\{サウンド,さうんど\}\{ ,\}\{ロック,ろっく\}\{オン,おん\}しちゃう\{ ,\}\{圧巻,あっかん\}の\{ダンス,だんす\}\{ ,\}\{ウィークエンド,うぃーくえんど\}\{ナイト,ないと\}\{ ,\}\{速攻,そっこう\}で\{セット,せっと\}\{ ,\}\{格好,かっこう\}の\{チャンス,ちゃんす\}\{ ,\}\{ノックアウト,のっくあうと\}しちゃう\{ ,\}\{ウィークエンド,うぃーくえんど\}\{ナイト,ないと\}\{ ,\}',
  lyric_order: 4,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 2,
  lyric: '誰かに教えたいすぐそこまで近づいている誰かに伝えたい今すぐ連れ去られてしまう',
  ruby: 'だれかにおしえたいすぐそこまでちかづいているだれかにつたえたいいますぐつれさられてしまう',
  lyric_with_ruby: '\{誰,だれ\}かに\{教え,おしえ\}たい\{ ,\}すぐそこまで\{近づい,ちかづい\}ている\{ ,\}\{誰,だれ\}かに\{伝え,つたえ\}たい\{ ,\}\{今,いま\}すぐ\{連れ去ら,つれさら\}れてしまう\{ ,\}',
  lyric_order: 5,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: '13日の金曜日何が起きる?何かおきる!',
  ruby: 'じゅうさんにちのきんようびなにがおきるなにかおきる',
  lyric_with_ruby: '\{13,じゅうさん\}\{日,にち\}の\{ ,\}\{金曜日,きんようび\}\{ ,\}\{何,なに\}が\{起きる,おきる\}\{?,\}\{ ,\}\{何,なに\}かおきる\{!,\}\{ ,\}',
  lyric_order: 6,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 3,
  lyric: 'イルなみんなとティータイムイルミナティタイムテーブル囲む優雅な闇の陰謀説マジっすか?人口調整教えてベンジャミン何が起きるの?備えて憂いなく生きのびるよダラダラビルヨー!誰のマネーか知れねぇが乾杯ダスクティルドーン',
  ruby: 'いるなみんなとてぃーたいむいるみなてぃたいむてーぶるかこむゆうがなやみのいんぼうせつまじっすかじんこうちょうせいおしえてべんじゃみんなにがおきるのそなえてうれいなくいきのびるよだらだらびるよーだれのまねーかしれねぇがかんぱいだすくてぃるどーん',
  lyric_with_ruby: '\{イル,いる\}なみんなと\{ティー,てぃー\}\{タイム,たいむ\}\{ ,\}\{イルミナティタイム,いるみなてぃたいむ\}\{ ,\}\{テーブル,てーぶる\}\{囲む,かこむ\}\{優雅,ゆうが\}な\{闇,やみ\}の\{陰謀,いんぼう\}\{説,せつ\}\{ ,\}\{マジ,まじ\}っすか\{?,\}\{ ,\}\{人口,じんこう\}\{調整,ちょうせい\}\{ ,\}\{教え,おしえ\}て\{ベン,べん\}\{ジャミン,じゃみん\}\{ ,\}\{何,なに\}が\{起きる,おきる\}の\{?,\}\{ ,\}\{備え,そなえ\}て\{憂,うれ\}いなく\{生きのびる,いきのびる\}よ\{ ,\}\{ダラダラビルヨー,だらだらびるよー\}\{!,\}\{ ,\}\{誰,だれ\}の\{マネー,まねー\}か\{知れ,しれ\}ねぇが\{ ,\}\{乾杯,かんぱい\}\{ ,\}\{ダスクティルドーン,だすくてぃるどーん\}\{ ,\}',
  lyric_order: 7,
)

singer = Singer.find_by(name: 'LITTLE')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: '怪奇現象金曜チェーンソー今は一体何代目ジェイソンあいつもメイソンあいつもメイソン噂話は迷走口さけ女人面犬21面相ティンポがインポになるメンソールウソ?幻想?グレイゾーン?信じる信じないアナタ次第',
  ruby: 'かいきげんしょうきんようちぇーんそーいまはいったいなんだいめじぇいそんあいつもめいそんあいつもめいそんうわさばなしはめいそうくちさけおんなじんめんけんにじゅういちめんそうてぃんぽがいんぽになるめんそーるうそげんそうぐれいぞーんしんじるしんじないあなたしだい',
  lyric_with_ruby: '\{怪奇,かいき\}\{現象,げんしょう\}\{金曜,きんよう\}\{チェーンソー,ちぇーんそー\}\{ ,\}\{今,いま\}は\{一体,いったい\}\{何,なん\}\{代目,だいめ\}\{ジェイソン,じぇいそん\}\{ ,\}あいつも\{メイソン,めいそん\}\{ ,\}あいつも\{メイソン,めいそん\}\{ ,\}\{噂,うわさ\}\{話,ばなし\}は\{迷走,めいそう\}\{ ,\}\{口,くち\}さけ\{女,おんな\}\{人面,じんめん\}\{犬,けん\}\{21,にじゅういち\}\{面相,めんそう\}\{ ,\}\{ティンポ,てぃんぽ\}が\{インポ,いんぽ\}になる\{メンソール,めんそーる\}\{ ,\}\{ウソ,うそ\}\{?,\}\{幻想,げんそう\}\{?,\}\{グレイ,ぐれい\}\{ゾーン,ぞーん\}\{?,\}\{ ,\}\{信じる,しんじる\}\{信じ,しんじ\}ない\{アナタ,あなた\}\{次第,しだい\}\{ ,\}',
  lyric_order: 8,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'VERSE')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 5,
  lyric: 'ぶっ飛んだサウンドロックオンしちゃう圧巻のダンスウィークエンドナイト速攻でセット格好のチャンスノックアウトしちゃうウィークエンドナイト',
  ruby: 'ぶっとんださうんどろっくおんしちゃうあっかんのだんすうぃーくえんどないとそっこうでせっとかっこうのちゃんすのっくあうとしちゃううぃーくえんどないと',
  lyric_with_ruby: 'ぶっ\{飛ん,とん\}だ\{サウンド,さうんど\}\{ ,\}\{ロック,ろっく\}\{オン,おん\}しちゃう\{ ,\}\{圧巻,あっかん\}の\{ダンス,だんす\}\{ ,\}\{ウィークエンド,うぃーくえんど\}\{ナイト,ないと\}\{ ,\}\{速攻,そっこう\}で\{セット,せっと\}\{ ,\}\{格好,かっこう\}の\{チャンス,ちゃんす\}\{ ,\}\{ノックアウト,のっくあうと\}しちゃう\{ ,\}\{ウィークエンド,うぃーくえんど\}\{ナイト,ないと\}\{ ,\}',
  lyric_order: 9,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 4,
  lyric: '誰かに教えたいすぐそこまで近づいている誰かに伝えたい今すぐ連れ去られてしまう',
  ruby: 'だれかにおしえたいすぐそこまでちかづいているだれかにつたえたいいますぐつれさられてしまう',
  lyric_with_ruby: '\{誰,だれ\}かに\{教え,おしえ\}たい\{ ,\}すぐそこまで\{近づい,ちかづい\}ている\{ ,\}\{誰,だれ\}かに\{伝え,つたえ\}たい\{ ,\}\{今,いま\}すぐ\{連れ去ら,つれさら\}れてしまう\{ ,\}',
  lyric_order: 10,
)

singer = Singer.find_by(name: 'アスタラビスタ')
lyrict_type = LyricType.find_by(name: 'HOOK')
Lyric.create(
  song_id: song.id,
  singer_id: singer.id,
  lyric_type_id: lyrict_type.id,
  part_lyric_order: 5,
  lyric: '13日の金曜日何が起きる?何かおきる!',
  ruby: 'じゅうさんにちのきんようびなにがおきるなにかおきる',
  lyric_with_ruby: '\{13,じゅうさん\}\{日,にち\}の\{ ,\}\{金曜日,きんようび\}\{ ,\}\{何,なに\}が\{起きる,おきる\}\{?,\}\{ ,\}\{何,なに\}かおきる\{!,\}\{ ,\}',
  lyric_order: 11,
)

