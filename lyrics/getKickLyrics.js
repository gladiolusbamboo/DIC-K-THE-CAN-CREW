const client = require('cheerio-httpcli');

const artistId = '1000405_1';

const startPageNum = 0;


var urls = [];

var fs = require('fs');

for (let i = startPageNum; true; i++) {
  console.log(`i = ${i}`);
  var targetUrl = `https://www.utamap.com/searchartist.php?page=${i}&artistid=${artistId}&sortname=1`;

  var result1 = client.fetchSync(targetUrl);

  if (result1.$('.ct140 a').length == 0) {
    analyze();
    break;
  }

  result1.$('.ct140 a').each(function (idx) {
    urls.push(result1.$(this).attr('href'));
  });
}


// urls.each(function(val,index, arr){
//   console.log(`val = ${val}`);
//   console.log(`index = ${index}`);
//   console.log(`arr = ${arr}`);
// })

function analyze() {
  console.log('analyze')
  console.log(urls);
  urls.forEach(function (val, index, arr) {
    url = val;

    result1 = client.fetchSync(url);
    sleep(2000);
    const title = result1.$('.kasi1').text().replace(/"/g," ").replace(/\?/g," ").replace(/\./g," ").replace(/[,'!]/g," ");
    const lyric = result1.$('td.kasi_honbun').html().replace('<!-- 歌詞 end -->', '').replace(/<br>/g, '\n').replace(/ /g, '\n');

    console.log(lyric);

    //使用例
    fs.writeFile( `${title}_original_2.txt` , lyric , (err) => {
      // 書き出しに失敗した場合
      if(err){
        console.log("エラーが発生しました。" + err)
        throw err
      }
      // 書き出しに成功した場合
      else{
        console.log("ファイルが正常に書き出しされました")
      }
    });
  });

  //引数にはミリ秒を指定します。（例：5秒の場合は5000）
  function sleep(a) {
    var dt1 = new Date().getTime();
    var dt2 = new Date().getTime();
    while (dt2 < dt1 + a) {
      dt2 = new Date().getTime();
    }
    return;
  }

  //ファイルの書き込み関数
  function writeFille(path, data) {
    console.log (`path = ${path}`)
    console.log (`data = ${data}`)
    fs.writeFileSync(path, data, function (err) {
      if (err) {
        throw err;
      }
    });
  }

}

