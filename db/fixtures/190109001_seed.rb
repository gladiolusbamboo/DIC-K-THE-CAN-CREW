ul = Artist.find_by(name: 'UL')

if ul
    ul.delete
end
