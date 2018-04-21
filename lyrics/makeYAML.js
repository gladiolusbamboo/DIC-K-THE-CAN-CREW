const songTitle = process.argv[2];
const engSongTitle = process.argv[3];
const fs = require('fs');

const yamlFileName = `./${songTitle}.yml`;
const lyricFileName = `./${songTitle}_lyric.txt`;
const rubyFileName = `./${songTitle}_ruby.txt`;
const lyricWithRubyFileName = `./${songTitle}_lyric_with_ruby.txt`;

// console.log(songTitle)
// console.log(engSongTitle)

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

