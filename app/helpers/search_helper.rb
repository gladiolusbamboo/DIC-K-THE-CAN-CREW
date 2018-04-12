module SearchHelper
  def show_searchwords_in_lyric info_arr, searchword
    content_tag(:ul) do
      # info_arrはLyricモデルの配列
      info_arr.each do |info|
        lyric_original = info.lyric
        index_arr = []

        # 正規表現だとマッチングが重なる部分が
        # うまくいかないのでindex()を使う
        offset = 0
        while (index = lyric_original.index(searchword, offset)) do
          index_arr << index
          offset = index + 1
        end

        # index_arrにはsearchwordの出現位置が格納されている
        index_arr.each do |index|
          concat(
            content_tag(:li) do
              # lyricの先頭付近にsearchwordがあった場合の対策
              start_index = index - 5
              if start_index < 0 
                start_index = 0
              end
              length = index - start_index
              # pp "lyric_original = #{lyric_original}"
              # pp "start_index = #{start_index}"
              # pp "length = #{length}"
              
              # searchword直前の５文字切り出し
              concat lyric_original.slice(start_index,length)
              # searchwordを切り出して強調
              concat content_tag(:b, searchword)
              # searchword直後の５文字切り出し
              concat lyric_original.slice(index+searchword.length, 5)
              concat "(#{info.lyric_type.name}#{info.part_lyric_order} by #{info.singer.name})"
            end
          )
        end
      end
    end
  end
end
