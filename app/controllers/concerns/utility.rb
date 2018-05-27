module Utility
  # シンボルからsearchtypeを判定する
  def get_search_type(searchtype_sym)
    if searchtype_sym != :ruby
      '表記検索'
    else
      'ルビ検索'
    end
  end

  # 出現箇所の添字を配列で取得する
  def get_index_array(lyric_original, searchword)
    index_array = []
    # 正規表現だとマッチングが重なる部分が
    # うまくいかないのでindex()を使う
    offset = 0
    # lyric_originalがアルファベット大文字／小文字混じりなので大文字に統一してやる
    while (index = lyric_original.upcase.index(searchword, offset)) do
      index_array << index
      offset = index + 1
    end
    index_array
  end  
  
end