/**
     _____          ___           ___           ___
    /  /::\        /  /\         /  /\         /  /\
   /  /:/\:\      /  /::\       /  /:/_       /  /:/
  /  /:/  \:\    /  /:/\:\     /  /:/ /\     /  /:/
 /__/:/ \__\:|  /  /:/  \:\   /  /:/ /::\   /  /:/  ___
 \  \:\ /  /:/ /__/:/ \__\:\ /__/:/ /:/\:\ /__/:/  /  /\
  \  \:\  /:/  \  \:\ /  /:/ \  \:\/:/~/:/ \  \:\ /  /:/
   \  \:\/:/    \  \:\  /:/   \  \::/ /:/   \  \:\  /:/
    \  \::/      \  \:\/:/     \__\/ /:/     \  \:\/:/
     \__\/        \  \::/        /__/:/       \  \::/
                   \__\/         \__\/         \__\/

*/

(
~muscimol = {
    SinOscFB.ar(
        freq: [100, 101],
        feedback: LFSaw.kr(~tempo.kr / 4).range(0.1, 1),
        mul: LFPulse.kr(~tempo.kr / 2).range(0.2, 1)
    );
}
)

(
~hihat = {
    var lfo1 = Trig.ar(in: LFPulse.ar(~tempo.kr * 4), dur: 0.01).lag;
    var lfo2 = LFPulse.kr(~tempo.kr / 2).range(1, 0.8);

    var sig = HPF.ar(
        in: WhiteNoise.ar(1) !2,
        freq: 4000,
        mul: lfo1 * 0.5
    );

    Pan2.ar(sig, TRand.kr(-1, 1, Impulse.kr(~tempo.kr * 4)));
}
)

(
~reverb = {
    GVerb.ar(
        in: ~muscimol.ar,
        roomsize: LFPulse.ar(~tempo.kr / 4).range(1, 10),
        revtime: 3,
        damping: 0.5,
        inputbw: 0.5,
        spread: 15,
        drylevel: 1,
        mul: 0.5
    );
}
)

(
~blowPass = {
    BLowPass4.ar(
        in: ~muscimol.ar,
        freq: SinOsc.kr(~tempo.kr / 8).range(700, 20000),
        rq: 0.1
    );
}
)

(
~hpf = {
    RHPF.ar(
        in: ~muscimol.ar,
        freq: SinOsc.kr(~tempo.kr / 8).range(1000, 3000),
        rq: 0.1,
        mul: LFPulse.kr(~tempo.kr).range(0.1, 1)
    );
}
)

(
~lpf = {
    RLPF.ar(
        in: ~muscimol.ar,
        freq: LFSaw.kr(~tempo.kr / 8).range(200, 700),
        rq: 0.1,
        mul: LFPulse.kr(~tempo.kr).range(0, 1)
    );
}
)


(
~delay = {
    var lfo = SinOsc.kr(0.1).exprange(0.05, 0.5);

    CombC.ar(
        in: ~muscimol.ar,
        maxdelaytime: ~tempo.kr,
        delaytime: lfo,
        mul: ~tempo.kr
    );
}
)
