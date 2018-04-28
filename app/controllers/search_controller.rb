class SearchController < ApplicationController
  # カタカタ←→ひらがな変換のためのライブラリ
  require 'nkf'

  def index
    # form_forでフォームを描画するために空のインスタンスが必要
    @search_log = SearchLog.new
    @recent_search_logs = SearchLog.where('hit_song_count > 0')
                                  .order(created_at: :desc)
                                  .limit(20)
    @popular_search_logs = SearchLog.group(:searchtype, :searchword)
                                    .order('count_all desc')
                                    .limit(100)
                                    .count
    popular_search_logs_clone = []
    @popular_search_logs.each do |log|
      hit_count  = SearchLog.find_by(searchtype: log[0][0], searchword: log[0][1]).hit_song_count
      if hit_count > 0
        log << hit_count
        popular_search_logs_clone << log
        if popular_search_logs_clone.count >= 20
          break
        end
      end
    end
    @popular_search_logs = popular_search_logs_clone
  end

  def result
    # 入力された文字列から空白文字を削除
    @trimmed_search_word = params[:search_log][:searchword].gsub(" ","").gsub("　","")
    if params[:searchtype] == '表記検索'
      # 表記検索ならアルファベット小文字は全て大文字にする
      @trimmed_search_word.upcase!      
    else
      # ルビ検索ならカタカナをひらがなに変換する
      @trimmed_search_word = NKF.nkf('-w --hiragana', @trimmed_search_word)
    end
    # SearchLogの登録に必要なパラメータ（検索語・検索タイプ・IPアドレス）を追加する
    params[:search_log][:searchword] = @trimmed_search_word
    params[:search_log][:searchtype] = params[:searchtype]
    params[:search_log][:ip_address] = request.remote_ip

    # 検証用SearchLog生成
    @search_log = SearchLog.new(search_log_params)

    # 一旦、検証のみ行う
    # 検証に引っかかったら
    unless @search_log.valid?
      # エラー情報を渡してトップページにリダイレクトする
      redirect_to ({action: :index}), flash: {errors: @search_log.errors.full_messages}
    else
      query_results  = nil
      # searchtypeが'ルビ検索'以外なら表記検索を行う
      # (基本的には「ルビ検索」or「表記検索」以外はバリデートではじかれるはず)
      unless (params[:search_log][:searchtype] == 'ルビ検索')     
        # 結果表示に必要な情報を取得する
        # リリース日が古い順、歌詞の順番順に表示する
        # 大文字小文字の違いは無視する
        query_results = Lyric.includes(song: :cd)
                            .where("UPPER(lyric) like ?", "%#{escape_like(@trimmed_search_word)}%")
                            .order("cds.released_at ASC", lyric_order: :ASC)
      else
        # 結果表示に必要な情報を取得する
        # リリース日が古い順、歌詞の順番順に表示する
        query_results = Lyric.includes(song: :cd)
                            .where("ruby like ?", "%#{escape_like(@trimmed_search_word)}%")
                            .order("cds.released_at ASC", lyric_order: :ASC)
      end

      # 曲ごとに結果を表示するため、song_idを主キーとするハッシュにまとめる
      # ハッシュの中身は配列になっているので表示のときには二重にeachしてやる必要がある
      hash_to_hit_song_infos(query_results)
      # ヒット件数情報をparamsに追加して改めてSearchLogを生成する
      params[:search_log][:hit_song_count] = @hit_song_infos.length
      @search_log = SearchLog.new(search_log_params)

      # DBに保存する
      unless @search_log.save
        # 保存に失敗したらエラー情報を渡してトップページにリダイレクトする
        redirect_to ({action: :index}), flash: {errors: @search_log.errors.full_messages}
      end
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

  def search_log_params
    # Modelの編集を許可している
    params.require(:search_log).permit(:searchtype, :searchword, :hit_song_count, :ip_address)
  end

  def escape_like(string)
    string.gsub(/[\\%_]/){|m| "\\#{m}"}
  end
end
