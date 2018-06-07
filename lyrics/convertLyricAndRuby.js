const songTitle = process.argv[2];
const fs = require('fs');
const readline = require("readline");

// console.log(songTitle)

const lyricFileName = `./${songTitle}_lyric.txt`;
const rubyFileName = `./${songTitle}_ruby.txt`;
const lyricWithRubyFileName = `./${songTitle}_lyric_with_ruby.txt`;
const dictionaryFileName = `./dictionary.txt`;
const yamlFileName = `./${songTitle}.yml`;

const reg = /{(.*?),(.*?)}/g;
const regDictionary = /([A-Za-z&'\d]+?),(.*)/
const engRegex = /^[A-Za-z&\d]+$/g;

const dictionaryStream = fs.createReadStream(dictionaryFileName, 'utf8');
const dictionaryReader = readline.createInterface({ input: dictionaryStream });
let dictionary = {};
dictionaryReader.on("line", (data) => {
  let myArray = regDictionary.exec(data);
  dictionary[myArray[1]] = myArray[2];
});


const stream = fs.createReadStream(lyricWithRubyFileName);
const reader = readline.createInterface({ input: stream });

fs.writeFileSync(lyricFileName, "");
fs.writeFileSync(rubyFileName, "");

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
      if (myArray[0] === '{,,}') {
        regexArray.push(new Array(myArray[0], ',', ''));
      } else {
        regexArray.push(new Array(myArray[0], myArray[1], myArray[2]));
      }
    }
    let lyric = data;
    let ruby = data;
    regexArray.forEach(element => {
      lyric = lyric.replace(element[0], element[1].trim());
      ruby = ruby.replace(element[0], element[2]);
      if (engRegex.exec(element[1])) {
        dictionary[element[1].toUpperCase()] = element[2];
      }
    });
    // console.log(lyric);
    // console.log(ruby);
    fs.appendFileSync(lyricFileName, `${lyric.replace(/ /g, '')}\n`);
    fs.appendFileSync(rubyFileName, `${ruby}\n`);
  }
});

reader.on('close', function () {
  fs.writeFile(dictionaryFileName, "");
  for(key in dictionary){
    fs.appendFile(dictionaryFileName, `${key},${dictionary[key]}\n`);
  }

  const engSongTitle = process.argv[3];
   
  let lyricArray = fs.readFileSync(lyricFileName, 'utf8').split('\n');
  let rubyArray = fs.readFileSync(rubyFileName, 'utf8').split('\n');
  let lyricWithRubyArray = fs.readFileSync(lyricWithRubyFileName, 'utf8').split('\n');
  
  const regex = /\[(.*),(.*)\]/;
  
  fs.writeFileSync(yamlFileName, "");
  
  let lyric_type_hash = {}
  
  for (let i = 0; i < lyricArray.length; i += 2) {
    const lineEven = lyricArray[i]
    const lineOdd = lyricArray[i + 1]
    if (lineEven && lineOdd) {
      const match = lineEven.match(regex)
      const singer = match[2]
      const lyric_type = match[1]
      if (!lyric_type_hash[lyric_type]) {
        lyric_type_hash[lyric_type] = 0
      }
      lyric_type_hash[lyric_type] += 1
  
      fs.appendFileSync(yamlFileName, `${engSongTitle}${i / 2 + 1}:\n`)
      fs.appendFileSync(yamlFileName, "  song: " + engSongTitle + "_song\n");
      fs.appendFileSync(yamlFileName, "  singer: " + singer + "\n");
      fs.appendFileSync(yamlFileName, "  lyric_type: " + lyric_type + "\n");
      fs.appendFileSync(yamlFileName, "  part_lyric_order: " + lyric_type_hash[lyric_type] + "\n");
      fs.appendFileSync(yamlFileName, "  lyric: " + lineOdd + "\n");
      fs.appendFileSync(yamlFileName, "  ruby: " + rubyArray[i + 1] + "\n");
      let lwr = lyricWithRubyArray[i + 1].replace(/{/g, '\\{').replace(/}/g, '\\}')
      // console.log(lwr)
      fs.appendFileSync(yamlFileName, "  lyric_with_ruby: " + lwr + "\n");
      fs.appendFileSync(yamlFileName, "  lyric_order: " + (i / 2 + 1) + "\n\n");
    }
  
    //   if (i % 2 == 0) {
    //     let m = line.match(regex)
    //     console.log(m)
    //   } else {
    //     console.log(line)
    //   }
    // }
  }
  
  


  console.log('処睆終了')
});