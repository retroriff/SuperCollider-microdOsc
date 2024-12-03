/**

.########...#######...######...######.
.##.....##.##.....##.##....##.##....##
.##.....##.##.....##.##.......##......
.##.....##.##.....##..######..##......
.##.....##.##.....##.......##.##......
.##.....##.##.....##.##....##.##....##
.########...#######...######...######.

* @date: June, 2021
*/

Ndef(\m31).play;

(
Ndef(\m31, {
    Klank.ar(
        specificationsArrayRef: `[
            [4, 1, 3, 5, 7],
            Array.fill(4, 0.05),
            Array.fill(4, 1)
        ],
        input: { ClipNoise.ar(0.02) }.dup,
        freqscale: 360
    )
});
)

~m32 = Ndef(\m32).play;
~m32.fadeTime = 20;

(
~m32[0] = {
    Klank.ar(
        specificationsArrayRef: `[
            Array.geom(4, 1, 1.61),
            Array.fill(4, 0.05),
            Array.fill(4, 1)
        ],
        input: { ClipNoise.ar(0.03) }.dup,
        freqscale: 160
    )
}
)

~m33 = Ndef(\m33).play;
~m33.fadeTime = 5;

(
~m33[0] = {
    LFSaw.ar(
        freq: ([28, 40] + LFNoise0.ar(t / 2).range(1, 1)).midicps,
        iphase: 0,
        mul: LFSaw.kr(t / 2).range(0, 0.3)
    )
}
)

~m34 = Ndef(\m34).play;

(
~m34[0] = {
    var sig1 = LFSaw.ar(
        freq: [53, 65].midicps + LFNoise0.ar(t * 4).range(1, 12),
        mul: LFSaw.kr(t / 4).range(0.01, 0.3)
    );

    var sig2 = LFPulse.ar(t / 8).range(0.2, 1);

    sig1 * sig2;
}
)

~m35 = Ndef(\m35).play;

(
~m35[0] = {
    SinOscFB.ar(
        freq: [52, 64].midicps + 12,
        feedback: LFSaw.kr(t / 4).range(0.01, 1),
        mul: LFSaw.kr(t * 4).range(0, 0.5)
    )
}
)

~m36 = Ndef(\m36).play;

(
~m36[0] = {
    LFSaw.ar(
        freq: ([28, 40] + LFNoise0.ar(t * 8).range(0.1, 4)).midicps,
        mul: Decay.ar(
            in: Impulse.ar(t).lag,
            decayTime: 3,
            mul: 0.3
        )
    )
}
)