// YouTube Player APIの読み込み
var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
// プレイヤーを埋め込む場所(IDを指定)
var ytArea = 'video-background';
// 埋め込むYouTube動画のID
// KICK THE CAN CREW
var ytID = 'wFKvOPQyVL0';
// プレイヤーの埋め込み
function onYouTubeIframeAPIReady() {
  ytID = getYouTubeID();
  ytPlayer = new YT.Player(ytArea, {
    videoId: ytID,
    playerVars: {
      rel: 0, // 関連動画の非表示
      controls: 0, // プレイヤーコントロールの非表示
      showinfo: 0, // タイトルなどの非表示
      modestbranding: 1, // YouTubeロゴの非表示
      iv_load_policy: 3, // アノテーションの非表示
      wmode: 'transparent'
    },
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange
    }
  });
}

function getYouTubeID() {
  youtubeIDLength = [
    // KICK THE CAN CREW
    'wFKvOPQyVL0', // 千％

    // KREVA
    '7-HEkkTSI6k', // 希望の炎
    '7FJZWjGjEBc', // イッサイガッサイ
    'D1no4bI4dSQ', // It's for you
    'V29ypwiF8x8', // Have a nice day!
    'z25vDfZqNaI', // アグレッシ部
    'Dy9ZPjwNAmA', // ビコーズ
    'jIjDxgXcKMI', // スタート
    'WRFwZY8Pm6w', // 音色
    'ASyGLelLMLs', // ひとりじゃないのよ
    'NG2dmHsVm80', // 国民的行事
    'RJu8wi7aA0A', // THE SHOW
    'rSAyBoMImaQ', // くればいいのに
    'Ti_OzY5bKQ4', // ストロングスタイル
    'uFGoMUWz5rE', // 成功
    'WOArYjA93vY', // 生まれてきてありがとう
    '_Vct0sg_cz4', // 瞬間スピーチレス
    'Pt676ytVCQ0', // かも
    'KGXwgfixOjo', // 挑め
    '4y1MOoYrXXM', // C'mon, Let's go
    'IViueTs20II', // KILA KILA
    '0HM9TuoHkTQ', // 基準
    '2oMCy5hqhxA', // OH YEAH
    'fXgAOhURDpo', // 王者の休日
    'EFlhX5gaa-A', // BESHI
    '9Z4dkqUmL3E', // トランキライザー
    'B9kV2qFpDEc', // 全速力
    'x0Pcn_OoKzs', // Under The Moon

    // LITTLE
    'SMnCLqst-Ao', // 愛はある
    'DyyshApgQp8', // Beach Sun Girl feat. Una
    '80ps2jHpmME', // and you...
    '_HYjzw-fpvg', // FUNKY ウーロンハイ

    // UL
    'rZGu3a6Vz4o', // 「Boys&Gentlemen」Trailer
    '_m_gEbQkk-0', // 馬ッ鹿者 feat. 増子直純(怒髪天)
    'fsPH4S4Ylw4', // 「One Mic / アリとキリギリス」【LIVE映像】
    '6pVI56OjA1M', // La La Like a Love Song
    '3hebZ8jMKh8', // アルバム「ULTRAP」ダイジェストMV【4曲mix】
  ];

  const randomInteger = Math.floor(Math.random() * youtubeIDLength.length);

  return youtubeIDLength[randomInteger];
}
// 動画の準備完了後の動作
function onPlayerReady(e) {
  ytPlayer.playVideo();
  ytPlayer.mute();
  ytPlayer.setPlaybackQuality('default'); // 画質(small・medium・large・hd720・hd1080・highres・default)
}
// 動画再生中と再生後の動作
function onPlayerStateChange(e) {
  var ytStatus = e.target.getPlayerState();
  if (ytStatus == YT.PlayerState.PLAYING) { //再生中
  }
  if (ytStatus == YT.PlayerState.ENDED) { //再生後
    ytPlayer.playVideo();
    ytPlayer.mute();
  }
}
// 上下左右に出てくる黒帯を非表示
var WIN = $(window);
var WIN_H
var win_W
function yt_screen_retio() {
  WIN_H = WIN.height();
  WIN_W = WIN.width();
  var screen_switch = 0.5625;
  var screen_ratio = WIN_H / WIN_W;
  var ratio_H = WIN_H / screen_switch;
  var ratio_W = WIN_W * screen_switch;
  if (screen_ratio > screen_switch) {
    $('#video-background').css({
      'height': '100%',
      'width': ratio_H,
      'margin-top': '0',
      'margin-left': -ratio_H / 2,
      'left': '50%',
      'top': '0'
    });
  } else {
    $('#video-background').css({
      'width': '100%',
      'height': ratio_W,
      'margin-top': -ratio_W / 2,
      'margin-left': '0',
      'top': '50%',
      'left': '0'
    });
  }
}
WIN.resize(function () {
  yt_screen_retio();
});
$(function () {
  yt_screen_retio();
});
