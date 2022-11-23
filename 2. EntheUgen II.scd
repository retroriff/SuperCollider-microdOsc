/**
_____________________________________________________________________________/\\\________/\\\\\_________________________________
 ____________________________________________________________________________\/\\\______/\\\///\\\_______________________________
  ______________________/\\\__________________________________________________\/\\\____/\\\/__\///\\\_____________________________
   ____/\\\\\__/\\\\\___\///______/\\\\\\\\__/\\/\\\\\\\______/\\\\\___________\/\\\___/\\\______\//\\\__/\\\\\\\\\\_____/\\\\\\\\_
    __/\\\///\\\\\///\\\__/\\\___/\\\//////__\/\\\/////\\\___/\\\///\\\____/\\\\\\\\\__\/\\\_______\/\\\_\/\\\//////____/\\\//////__
     _\/\\\_\//\\\__\/\\\_\/\\\__/\\\_________\/\\\___\///___/\\\__\//\\\__/\\\////\\\__\//\\\______/\\\__\/\\\\\\\\\\__/\\\_________
      _\/\\\__\/\\\__\/\\\_\/\\\_\//\\\________\/\\\_________\//\\\__/\\\__\/\\\__\/\\\___\///\\\__/\\\____\////////\\\_\//\\\________
       _\/\\\__\/\\\__\/\\\_\/\\\__\///\\\\\\\\_\/\\\__________\///\\\\\/___\//\\\\\\\/\\____\///\\\\\/______/\\\\\\\\\\__\///\\\\\\\\_
        _\///___\///___\///__\///_____\////////__\///_____________\/////______\///////\//_______\/////_______\//////////_____\////////__

* @date: May, 2021
*/

(
// Start Proxy
p = ProxySpace(s).push;
p[\tempo] = 110 / 60;
p.quant = 4;
p.fadeTime = 20;
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
~synth.play;
~synth2.play;
~synth3.play;
~synth4.play;
~bad.stop;
~ei.play;
~ei2.play;
~hihat.play;
~synth.release(20);
~synth2.release(20);
~synth3.release(20);
~synth4.release(20);
~bad.release(20);
~ei3.release(20);
)

(
~synth = {
    var lfo1, lfo2;
    lfo1 = LFSaw.kr(~tempo.kr/4).range(1, 3).tanh;
    lfo2 = LFPulse.kr(~tempo.kr / 2).range(0.2, 1);

    Pulse.ar(
        freq: [100, 101] * LFPulse.kr(~tempo.kr * 2).range(0.5, 1),
        width: LFSaw.kr(~tempo.kr / 3).range(0.1, 0.5),
        mul: lfo1 * lfo2
    );
}
)

(
~synth2 = {
    SinOscFB.ar(
        freq: [100, 101] * LFPulse.kr(~tempo.kr * 4).range(2, 3.5),
        feedback: LFSaw.kr(~tempo.kr / 3).range(0.1, 1),
        mul: LFPulse.kr(~tempo.kr / 2).range(0.2, 0.5)
    );
}
)

(
~synth3 = {
    var lfo1, lfo2;
    lfo1 = LFSaw.kr(~tempo.kr / 4).range(1, 3).tanh;
    lfo2 = LFPulse.kr(~tempo.kr / 4).range(0.1, 0.5);

    Pulse.ar(
        freq: [100, 101] * LFPulse.kr(~tempo.kr * 4).range(0.5, 1.5),
        width: LFSaw.kr(~tempo.kr / 3).range(0.1, 0.5),
        mul: lfo1 * lfo2
    );
}
)

(
~bad = {
    SinOscFB.ar(
        freq: [200, 101] * LFPulse.kr(~tempo.kr).range(3, 4.5),
        feedback: LFSaw.kr(~tempo.kr / 4).range(0, 1),
        mul: LFPulse.kr(~tempo.kr / 4).range(0.1, 0.3)
    );
}
)

(
~synth4 = {
    Pulse.ar(
        freq: [200, 101] * Gbman2DN.kr(~tempo.kr / 2).range(6, 6),
        width: SinOsc.kr(~tempo.kr / 8).range(0, 1),
        mul: LFPulse.kr(~tempo.kr * 8, 0).range(0.4, 0)
    );
}
)

(
~ei = {
    var lfo1, lfo2;
    lfo1 = LFSaw.kr(~tempo.kr/4).range(1, 3).tanh;
    lfo2 = LFPulse.kr(~tempo.kr / 4).range(0.1, 0.5);

    Pulse.ar(
        freq: [100, 101] * LFSaw.kr(~tempo.kr / 4).bipolar(3),
        width: LFSaw.kr(~tempo.kr / 3).range(0.1, 0.5),
        mul: lfo1 * lfo2
    );
}
)

(
~ei2 = {
    var lfo1, lfo2;
    lfo1 = SinOscFB.kr(
        freq: ~tempo.kr * 4,
        feedback: 1,
        mul: LFSaw.kr(~tempo.kr * 4).range(0.5, 1)
    ).range(3.5, 5);

    lfo2 = SinOscFB.kr(freq: ~tempo.kr * 4, feedback: 0, mul: 1).range(0.5, 0.8);

    SinOscFB.ar(
        freq: [100, 101] * lfo1,
        feedback: LFSaw.kr(~tempo.kr / 3).range(0.1, 1),
        mul: LFPulse.kr(~tempo.kr / 2).range(0.2, 1) * lfo2
    );
}
)
