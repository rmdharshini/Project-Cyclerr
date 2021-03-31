// CYCLE-2 TIMER SCRIPT
function _timer2(callback) {
  var time = 0; //  The default time of the Timer1
  var mode = 1; //    Mode: count up or count down
  var status = 0; //    Status: Timer1 is running or stoped
  var timer1_id; //    This is used by setInterval function

  // this will start the Timer1 ex. start the Timer1 with 1 second interval Timer1.start(1000)
  this.start = function (interval) {
    interval = typeof interval !== "undefined" ? interval : 1000;

    if (status == 0) {
      status = 1;
      timer1_id = setInterval(function () {
        switch (mode) {
          default:
            if (time) {
              time--;
              generateTime();
              if (typeof callback === "function") callback(time);
            }
            break;

          case 1:
            if (time < 86400) {
              time++;
              generateTime();
              if (typeof callback === "function") callback(time);
            }
            break;
        }
      }, interval);
    }
  };

  //  Same as the name, this will stop or pause the Timer1 ex. Timer1.stop()
  this.stop = function () {
    if (status == 1) {
      status = 0;
      clearInterval(timer1_id);
    }
  };

  // Reset the Timer1 to zero or reset it to your own custom time ex. reset to zero second Timer1.reset(0)
  this.reset = function (sec) {
    sec = typeof sec !== "undefined" ? sec : 0;
    time = sec;
    generateTime(time);
  };

  // Change the mode of the Timer1, count-up (1) or countdown (0)
  this.mode = function (tmode) {
    mode = tmode;
  };

  // This methode return the current value of the Timer1
  this.getTime = function () {
    return time;
  };

  // This methode return the current mode of the Timer1 count-up (1) or countdown (0)
  this.getMode = function () {
    return mode;
  };

  // This methode return the status of the Timer1 running (1) or stoped (1)
  this.getStatus;
  {
    return status;
  }

  // This methode will render the time variable to hour:minute:second format
  function generateTime() {
    var second = time % 60;
    var minute = Math.floor(time / 60) % 60;
    var hour = Math.floor(time / 3600) % 60;

    second = second < 10 ? "0" + second : second;
    minute = minute < 10 ? "0" + minute : minute;
    hour = hour < 10 ? "0" + hour : hour;

    $("div.Timer1 span.second").html(second);
    $("div.Timer1 span.minute").html(minute);
    $("div.Timer1 span.hour").html(hour);
  }
}

var Timer1;

$(document).ready(function (e) {
  Timer1 = new _timer2(function (time) {
    if (time == 0) {
      Timer1.stop();
      alert("time out");
    }
  });
  Timer1.reset(0);
  Timer1.mode(0);
});
