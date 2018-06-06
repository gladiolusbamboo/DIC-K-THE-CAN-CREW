
const songTitle = process.argv[2];
const fs = require('fs');
const readline = require("readline");
const iconv = require('iconv-lite');

const dictionaryFileName = `./dictionary.txt`;
const dictionaryStream = fs.createReadStream(dictionaryFileName, 'utf8');
const dictionaryReader = readline.createInterface({ input: dictionaryStream });
const regDictionary = /([A-Za-z'\d]+?),(.*)/
let dictionary = {};
dictionaryReader.on("line", (data) => {
  let myArray = regDictionary.exec(data);
  dictionary[myArray[1]] = myArray[2];
});


const mecabFileName = `./${songTitle}_mecab.txt`;
const lyricWithRubyFileName = `./${songTitle}_lyric_with_ruby.txt`;

const stream = fs.createReadStream(mecabFileName)
  .pipe(iconv.decodeStream("Shift-JIS"));
const reader = readline.createInterface({ input: stream });

let isLyric = false;
let isNewLine = false;

var WORD_TYPE = {
  START_PARENTHESIS: 0,
  OTHER: 1,
  END_PARENTHESIS: 2
};

fs.writeFileSync(lyricWithRubyFileName, "");

var isFirst = true;

reader.on("line", (data) => {
  // console.log(dictionary);
  const strArr = data.split('\t');
  wordType = WORD_TYPE.OTHER;
  // console.log(strArr);
  if (strArr[0] === '[') {
    wordType = WORD_TYPE.START_PARENTHESIS;
    isLyric = false;
  } else if (strArr[0] === ']') {
    wordType = WORD_TYPE.END_PARENTHESIS;
  }

  // if (isLyric) {
  if (wordType === WORD_TYPE.START_PARENTHESIS) {
    if (!isFirst) {
      fs.appendFileSync(lyricWithRubyFileName, '\n');
    }
    isNewLine = true;
  }
  if (strArr[0] === 'EOS') {
    if (!isNewLine) {
      fs.appendFileSync(lyricWithRubyFileName, '{ ,}');
    } else {
      isNewLine = false;
    }
  } else {
    if (isLyric) {
      if (isHiragana(strArr[0])) {
        fs.appendFileSync(lyricWithRubyFileName, strArr[0]);
      } else if (isKatakana(strArr[0])) {
        fs.appendFileSync(lyricWithRubyFileName, `{${strArr[0]},${katakanaToHiragana(strArr[0])}}`);
      } else {
        elementArr = strArr[1].split(',')
        if (elementArr.length >= 8) {
          // console.log(elementArr[0]+'@@@');
          // console.log(strArr[0]);
          if (elementArr[0] !== '記号')
            fs.appendFileSync(lyricWithRubyFileName, `{${strArr[0]},${katakanaToHiragana(elementArr[7])}}`);
          else if (strArr[0] === 'ー' || strArr[0] === '～')
            fs.appendFileSync(lyricWithRubyFileName, `{${strArr[0]},ー}`);
          else
            fs.appendFileSync(lyricWithRubyFileName, `{${strArr[0]},}`);
        } else {
          if (dictionary[strArr[0].toUpperCase()]) {
            // console.log('hakken');
            fs.appendFileSync(lyricWithRubyFileName, `{${strArr[0]},${dictionary[strArr[0].toUpperCase()]}}`);
          } else {
            // console.log('mihakken');
            fs.appendFileSync(lyricWithRubyFileName, `{${strArr[0]},}`);
          }
        }
      }
    } else {

      fs.appendFileSync(lyricWithRubyFileName, strArr[0]);
    }
  }
  if (wordType === WORD_TYPE.END_PARENTHESIS) {
    fs.appendFileSync(lyricWithRubyFileName, '\n');
  }
  isFirst = false;
  if (strArr[0] === ']') {
    isLyric = true;
  }
  // console.log(`###${strArr[0]}`);
  // }
});

function katakanaToHiragana(src) {
  return src.replace(/[\u30a1-\u30f6]/g, function (match) {
    var chr = match.charCodeAt(0) - 0x60;
    return String.fromCharCode(chr);
  });
}

function isHiragana(str) {
  str = (str == null) ? "" : str;
  if (str.match(/^[ぁ-んー　]*$/)) {    //"ー"の後ろの文字は全角スペースです。
    return true;
  } else {
    return false;
  }
}

function isKatakana(str) {
  str = (str == null) ? "" : str;
  if (str.match(/^[ァ-ヶー　]*$/)) {    //"ー"の後ろの文字は全角スペースです。
    return true;
  } else {
    return false;
  }
}
