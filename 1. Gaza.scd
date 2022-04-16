/**
* Resistance in Gaza
* @date: May, 2021
*/

(
s.plotTree;
s.scope(2);
s.makeWindow;
m = ProxyMixer(p, 8);
m.parent.alwaysOnTop_(true);
PdefAllGui.new;
)

(
p = ProxySpace(s).push;
p[\tempo] = 130/60;
p.quant = 4;
p.fadeTime = 30;
StageLimiter.new(2);
)


~bass.release(20);
~beat.play;
~gaza.play;

~bass = { SinOscFB.ar([200, 210] * LFPulse.ar(~tempo.kr / 2).range(0.5, 1) * SinOscFB.ar(~tempo.kr * 8).range(0.5, 1), SinOsc.kr(~tempo.kr / 16, 0).max(0), 1).tanh };

~gaza.fadeTime = 60;
~gaza = { Mix.fill(10, { Ringz.ar(WhiteNoise.ar(0.001)!2, XLine.kr(exprand(100.0, 5000.0), exprand(100.0, 5000.0), 60), 0.6) } )}

~beat = { CombC.ar(Trig.ar(LFPulse.ar(~tempo.kr / 4), 0.2).lag * SinOscFB.ar(Line.kr(400, 600, 200) * [1, 1.1, 1.05], 0.5, 0.2), ~tempo.kr * 4, ~tempo.kr / 8, ~tempo.kr) }