/**
* Malferit
* @date: May, 2021
*/

s.plotTree;
s.scope(2);
s.makeWindow;

p = ProxySpace(s).push;
p[\tempo] = 110/60;
p.quant = 4;
p.fadeTime = 60;

m = ProxyMixer(p, 8);
m.parent.alwaysOnTop_(true);

PdefAllGui.new;
StageLimiter.new(2);

(
~ei.stop;
~ei2.play;
~fx1.play;
)

~synth = { Pulse.ar([100, 101] * LFPulse.kr(~tempo.kr * 2).range(0.5, 1), LFSaw.kr(~tempo.kr / 3).range(0.1, 0.5), LFSaw.kr(~tempo.kr/4).range(1, 3).tanh * LFPulse.kr(~tempo / 2).range(0.2, 1)) }

~synth2 = { SinOscFB.ar([100, 101] * LFPulse.kr(~tempo.kr * 4).range(2, 3.5), LFSaw.kr(~tempo.kr / 3).range(0.1, 1), LFPulse.kr(~tempo / 2).range(0.2, 0.5)) }

//Bad
~synth3 = { Pulse.ar([100, 101] * LFPulse.kr(~tempo.kr * 4).range(0.5, 1.5), LFSaw.kr(~tempo.kr/3).range(0.1,0.5), LFSaw.kr(~tempo.kr/4).range(1, 3).tanh * LFPulse.kr(~tempo / 4).range(0.1, 0.5)) }

// Bad
~synth4 = { SinOscFB.ar([200, 101] * LFPulse.kr(~tempo).range(3, 4.5), LFSaw.kr(~tempo.kr / 4).range(0, 1), LFPulse.kr(~tempo / 4).range(0.1, 0.3)) }

~synth5 = { Pulse.ar([200, 101] * Gbman2DN.kr(~tempo.kr / 2).range(6, 6), SinOsc.kr(~tempo.kr / 8).range(0, 1), LFPulse.kr(~tempo.kr * 8, 0).range(0.4, 0)) }

~ei = { Pulse.ar([100, 101] * LFSaw.kr(~tempo.kr / 4).bipolar(3), LFSaw.kr(~tempo.kr/3).range(0.1, 0.5), LFSaw.kr(~tempo.kr/4).range(1, 3).tanh * LFPulse.kr(~tempo / 4).range(0.1, 0.5)) }

~ei2 = { SinOscFB.ar([100, 101] * SinOscFB.kr(~tempo.kr * 4, 0, LFSaw.kr(~tempo.kr * 4).range(0.5, 1)).range(3.5, 5), LFSaw.kr(~tempo.kr/3).range(0.1, 1), LFPulse.kr(~tempo / 2).range(0.2, 1) * SinOscFB.kr(~tempo.kr * 4, 0, 1).range(0.5, 0.8)) }

~hihat = { HPF.ar(WhiteNoise.ar(1)!2, ~sin * 4000)  * LFPulse.kr(~tempo.kr / 2).range(1, 0.8) * Trig.ar(LFPulse.ar(~tempo.kr * 4), 0.01).lag };


~fx1 = { GVerb.ar(~synth.ar * 0.5, LFPulse.ar(~tempo.kr / 4).range(1, 10)) }
~fx1 = { BLowPass4.ar(~ei2.ar, SinOsc.kr(~tempo.kr / 16).range(700, 20000), 0.1) }
~fx1 = { RHPF.ar(~synth2.ar, SinOsc.kr(~tempo.kr / 8).range(1000, 3000), 0.1, LFPulse.kr(~tempo.kr).range(0, 1)) }
~fx1 = { RLPF.ar(~synth2.ar, LFSaw.kr(~tempo.kr / 8).range(200, 700), 0.1, LFPulse.kr(~tempo.kr).range(0, 1)) }
~fx1 = { CombC.ar(~synth2.ar, ~tempo.kr * 4, ~tempo.kr / 8, ~tempo.kr) }
~fx1 = { CombC.ar(~synth2.ar, ~tempo.kr * 4, ~lfo.kr(1), ~tempo.kr) }
~lfo = { SinOsc.kr(0.1).exprange(0.05, 0.5) };
