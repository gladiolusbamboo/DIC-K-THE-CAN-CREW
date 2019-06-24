name = 'Na Na Na'
song = Song.find_by(name: name)

if song
    if song.note == nil
        song.note = 'Al「成長の記録　～全曲バンドで録り直し～」には2019 Ver.として収録。'
    else
        note = song.note
        if !note.end_with?("。")
            note = "。"
        end
        note = note + 'Al「成長の記録　～全曲バンドで録り直し～」には2019 Ver.として収録。'
        song.note = note
    end
    song.save
else
  p '見つからない -> ' + name
end
