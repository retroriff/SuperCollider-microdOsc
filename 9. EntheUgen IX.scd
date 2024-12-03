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

~m91 = Ndef(\m91).play;

(
~m91[0] = {
    var trig = Impulse.kr(t);
    Greyhole.ar(
        in: Impulse.ar(t * 4),
        delayTime: 0.1,
        damp: 0.5,
        size: 0.9,
        diff: 0.7,
        feedback: 0.1,
        modDepth: 0.01,
        modFreq: 1
    );
})
)

~m92 = Ndef(\m92).play;

(
~m92[0] = {
    var sig = Impulse.ar(MouseX.kr(1, 1000));
    Greyhole.ar(
        in: sig,
        delayTime: 2,
        damp: 0.5,
        size: 0.9,
        diff: 0.707,
        feedback: 0.9
    ) * 0.2;
})
)