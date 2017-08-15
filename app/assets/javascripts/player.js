var _audio = $("#music-player")[0],
  _audioDuration = 0,
  _currentTime = 0,
  _buffered = 0,
  _buuferPlayTime = 5;

$(".music-controls .fa").on("click", function() {
  var $this = $(this);
  $(".music-controls .seek-bar").css("animation-play-state", "running");
  if ($this.hasClass("fa-play")) {
    $this.removeClass("fa-play").addClass("fa-pause");
    _audio.play();
    $(".music-controls .seek-bar").addClass("is-animate");
  } else {
    $(".music-controls .seek-bar").css("animation-play-state", "paused");
    $this.removeClass("fa-pause").addClass("fa-play");
    $(".music-controls .seek-bar");
    _audio.pause();
  }
});

var _setAudioDuration = setInterval(function() {
  _audioDuration = _audio.duration;
  if (_audioDuration > 0) {
    $(".song-duration").html(formatAudio(_audioDuration)).css("opacity", 1);
    $(".song-current-time").css("opacity", 1);
    clearInterval(_setAudioDuration);
  }
}, 500);

var _animateSeek = setInterval(function() {
  if ($(".fa").hasClass("fa-pause")) {
    var _percent = (_audio.currentTime * 100) / _audioDuration;
    $(".is-animate").css("width", _percent + "%");

    $(".song-current-time").html(currentTime(_audio.currentTime));
  }
}, 500);

_audio.onended = function() {
  setTimeout(function() {
    _audio.currentTime = 0;
    $(".song-current-time").html(currentTime(_audio.currentTime));
    $(".is-animate").css("width", "0%");

    $(".music-controls .fa").removeClass("fa-pause").addClass("fa-play");
  }, 500);
};

var _checkBuffer = setInterval(function() {
  if (_audioDuration > 0) {
    _buffered = (_audio.buffered.end(_audio.buffered.length - 1) * 100) / _audio.duration;

    $(".music-controls .song-buffer").css("width", _buffered + "%");
    if (_buffered > _buuferPlayTime) {
      $(".wrapper").addClass("showMP");
      $(".fa").css({
        "opacity": "1",
        "pointer-events": "auto"
      });
    }
    if (_buffered == 100) {
      clearInterval(_checkBuffer);
    }
  }
}, 500);

function currentTime(songActivity){
  var _mprefix = "";
  var _sprefix = "";
  var _secs = songActivity;
  var _min = Math.floor(_secs/60);

  var _time = Math.floor(((_secs/60) - _min )*60);
  if(_min < 10){
    _mprefix = "0";
  }
  if(_time < 10){
    _sprefix = "0";
  }
  return _mprefix + _min + ":" + _sprefix + _time;
}

function formatAudio(songActivity) {
  var _mprefix = "",
    _sprefix = "",
    _secs = songActivity,
    _min = Math.floor(_secs / 60),
    _time = Math.floor(((_secs / 60) - _min) * 60);

  if (_min < 10) {
    _mprefix = "0";
  }
  if (_time < 10) {
    _sprefix = "0";
  }
  return _mprefix + _min + ":" + _sprefix + _time;
}
