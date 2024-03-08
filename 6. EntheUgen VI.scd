/**

                    ___           ___       ___
      ___          /  /\         /  /\     /  /\
     /  /\        /  /::\       /  /:/    /  /:/
    /  /::\      /  /:/\:\     /  /:/    /  /:/
   /  /:/\:\    /  /:/  \:\   /  /:/    /  /:/
  /  /::\ \:\  /__/:/ \__\:\ /__/:/    /__/:/
 /__/:/\:\ \:\ \  \:\ /  /:/ \  \:\    \  \:\
 \__\/  \:\_\/  \  \:\  /:/   \  \:\    \  \:\
      \  \:\     \  \:\/:/     \  \:\    \  \:\
       \__\/      \  \::/       \  \:\    \  \:\
                   \__\/         \__\/     \__\/

*/

(
a = Buffer.loadCollection(s, Scale.minorPentatonic.degrees);
b = Buffer.loadCollection(s, [0, 12, 15, 19]);

~dopse = {
	var index, sig, pch, freq;
	index = LFDNoise0.kr(~tempo.kr / 4).range(0, 1);
    index = (index * BufFrames.kr(a)).poll;
    pch = (Index.kr(a, index) + 40).lag;
	freq = pch.midicps;
	sig = VarSaw.ar(freq, mul: 0.2!2);
	sig = CombN.ar(sig, 0.31, 0.31, 2, 1);
}
)

(
b = Buffer.loadCollection(s, Scale.minorPentatonic.degrees);

~degree2 = {
    var freq = Index.kr(
        bufnum: b,
        in: LFSaw.kr(~tempo.kr / 4).range(0, 5)
    );
    VarSaw.ar(
        freq: (freq + 40).midicps,
        mul: 0.5
    );
}
)

(
~dr1 = {
    RLPF.ar(
        in: LFPulse.ar([28, 40].midicps, 0.15),
        freq: SinOsc.kr(~tempo.kr).range(300, 400),
        rq: LFNoise0.kr(~tempo.kr / 8).range(0.1, 0.9),
        mul: LFPulse.kr(~tempo.kr * 4).range(0, 0.5).lag(0.1)
    );
}
)

(
~fx1 = {
    GVerb.ar(
        in: ~dr1.ar * 0.2,
        roomsize: 8,
        revtime: 3,
        damping: 0.2,
        maxroomsize: 200,
    );
}
)

(
~fx1 = {
    BLowPass4.ar(
        in: ~dr1.ar,
        freq: SinOsc.kr(~tempo.kr / 16).range(700, 20000),
        rq: 0.1
    );
}
)

(
~fx1 = {
    RHPF.ar(
        in: ~dr1.ar,
        freq: SinOsc.kr(~tempo.kr / 8).range(1000, 3000),
        rq: 0.1,
        mul: LFPulse.kr(~tempo.kr).range(0, 1)
    );
}
)

(
~fx1 = {
    RLPF.ar(
        in: ~dr1.ar,
        freq: LFSaw.kr(~tempo.kr / 8).range(200, 700),
        rq: 0.1,
        mul: LFPulse.kr(~tempo.kr).range(0, 1)
    );
}
)
