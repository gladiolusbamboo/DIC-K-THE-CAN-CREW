// ページの読み込みが終了したら発火 
$(document).ready(function () {
  // id='searchword'の有無で表示中のページを判定している
  // かるかに正しい方法があるような気がする
  if (document.getElementById('search_log_searchword')) {
    // テキストボックスの入力値がすべてひらがなorカタカナであるか判定
    checkTextBoxAllKana();
  }
});

// テキストボックスの入力値がすべてひらがなorカタカナであるか判定
function checkTextBoxAllKana() {
  // alert('cec');
  // 空白文字は位置を問わず削除
  const txt = document.getElementById('search_log_searchword').value.replace(' ', '').replace('　', '')
  if (txt) {
    // すべてひらがなかカタカナであればルビ検索を可能にする
    // 表記検索の方はValidateで対応する
    if (isAllKana(txt)) {
      $('#ruby_search')[0].disabled = false;
    } else {
      $('#ruby_search')[0].disabled = true;
    }
  } else {
    // 何も入力されてない時は検索させない
    $('#ruby_search')[0].disabled = true;
  }
}

// 文字列がすべてひらがなかカタカナであるかを判定する
function isAllKana(str) {
  str = (str == null) ? "" : str;
  if (str.match(/^[ぁ-んァ-ヶー]*$/)) {
    return true;
  } else {
    return false;
  }
}

