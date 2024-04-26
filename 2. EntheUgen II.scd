/**

      ___           ___           ___           ___           ___
     /  /\         /  /\         /  /\         /  /\         /  /\
    /  /::|       /  /::\       /  /::\       /  /::\       /  /::\
   /  /:|:|      /  /:/\:\     /  /:/\:\     /__/:/\:\     /  /:/\:\
  /  /:/|:|__   /  /:/  \:\   /  /:/  \:\   _\_ \:\ \:\   /  /:/  \:\
 /__/:/_|::::\ /__/:/ \__\:| /__/:/ \__\:\ /__/\ \:\ \:\ /__/:/ \  \:\
 \__\/  /~~/:/ \  \:\ /  /:/ \  \:\ /  /:/ \  \:\ \:\_\/ \  \:\  \__\/
       /  /:/   \  \:\  /:/   \  \:\  /:/   \  \:\_\:\    \  \:\
      /  /:/     \  \:\/:/     \  \:\/:/     \  \:\/:/     \  \:\
     /__/:/       \__\::/       \  \::/       \  \::/       \  \:\
     \__\/            ~~         \__\/         \__\/         \__\/

May, 2021

*/

~m21 = Ndef(\m21).play;
~m21.fadeTime = 10;

(
~m21[0] = {
    var lfo1 = LFSaw.kr(t / 4).range(1, 3).tanh;
    var lfo2 = LFPulse.kr(t / 2).range(0.2, 1);

    Pulse.ar(
        freq: [100, 101] * LFPulse.kr(t * 2).range(0.5, 1),
        width: LFSaw.kr(t / 3).range(0.1, 0.5),
        mul: lfo1 * lfo2
    );
}
)

~m22 = Ndef(\m22).play;

(
~m22[0] = {
    SinOscFB.ar(
        freq: [100, 101] * LFPulse.kr(t * 4).range(2, 3.5),
        feedback: LFSaw.kr(t / 3).range(0.1, 1),
        mul: LFPulse.kr(t / 2).range(0.2, 0.5)
    );
}
)

~m23 = Ndef(\m23).play;

(
~m23[0] = {
    var lfo1 = LFSaw.kr(t / 4).range(1, 3).tanh;
    var lfo2 = LFPulse.kr(t / 4).range(0.1, 0.5);

    Pulse.ar(
        freq: [100, 101] * LFPulse.kr(t * 4).range(0.5, 1.5),
        width: LFSaw.kr(t / 3).range(0.1, 0.5),
        mul: lfo1 * lfo2
    );
}
)

~m24 = Ndef(\m24).play;

(
~m24[0] = {
    SinOscFB.ar(
        freq: [200, 101] * LFPulse.kr(t).range(3, 4.5),
        feedback: LFSaw.kr(t / 4).range(0, 1),
        mul: LFPulse.kr(t / 4).range(0.1, 0.3)
    );
}
)

~m25 = Ndef(\m25).play;

(
~m25[0] = {
    Pulse.ar(
        freq: [200, 101] * Gbman2DN.kr(t / 2).range(6, 6),
        width: SinOsc.kr(t / 8).range(0, 1),
        mul: LFPulse.kr(t * 8, 0).range(0.4, 0)
    );
}
)

~m26 = Ndef(\m26).play;

(
~m26[0] = {
    var lfo1 = LFSaw.kr(t/4).range(1, 3).tanh;
    var lfo2 = LFPulse.kr(t / 4).range(0.1, 0.5);

    Pulse.ar(
        freq: [100, 101] * LFSaw.kr(t / 4).bipolar(3),
        width: LFSaw.kr(t / 3).range(0.1, 0.5),
        mul: lfo1 * lfo2
    );
}
)

~m27 = Ndef(\m27).play;

(
~m27[0] = {
    var lfo1 = SinOscFB.kr(
        freq: t * 4,
        feedback: 1,
        mul: LFSaw.kr(t * 4).range(0.5, 1)
    ).range(3.5, 5);

    var lfo2 = SinOscFB.kr(freq: t * 4).range(0.5, 0.8);

    SinOscFB.ar(
        freq: [100, 101] * lfo1,
        feedback: LFSaw.kr(t / 3).range(0.1, 1),
        mul: LFPulse.kr(t / 2).range(0.2, 1) * lfo2
    );
}
)
