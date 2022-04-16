/**
* He matat l'escurçó!
* @date: June, 2021
*/

(
s.makeWindow;
s.freqscope;
s.plotTree;
s.scope(2);

p = ProxySpace(s).push;
p[\tempo] = 110/60;
p.quant = 2;
currentEnvironment;
m = ProxyMixer(p, 8);
m.parent.alwaysOnTop_(true);
StageLimiter.new(2);
)

(
~a1.play;
~a2.play;
~b1.play;
~b0.stop;
~b2.play;
~b3.stop;
~fx1.play;
)

~a1 = { Klank.ar(`[[4, 1, 3, 5, 7], Array.fill(4, 0.05), Array.fill(4, 1)], { ClipNoise.ar(0.02) }.dup, 360) };
~a2 = { Klank.ar(`[Array.geom(4, 1, 1.61), Array.fill(4, 0.05), Array.fill(4, 1)], { ClipNoise.ar(0.03) }.dup, 160) }

// ei
~b0 = { LFSaw.ar(([28, 40] + LFNoise0.ar(~tempo.kr / 2).range(0.9, 1.1)).midicps!2, 0, Decay.ar(Impulse.ar(~tempo.kr / 8).lag, 0.3, 0.7)) }

~b1 = { LFSaw.ar(([28,40] + LFNoise0.ar(~tempo.kr / 2).range(1, 1)).midicps!2, 0, LFSaw.kr(~tempo.kr/2).range(0, 0.3)) }

~b2 = { LFSaw.ar([53, 65].midicps + LFNoise0.ar(~tempo.kr * 4).range(1, 12), 0, LFSaw.kr(~tempo.kr/4).range(0.01, 0.3)) * LFPulse.ar(~tempo.kr / 8).range(0.2, 1) }

~b3 = { SinOscFB.ar([52, 64].midicps + 12, LFSaw.kr(~tempo.kr / 4).range(0.01, 1), LFSaw.kr(~tempo.kr * 4).range(0, 0.5)) }

~fx1 = { BLowPass4.ar(~b0.ar, SinOsc.kr(~tempo.kr / 16).range(700, 20000), 0.3) }