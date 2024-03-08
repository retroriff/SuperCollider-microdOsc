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


* @date: May, 2021
*/

(
~synth = {
    var lfo1 = LFSaw.kr(~tempo.kr / 4).range(1, 3).tanh;
    var lfo2 = LFPulse.kr(~tempo.kr / 2).range(0.2, 1);

    Pulse.ar(
        freq: [100, 101] * LFPulse.kr(~tempo.kr * 2).range(0.5, 1),
        width: LFSaw.kr(~tempo.kr / 3).range(0.1, 0.5),
        mul: lfo1 * lfo2
    );
}
)

(
~synth2 = {
    SinOscFB.ar(
        freq: [100, 101] * LFPulse.kr(~tempo.kr * 4).range(2, 3.5),
        feedback: LFSaw.kr(~tempo.kr / 3).range(0.1, 1),
        mul: LFPulse.kr(~tempo.kr / 2).range(0.2, 0.5)
    );
}
)

(
~synth3 = {
    var lfo1 = LFSaw.kr(~tempo.kr / 4).range(1, 3).tanh;
    var lfo2 = LFPulse.kr(~tempo.kr / 4).range(0.1, 0.5);

    Pulse.ar(
        freq: [100, 101] * LFPulse.kr(~tempo.kr * 4).range(0.5, 1.5),
        width: LFSaw.kr(~tempo.kr / 3).range(0.1, 0.5),
        mul: lfo1 * lfo2
    );
}
)

(
~bad = {
    SinOscFB.ar(
        freq: [200, 101] * LFPulse.kr(~tempo.kr).range(3, 4.5),
        feedback: LFSaw.kr(~tempo.kr / 4).range(0, 1),
        mul: LFPulse.kr(~tempo.kr / 4).range(0.1, 0.3)
    );
}
)

(
~synth4 = {
    Pulse.ar(
        freq: [200, 101] * Gbman2DN.kr(~tempo.kr / 2).range(6, 6),
        width: SinOsc.kr(~tempo.kr / 8).range(0, 1),
        mul: LFPulse.kr(~tempo.kr * 8, 0).range(0.4, 0)
    );
}
)

(
~ei = {
    var lfo1 = LFSaw.kr(~tempo.kr/4).range(1, 3).tanh;
    var lfo2 = LFPulse.kr(~tempo.kr / 4).range(0.1, 0.5);

    Pulse.ar(
        freq: [100, 101] * LFSaw.kr(~tempo.kr / 4).bipolar(3),
        width: LFSaw.kr(~tempo.kr / 3).range(0.1, 0.5),
        mul: lfo1 * lfo2
    );
}
)

(
~ei2 = {
    var lfo1 = SinOscFB.kr(
        freq: ~tempo.kr * 4,
        feedback: 1,
        mul: LFSaw.kr(~tempo.kr * 4).range(0.5, 1)
    ).range(3.5, 5);

    var lfo2 = SinOscFB.kr(freq: ~tempo.kr * 4, feedback: 0, mul: 1).range(0.5, 0.8);

    SinOscFB.ar(
        freq: [100, 101] * lfo1,
        feedback: LFSaw.kr(~tempo.kr / 3).range(0.1, 1),
        mul: LFPulse.kr(~tempo.kr / 2).range(0.2, 1) * lfo2
    );
}
)
