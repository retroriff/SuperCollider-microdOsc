/*
      ___           ___           ___       ___
     /  /\         /  /\         /  /\     /  /\
    /  /:/        /  /::\       /  /:/    /  /::\
   /  /:/        /  /:/\:\     /  /:/    /  /:/\:\
  /  /::\ ___   /  /:/  \:\   /  /:/    /  /::\ \:\
 /__/:/\:\  /\ /__/:/ \__\:\ /__/:/    /__/:/\:\ \:\
 \__\/  \:\/:/ \  \:\ /  /:/ \  \:\    \  \:\ \:\_\/
      \__\::/   \  \:\  /:/   \  \:\    \  \:\ \:\
      /  /:/     \  \:\/:/     \  \:\    \  \:\_\/
     /__/:/       \  \::/       \  \:\    \  \:\
     \__\/         \__\/         \__\/     \__\/

*/

(
~dust = {
    var trig = Impulse.kr(~tempo.kr);
    Greyhole.ar(
        in: Impulse.ar(~tempo.kr * 4),
        delayTime: 0.1,
        damp: 0.5,
        size: 0.9,
        diff: 0.7,
        feedback: 0.1,
        modDepth: 0.01,
        modFreq: 1
    );
}
)

(
~hole = {
    var sig = Impulse.ar(MouseX.kr(1, 1000));
    Greyhole.ar(
        in: sig,
        delayTime: 2,
        damp: 0.5,
        size: 0.9,
        diff: 0.707,
        feedback: 0.9
    ) * 0.2;
}
)