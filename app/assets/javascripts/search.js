// ページの読み込みが終了したら発火 
$(document).ready(function () {
  // id='search_log_searchword'の有無で表示中のページを判定している
  // はるかに正しい方法があるような気がする
  if ($('#search_log_searchword')) {
    // テキストボックスの入力値がすべてひらがなorカタカナであるか判定
    checkTextBoxAllKana();
  }
});

// テキストボックスの入力値がすべてひらがなorカタカナであるか判定
function checkTextBoxAllKana() {
  // 空白文字は位置を問わず削除
  const txt = $('#search_log_searchword')[0].value.replace(' ', '').replace('　', '')

  // すべてひらがなかカタカナであればルビ検索を可能にする
  // 表記検索の方はValidateで対応する
  if (txt && isAllKana(txt)) {
      $('#ruby_search')[0].disabled = false;
  } else {
    // 何も入力されてないorすべてがひらがなかカタカナでない時は検索させない
    $('#ruby_search')[0].disabled = true;
  }
}

// テキストボックスに入力された文字列がすべてひらがなかカタカナであるかを判定する
function isAllKana(str) {
  str = (str == null) ? "" : str;
  if (str.match(/^[ぁ-んァ-ヶー　 ]*$/)) {
    return true;
  } else {
    return false;
  }
}

