class SearchController < ApplicationController
  require 'nkf'

  def result
    @trimmed_search_word = params[:searchword].gsub(" ","").gsub("　","")
    unless (params[:searchtype] == 'ルビ検索')     
      # 結果表示に必要な情報を取得する
      # リリース日が古い順、歌詞の順番順に表示する
      query_results = Lyric.includes(song: :cd)
                          .where("lyric like '%#{@trimmed_search_word}%'")
                          .order("cds.released_at ASC", lyric_order: :ASC)
      # 曲ごとに結果を表示するため、song_idを主キーとするハッシュにまとめる
      # ハッシュの中身は配列になっているので表示のときには二重にeach_withしてやる必要がある
      hash_to_hit_song_infos(query_results)
    else
      @trimmed_search_word = NKF.nkf('-w --hiragana', @trimmed_search_word)
      # 結果表示に必要な情報を取得する
      # リリース日が古い順、歌詞の順番順に表示する
      query_results = Lyric.includes(song: :cd)
                          .where("ruby like '%#{@trimmed_search_word}%'")
                          .order("cds.released_at ASC", lyric_order: :ASC)
      # 曲ごとに結果を表示するため、song_idを主キーとするハッシュにまとめる
      # ハッシュの中身は配列になっているので表示のときには二重にeach_withしてやる必要がある
      hash_to_hit_song_infos(query_results)
    end
  end

  private
  # 曲ごとに結果を表示するため、song_idを主キーとするハッシュにまとめる
  # ハッシュの中身は配列になっているので表示のときには二重にeach_withしてやる必要がある
  def hash_to_hit_song_infos query_results
    @hit_song_infos = {}

    query_results.each do |result|
      song_id = result.song_id
      if !@hit_song_infos.has_key? song_id
        @hit_song_infos[song_id] = []
      end
      @hit_song_infos[song_id] << result
    end
  end
end
