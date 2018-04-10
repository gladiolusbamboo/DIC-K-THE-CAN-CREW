class SearchController < ApplicationController
  def index
    @lyrics = Lyric.where("lyric like '%夕陽%'")
  end

  def result
    # 結果表示に必要な情報を取得する
    # リリース日が古い順に表示する
    query_results = Lyric.includes(song: :cd)
                          .where("lyric like '%#{params[:searchword]}%'")
                          .order("cds.released_at ASC")
    # pp @query_results.inspect

    # 曲ごとに表示するため、song_idを主キーとするハッシュにまとめる
    # ハッシュの中身は配列になっているので表示のときには二重にeach_withしてやる必要がある
    @hit_song_infos = {}

    query_results.each do |result|
      # pp result.song.inspect
      song_id = result.song_id
      if !@hit_song_infos.has_key? song_id
        @hit_song_infos[song_id] = []
      end
      @hit_song_infos[song_id] << result
    end
    # pp @hit_song_infos.inspect
  end
end
