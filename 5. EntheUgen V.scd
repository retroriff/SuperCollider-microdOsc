(
s.makeWindow;
s.freqscope;
s.plotTree;
s.scope(2);
m = ProxyMixer(p, 8);
m.parent.alwaysOnTop_(true);
)

(
p = ProxySpace(s).push;
p[\tempo] = 110/60;
p.quant = 2;
p.fadeTime = 0;
currentEnvironment;
StageLimiter.new(2);
)

~blip1.play
~blip2.play
~blip3.play
~blip4.play

~blip1 = { Saw.ar([MouseX.kr(200, 400), MouseX.kr(200, 400)*1.05]) * LFPulse.kr(SinOscFB.kr(~tempo.kr / 8).range(4, 16), width:SinOscFB.kr(~tempo.kr / 8).range(0.2, 1)) }

~blip2 = { LFPulse.kr(~tempo.kr * 8, 0, 0.2, SinOscFB.kr(~tempo.kr / 16).range(0.1, 1)) * SinOsc.ar(300) }

~blip3 = { LFPulse.kr(~tempo.kr * 8, 1, 0.2, SinOscFB.kr(~tempo.kr / 16).range(0.2, 1)) * SinOsc.ar([600, 605]) * 0.6 }

~blip4 = { LFPulse.ar(SinOscFB.kr(~tempo.kr / 4, 1).range(20, 600), 0, LFSaw.kr(~tempo.kr).range(0, 1), SinOsc.kr(~tempo.kr / 4).range(0.2, 1)) * 0.5 }
