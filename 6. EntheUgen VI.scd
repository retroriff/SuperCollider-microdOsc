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
p.fadeTime = 10;
currentEnvironment;
StageLimiter.new(2);
)


Scale.directory

(
// b = Buffer.loadCollection(s, [Scale.minorPentatonic.degrees]);
b = Buffer.loadCollection(s, [0,12,15,19]);
~degree = {
	var index, sig, pch, freq;
	index = LFDNoise0.kr(~tempo.kr / 4).range(0, 1);
	index = index * BufFrames.kr(b);
	// pch = (Index.kr(b, index) + 40).lag(~tempo.kr * 4);
	pch = (Index.kr(b, index) + 40);
	freq = pch.midicps;
	sig = VarSaw.ar(freq, mul: 0.2!2);
	sig = CombN.ar(sig, 0.31, 0.31, 2, 1);
};
~degree.play;
)

(
b = Buffer.loadCollection(s, [0,12,15,19]);
~degree2 = { SinOsc.ar((Index.kr(b, LFSaw.kr(~tempo.kr / 4).range(0, 7))+40).midicps) };
~degree2.stop;
)

~dr1.play;
~dr1 = { RLPF.ar(LFPulse.ar([28, 40].midicps, 0.15), SinOsc.kr(~tempo.kr).range(300, 400), LFNoise0.kr(~tempo.kr/8).range(0.1, 0.9), LFPulse.kr(~tempo.kr * 4).range(0, 0.5).lag(0.1))};

~fx1.stop;
~fx1 = { GVerb.ar(~degree2.ar * 0.1, LFPulse.ar(~tempo.kr / 4).range(1, 10), 3) }
~fx1 = { BLowPass4.ar(~dr1.ar, SinOsc.kr(~tempo.kr / 16).range(700, 20000), 0.1) }
~fx1 = { RHPF.ar(~dr1.ar, SinOsc.kr(~tempo.kr / 8).range(1000, 3000), 0.1, LFPulse.kr(~tempo.kr).range(0, 1)) }
~fx1 = { RLPF.ar(~dr1.ar, LFSaw.kr(~tempo.kr / 8).range(200, 700), 0.1, LFPulse.kr(~tempo.kr).range(0, 1)) }

