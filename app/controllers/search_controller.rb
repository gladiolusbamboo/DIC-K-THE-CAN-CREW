class SearchController < ApplicationController
  # カタカタ←→ひらがな変換のためのライブラリ
  require 'nkf'

  def index
    # form_forでフォームを描画するために空のインスタンスが必要
    @search_log = SearchLog.new
    # 重複排除のSQLが複雑なため関数化
    @recent_search_logs = getRecentSearchLogs

    # @popular_search_logsは以下のような構造
    # search_log[0][0][0] = "表記検索"
    # search_log[0][0][1] = "KREVA"
    # search_log[0][1] = 10(検索回数)
    # search_log[0][2] = 25(ヒット曲数)
    # search_log[1][0][0] = "ルビ検索"
    # search_log[1][0][1] = "くれば"
    # search_log[1][1] = 9(検索回数)
    # search_log[1][2] = 20(ヒット曲数)
    # ︙
    # データ追加のタイミングで結果が異なってい可能性があるので２回にわけて検索する。
    # 処理が長くなるので関数化
    @popular_search_logs = getPopularSearchLogs

    # ヒット曲数×文字列長を得点として得点順に取得する
    @highscore_search_logs = SearchLog.select(:searchword, :searchtype, :hit_song_count, 'hit_song_count * LENGTH(searchword) as score')
        .order('score DESC')
        .distinct
        .limit(20)

  end

  def result
    # 入力された文字列から空白文字を削除
    @trimmed_search_word = params[:search_log][:searchword].gsub(" ","").gsub("　","")
    @trimmed_search_word = full_to_half @trimmed_search_word
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

  # LIKE検索のSQLインジェクション対策
  def escape_like(string)
    string.gsub(/[\\%_]/){|m| "\\#{m}"}
  end

  # 全角→半角変換処理
  def full_to_half(txt)
    txt.tr('０-９ａ-ｚＡ-Ｚ', '0-9a-zA-Z')
  end

  def getRecentSearchLogs()
    # 検索内容の重複排除のためサブクエリを使用している
    SearchLog.find_by_sql('
      SELECT
        id,
        searchword,
        searchtype,
        hit_song_count,
        created_at
      FROM	search_logs
      AS 	a
      WHERE 
        a.hit_song_count > 0
        AND NOT EXISTS
        (
          SELECT	id
          FROM	search_logs
          AS B
          WHERE A.created_at < B.created_at
          AND A.searchword = B.searchword 
          AND B.searchtype = B.searchtype
        )
      ORDER BY created_at DESC
      LIMIT 20'
    )
  end

  # データ追加のタイミングで結果が異なってい可能性があるので
  # ２回にわけて検索している
  def getPopularSearchLogs()
    popular_search_logs = SearchLog.group(:searchtype, :searchword)
                                    .where('hit_song_count > 0')
                                    .order('count_all desc')
                                    .limit(20)
                                    .count

    popular_search_logs_clone = []
    popular_search_logs.each do |log|
      # 指定の条件での最新レコードから結果を取得する
      latest_search_log = SearchLog.where(searchtype: log[0][0], searchword: log[0][1])
                            .order(created_at: :desc)
                            .limit(1)[0]
      hit_count = latest_search_log.hit_song_count
      log << hit_count
      popular_search_logs_clone << log
    end
    popular_search_logs_clone
  end
end
