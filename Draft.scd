~m101 = Ndef(\m101).play;

(
b = Buffer.loadCollection(s, [0, 12, 15, 19]);

~m101[0] = {
    |amp = 1, sndbuf, envbuf|

    var lfo1 = LFPulse.ar(t / 2).range(0.5, 1);
    var lfo2 = SinOscFB.ar(t * 8).range(0.5, 1);
    var rand = Array.rand(4, 1, 4) / 10;

    sndbuf = Buffer.readChannel(s, u.catArgs("/Samples/Hypnagogic Pop/Live To Tell.aiff").standardizePath, channels:[0]);

    GrainBuf.ar(
        2,
        trigger: LFPulse.kr(t * 8),
        dur: 0.7,
        sndbuf: sndbuf,
        rate: 1,
        pos: Demand.kr(Impulse.kr(t / 8), 0, Dseq(rand, inf)),
        interp: 2,
        pan: MouseX.kr(-1, 1),
    );
};
)


(
b = Buffer.readChannel(s, u.catArgs("/Samples/Hypnagogic Pop/Julio Iglesias - All of You (feat. Diana Ross).wav", channels:[0]));

{ var trig, rate, framesInBuffer;
    rate = MouseX.kr(0.1, 100, 1);
    trig = Impulse.ar(rate);
    framesInBuffer = BufFrames.kr(b.bufnum);
    x = Phasor.ar(trig, BufRateScale.kr(b.bufnum), 0, framesInBuffer,
        [0, MouseY.kr(0, framesInBuffer)]);
    BufRd.ar(1, b.bufnum, x);
}.play;
)