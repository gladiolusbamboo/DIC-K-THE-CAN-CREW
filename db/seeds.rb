name = '北谷グラフィティ [amigo sdit]'
song = Song.find_by(name: name)

if song
      song.name = '北谷グラフィティ [amigo edit]'
    song.save
else
  p '見つからない -> ' + name
end
