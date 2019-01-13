# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

artist =
Artist.create(
    name: 'UL'
)

cd =
Cd.create(
    name: 'ULTRAP',
    released_at: '2014-03-07'
)

lyrUrl =
LyricUrl.create(
    url: 'https://www.utamap.com/showkasi.php?surl=k-140305-145',
    lyric_website_id: LyricWebsite.find_by(name: 'うたまっぷ').id
)

Song.create(
    lyric_url_id: lyrUrl.id,
    name: 'UL-TRAP',
    lyricist: 'MCU & LITTLE',
    composer: 'MCU, LITTLE & KREVA',
    arranger: 'KREVA',
    cd_id: cd.id,
    artist_id: artist.id
)
