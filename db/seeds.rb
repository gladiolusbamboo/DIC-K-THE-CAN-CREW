# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artist.create(
    name: '三浦大知'
)

Cd.create(
    name: 'ULTRAP',
    released_at: '2014-03-07'
)

LyricUrl.create(
    url: 'https://www.utamap.com/showkasi.php?surl=k-140305-145'
)
