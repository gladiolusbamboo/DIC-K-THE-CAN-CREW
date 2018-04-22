const songTitle = process.argv[2];
const fs = require('fs');
const readline = require("readline");

// console.log(songTitle)

const lyricFileName = `./${songTitle}_lyric.txt`;
const rubyFileName = `./${songTitle}_ruby.txt`;
const lyricWithRubyFileName = `./${songTitle}_lyric_with_ruby.txt`;

const stream = fs.createReadStream(lyricWithRubyFileName);
const reader = readline.createInterface({ input: stream });

fs.writeFileSync(lyricFileName, "");
fs.writeFileSync(rubyFileName, "");

const reg = /{(.*?),(.*?)}/g;

reader.on("line", (data) => {
  // console.log(data);
  if (data.slice(0, 1) === '[' && data.slice(-1) === ']') {
    fs.appendFileSync(lyricFileName, `${data}\n`);
    fs.appendFileSync(rubyFileName, `${data}\n`);
  } else {
    let regexArray = [];
    let myArray;
    while (myArray = reg.exec(data)) {
      // console.log(myArray[0]);
      // console.log(myArray[1]);
      // console.log(myArray[2]);
      regexArray.push(new Array(myArray[0], myArray[1], myArray[2]));
    }
    let lyric = data;
    let ruby = data;
    regexArray.forEach(element => {
      lyric = lyric.replace(element[0],element[1].trim());
      ruby = ruby.replace(element[0],element[2]);
    });
    // console.log(lyric);
    // console.log(ruby);
    fs.appendFileSync(lyricFileName, `${lyric.replace(/ /g, '')}\n`);
    fs.appendFileSync(rubyFileName, `${ruby}\n`);
  }
});