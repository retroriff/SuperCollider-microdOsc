/**
* Resistance in Gaza
* @date: May, 2021
*/

(
// Start Proxy
p = ProxySpace(s).push;
p[\tempo] = 130 / 60;
p.quant = 4;
p.fadeTime = 30;
StageLimiter.new(2);
)

(
// Panes
s.plotTree;
s.scope(2);
s.makeWindow;
m = ProxyMixer(p, 8);
m.parent.alwaysOnTop_(true);
PdefAllGui.new;
)

(
// Controllers
~bass.play;
~gaza.play;
~beat.play;
~bass.release(20);
~gaza.release(20);
~beat.release(20);
)

(
~bass = {
    var lfo1, lfo2;
    lfo1 = LFPulse.ar(~tempo.kr / 2).range(0.5, 1);
    lfo2 = SinOscFB.ar(~tempo.kr * 8).range(0.5, 1);

    SinOscFB.ar(
        freq: [200, 210] * lfo1 * lfo2,
        feedback: SinOsc.kr(~tempo.kr / 16, 0).max(0),
        mul: 1
    ).tanh;
}
)

(
~gaza.fadeTime = 60;
~gaza = {
    Mix.fill(10, {
        Ringz.ar(
            in: WhiteNoise.ar(0.001)!2,
            freq: XLine.kr(
                start: exprand(100.0, 5000.0),
                end: exprand(100.0, 5000.0),
                dur: 60
            ),
            decaytime: 0.6
        );
    });
}
)

(
~beat = {
    var freq1, freq2, lfo;
    lfo = Line.kr(start: 400, end: 600, dur: 200);
    freq1 = Trig.ar(LFPulse.ar(~tempo.kr / 4), dur: 0.2).lag;
    freq2 = SinOscFB.ar([1, 1.1, 1.05] * lfo, feedback: 0.5, mul: 0.2);

    CombC.ar(
        in: freq1 * freq2,
        maxdelaytime: ~tempo.kr * 4,
        delaytime: ~tempo.kr / 8,
        decaytime: ~tempo.kr
    );
}
)
