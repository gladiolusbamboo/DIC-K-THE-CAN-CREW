function checkTextBox() {
  // alert ('check')
  const txt = document.getElementById('searchword').value.replace(' ','').replace('　','')
  // alert(txt);
  if (txt) {
    // alert ("OK00");
    // console.log("TRUE");
    $('#lyric_search')[0].disabled = false;
    // document.getElementById('lyric_search').disabled = false;
    if (isAllKana(txt)) {
      document.getElementById('ruby_search').disabled = false;
    }else{
      document.getElementById('ruby_search').disabled = true;      
    }
  }else{
    $('#lyric_search')[0].disabled = true;
    // document.getElementById('lyric_search').disabled = true;    
  }
}

function isAllKana(str) {
  str = (str == null) ? "" : str;
  if (str.match(/^[ぁ-んァ-ヶー　]*$/)) {    //"ー"の後ろの文字は全角スペースです。
    return true;
  } else {
    return false;
  }
}

