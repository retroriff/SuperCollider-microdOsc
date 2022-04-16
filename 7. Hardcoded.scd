/**
* https://scsynth.org/t/super-cool-supercollider-synthesis-challenge-prize/3777/25
*/
s.plotTree;
s.scope(2);
s.makeWindow;

(
p = ProxySpace(s).push;
p[\tempo] = 110/60;
p.quant = 0;
p.fadeTime = 0;
)

m = ProxyMixer(p, 8);
m.parent.alwaysOnTop_(true);

PdefAllGui.new;
StageLimiter.new(2);

(
~nathan.play;
~nathan = {
	var snd, auto, freq, trig;
	freq = \freq.kr(40);
	trig = ToggleFF.ar(Dust.ar(8));
	auto = trig.lagud(1, 0.5);
	snd = Saw.ar(freq);
	snd = Splay.ar(snd);
	snd = (snd * 3).fold2;
	snd = RLPF.ar(snd, freq * MouseX.kr(2000, 1000), 1);
	snd = (snd * 5).fold2;
	snd = RLPF.ar(snd, freq * MouseY.kr(0, 10) * TRand.ar(1, 4, trig), 0.1);
	snd = (snd * 1).fold2;
	// snd = MoogFF.ar(snd, auto.linexp(0, 4, 2000, 800), 1);
	// snd = snd + DelayC.ar(snd, 0.05, SinOsc.ar(1, [10, pi]).range(0, 0.4));
	snd = (snd * 3.dbamp).tanh;
	snd;
};
)

(
~vangelis3.play;
~vangelis3 = {
	var freq, osc1, osc2, freq1, freq2, env, pitch, amp, sig, lfo1, pitch2, fenv;
	amp = \amp.kr(0.85, 0.017);
	env = EnvGen.ar(Env.asr(\atk.kr(0.41), 1, \rel.kr(4.1), \crv.kr(0)), \trig.kr(1));
	fenv = EnvGen.ar(Env.asr(\fatk.kr(1.6), 1, \frel.kr(4.7), \fcrv.kr(0)), \trig.kr(1));
	lfo1 = SinOsc.kr(\lffreq.kr(0.06));
	freq = \freq.kr(240, 0.017);
	freq2 = freq + (lfo1*(\detune.kr(0.06)));
	osc1 = Saw.ar(freq);
	osc2 = Saw.ar(freq2);
	sig = Mix.ar( [osc1, osc2] );
	sig = RLPF.ar(sig, (\lpfreq.kr(6000)*env)+10);
	sig = JPverb.ar(sig, \revtime.kr(4), \damp.kr(0), \size.kr(4));
	sig * env * amp;
}
)