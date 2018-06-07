
 function startTimer(duration, display) {
      var start = Date.now(),
          diff,
          minutes,
          seconds;
      function timer() {
          // get the number of seconds that have elapsed since
          // startTimer() was called
          diff = duration - (((Date.now() - start) / 1000) | 0);

          // does the same job as parseInt truncates the float
          let minutes = (diff / 60) | 0;
          let seconds = (diff % 60) | 0;
          const hours = minutes / 60 | 0;
          const days = hours / 24 | 0;


          minutes = minutes < 10 ? "0" + minutes : minutes;
          seconds = seconds < 10 ? "0" + seconds : seconds;

          display.textContent = days + " days " + (hours % 24) + " hours " + (minutes % 60) + " minutes and " + seconds + " seconds";

          if (diff < 0) {
              // add one second so that the count down starts at the full duration
              // example 05:00 not 04:59

              window.location.reload(false);
          }
      };
      // we don't want to wait a full second before the timer starts
      timer();
      setInterval(timer, 1000);
  }

  export { startTimer };
