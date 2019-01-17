# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

song_id = Lyric.find_by(lyric: 'くよくよ考えても始まらないよくよく考えりゃ考えてない時間が解決したんじゃないんですか?ってな感じ自慢じゃないですが事態は一転意外と好転したりする気にしないよ当然運がわりいはあるが日替わり週がわり占いがわりい律動旋律和声混ぜ合わせ後は野となれ風まかせ鼻歌が流れ流れてヒットすりゃいーねそうはいかない?案外いくかもよだってこう見えて真剣だものやると決まりゃやるときはやるもちろんやらない時もある').song_id
dwbhgl = Song.find(song_id)

dwbhgl.name = "Don't worry Be happy Go lucky"

dwbhgl.save