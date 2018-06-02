const client = require('cheerio-httpcli');

const artistId = '1000430_2';

const startPageNum = 0;
const endPageNum = 4;

var urls = [];

for (let i = startPageNum; i <= endPageNum; i++) {
  var targetUrl = `https://www.utamap.com/searchartist.php?page=${i}&artistid=${artistId}&sortname=1`;

  var result1 = client.fetchSync(targetUrl);

  result1.$('.ct140 a').each(function (idx) {
    console.log(result1.$(this).text());
  });

  // client.fetch(targetUrl, function (err, $, res, body) {
  //   // レスポンスヘッダを参照
  //   // console.log(res.headers);

  //   // HTMLタイトルを表示
  //   $('.ct140 a').each(function (idx) {
  //     urls.push($(this).attr('href'));
  //   });

  //   // リンク一覧を表示
  //   // $('a').each(function (idx) {
  //   //   console.log($(this).attr('href'));
  //   // });
  //   console.log(`i = ${i}`);
  //   console.log(urls);
  // });
}

