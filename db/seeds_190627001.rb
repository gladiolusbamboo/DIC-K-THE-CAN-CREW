song_array = ["基準","ストロングスタイル","トランキライザー","イッサイガッサイ",'王者の休日','I Wanna Know You','存在感','成功','KILA KILA','かも','居場所','アグレッシ部','スタート','音色','C\'mon, Let\'s go',]

song_array.each{|song_name|
    song = Song.find_by(name: song_name)

    if song
        if song.note == nil
            song.note = 'Al「成長の記録　～全曲バンドで録り直し～」には2019 Ver.として収録。'
        else
            note = song.note
            if !note.end_with?("。")
                note = note + "。"
            end
            note = note + 'Al「成長の記録　～全曲バンドで録り直し～」には2019 Ver.として収録。'
            song.note = note
        end
        song.save
    else
        p '見つからない -> ' + name
    end
}
