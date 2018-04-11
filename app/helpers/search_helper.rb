module SearchHelper
  def show_searchwords_in_lyric info_arr, searchword
    "show_searchwords_in_lyric"
    # lyric_original = info_arr[0].lyric.clone
    # pp "lyric_original = #{lyric_original}"
    reg = /(#{searchword})/
    content_tag(:ul) do
      info_arr.each do |info|
        lyric_original = info.lyric.clone
        index_arr = []
        lyric_tmp = info.lyric

        while (index = lyric_tmp =~ reg) do
          pp "lyric_tmp = #{lyric_tmp}"
          pp "index = #{index}"
          if index_arr.length == 0
            pp'IUIU'
            index_arr << index
          else
            pp'ABAB'
            pp "index_arr[-1] = #{index_arr[-1]}"
            insert_index = index + index_arr[-1] + searchword.length
            index_arr << insert_index
          end
          lyric_tmp = lyric_tmp.slice!(index+searchword.length..-1)
          pp "lyric_tmp = #{lyric_tmp}"
        end
        pp "========index_arr = #{index_arr}"


        index_arr.each do |index|
          concat(
            content_tag(:li) do
              start_index = index-5
              if start_index < 0 
                start_index = 0
              end
              length = index - start_index
              pp "lyric_original = #{lyric_original}"
              pp "start_index = #{start_index}"
              pp "length = #{length}"
              concat lyric_original.slice(start_index,length)
              concat content_tag(:b, searchword)
              concat lyric_original.slice(index+searchword.length, 5)
              concat "(#{info.lyric_type.name}#{info.lyric_order} by #{info.singer.name})"
            end
          )
        end


        pp "index = #{index}"

      end
    end
    # <% info_arr.each do |info| %>
    #   <li><%= highlight(extract_search_word(params['searchword'], info.lyric), params['searchword']) %>(<%= info.lyric_type.name %><%= info.lyric_order %> by <%= info.singer.name %>)</li>
    # <% end %>

  end
end
