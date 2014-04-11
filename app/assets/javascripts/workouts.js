// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

window.onload = function() {
    // Video
    var video = document.getElementById("video");
    // Buttons
    var playButton = document.getElementById("play-pause");
    var muteButton = document.getElementById("mute");
    var fullScreenButton = document.getElementById("full-screen");
    // Sliders
    var seekBar = document.getElementById("seek-bar");
    var volumeBar = document.getElementById("volume-bar");

    playButton.addEventListener("click", function() {
        if (video.paused == true) {
            video.play();
            playButton.innerHTML = "<span class='glyphicon glyphicon-pause'></span>";
        } else {
            video.pause();
            playButton.innerHTML = "<span class='glyphicon glyphicon-play'></span>";
        }
    });

    muteButton.addEventListener("click", function() {
        if (video.muted == false) {
            video.muted = true;
            muteButton.innerHTML = "<span class='glyphicon glyphicon-volume-off'></span>";
        } else {
            video.muted = false;
            muteButton.innerHTML = "<span class='glyphicon glyphicon-volume-up'></span>";
        }
    });

    fullScreenButton.addEventListener("click", function() {
        if (video.requestFullscreen) {
            video.requestFullscreen();
        } else if (video.mozRequestFullScreen) {
            video.mozRequestFullScreen(); // Firefox
        } else if (video.webkitRequestFullscreen) {
            video.webkitRequestFullscreen(); // Chrome and Safari
        }
    });

    // Event listener for the seek bar
    seekBar.addEventListener("change", function() {
        video.currentTime = video.duration * (seekBar.value / 100);
    });

    // Update the seek bar as the video plays
    video.addEventListener("timeupdate", function() {
        seekBar.value = (100 / video.duration) * video.currentTime;
    });

    // Pause the video when the slider handle is being dragged
    seekBar.addEventListener("mousedown", function() {
        video.pause();
        playButton.innerHTML = "<span class='glyphicon glyphicon-play'></span>";
    });

    // Play the video when the slider handle is dropped
    seekBar.addEventListener("mouseup", function() {
        video.play();
        playButton.innerHTML = "<span class='glyphicon glyphicon-play'></span>";
    });

    // Event listener for the volume bar
    volumeBar.addEventListener("change", function() {
        // Update the video volume
        video.volume = volumeBar.value;
    });
}



function counter(time){
    var flag = false;
	var mins = Math.floor(time/60);
	var secs = time%60;
	count = setInterval(function(){
        secs--;
        if(secs == -1){
            secs = 59;
            mins--;
            if(mins == -1){
                clearInterval(count);
                flag = true;
            }
        }
        if(secs < 10 || mins < 10){
            if(secs < 10 && mins < 10)
                content = '0' + mins + ':' + '0' + secs;
            else if(secs >= 10)
                content = '0' + mins + ':' + secs;
            else
                content = mins + ':' + '0' + secs;
        }
        else
            content = mins + ":" + secs;
        document.getElementById("counter").style.fontSize = "large";
        if(!flag)
            document.getElementById("counter").innerHTML = content;
        },1000);
    document.getElementById("counter").innerHTML = "00:00";
}
