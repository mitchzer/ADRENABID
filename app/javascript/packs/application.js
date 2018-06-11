import "bootstrap";

import { startTimer } from '../components/timer.js';


window.app = {
  startTimer: startTimer
}


// import '../components/landing-animation.js';


$(function() {
  let logoWidth = '80%';

  if (window.innerWidth < 540) {
    console.log("Hello World");
    logoWidth = '80%';
  }
  else {
    logoWidth = 540;
  }


  var runTime = 3;
  var runOffset = 0.22;
  var runOffsetMili = 200;
  var runTimeOffset = runTime - runOffset;

  function animate1() {
    var line1Repeat = new TimelineMax({
        paused: true
      }),
      line2Repeat = new TimelineMax({
        paused: true
      }),
      line3Repeat = new TimelineMax({
        paused: true,
        onComplete: function() {
          line1Repeat.restart();
          line2Repeat.restart();
          this.restart();
        }
      }),
      firstLine = new TimelineMax({
        onComplete: function() {
          line1Repeat.play();
          line2Repeat.play();
          line3Repeat.play();
        }
      });

    firstLine.set("#Layer_1", {
        zIndex: 15
      })
      .to("#svgRect", runTime, {
        attr: {
          width: logoWidth
        },
        ease: Power0.easeNone
      })

    line1Repeat.set("#Layer_1", {
        zIndex: 5
      })
      .set("#svgRect", {
        attr: {
          width: 0
        },
        delay: runTime
      })
      .set("#Layer_1", {
        zIndex: 0,
        delay: runTime
      }) //Delay for 3rd layer
      .set("#Layer_1", {
        zIndex: 15
      })
      .to("#svgRect", runTime, {
        attr: {
          width: logoWidth
        },
        ease: Power0.easeNone
      });

    line2Repeat.set("#Layer_2", {
        zIndex: 15
      })
      .to("#svgRect2", runTime, {
        attr: {
          width: logoWidth
        },
        ease: Power0.easeNone
      })
      .set("#Layer_2", {
        zIndex: 5
      })
      .set("#svgRect2", {
        attr: {
          width: 0
        },
        delay: runTime
      })
      .set("#Layer_2", {
        zIndex: 0,
        delay: runTime
      }); //Delay for 3rd layer

    line3Repeat.set("#Layer_3", {
        zIndex: 0,
        delay: runTime
      }) //Delay for 3rd layer
      .set("#Layer_3", {
        zIndex: 15
      })
      .to("#svgRect3", runTime, {
        attr: {
          width: logoWidth
        },
        ease: Power0.easeNone
      })
      .set("#Layer_3", {
        zIndex: 5
      })
      .set("#svgRect3", {
        attr: {
          width: 0
        },
        delay: runTime
      });
  }

  function animateBox() {
    var rectAnimate = new TimelineMax({
      onComplete: function() {
        this.restart();
      }
    });

    rectAnimate.to("#rect1", runTime, {
        width: logoWidth,
        ease: Power0.easeNone
      })
      .set("#rect1", {
        width: 0
      });
  }

  function animateBox2() {
    var rectPause = new TimelineMax({
      onComplete: function() {
        this.restart();
      }
    });

    rectPause.set("#rect2", {
        width: logoWidth,
        delay: runTimeOffset
      })
      .to("#rect2", 0, {
        width: 0,
        delay: runOffset
      });
  }

  animateBox();
  setTimeout(function() {
    animate1();
    animateBox2();
  }, runOffsetMili);

});
