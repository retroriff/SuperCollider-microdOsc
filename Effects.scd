(
f = Dictionary.new;

f.add(\blp -> { |roomsize = 8, revtime = 3, damping = 0.2, maxroomsize = 200|
    \filterIn -> { |in|
        BLowPass4.ar(
            in: in,
            freq: SinOsc.kr(1/16).range(700, 20000),
            rq: 0.1
        );
    }
});

f.add(\delay -> { |maxdelaytime = 0.2, decaytime = 3|
    \filterIn -> { |in|
        CombL.ar(in,
            maxdelaytime,
            delaytime: LFNoise2.kr(0.5 ! 2).exprange(0.01, 0.2),
            decaytime: decaytime
        )
    }
});

f.add(\echo -> { |maxdelaytime = 0.5, decaytime = 3|
    \filterIn -> { |in|
        CombN.ar(in,
            maxdelaytime,
            delaytime: 2,
            decaytime: decaytime
        )
    }
});

f.add(\gverb -> { |roomsize = 200, revtime = 5, damping = 0.2, maxroomsize = 200|
    \filterIn -> { |in|
        GVerb.ar(in, roomsize, revtime, damping, maxroomsize: maxroomsize).sum;
    }
});

f.add(\lpf -> { |freq = 240, rq = 1|
    \filterIn -> { |in|
        RLPF.ar(in, SinOsc.kr(1/8).range(100, 400), rq);
    }
});

f.add(\pan -> { |center = 0|
    \filterIn -> { |in|
        Pan2.ar(in, pos: center).sum;
    }
});

f.add(\reverb -> { |damp = 0.7, mix = 1, room = 0.7|
    \filterIn -> { |in|
        FreeVerb.ar(in, mix, room, damp);
    }
});

f.add(\vst -> {
    \vstFilter -> { |in|
        VSTPlugin.ar(in, 2)
    }
});
)

Ndef(\test).play;
Ndef(\test)[0] = { Pulse.ar([350, 351.3] / 4, 0.4, 0.2) };
Ndef(\test)[0] = { Pulse.ar([350, 351.3] / 4, 0.4, 1) * Env.perc(0.005, 1).ar(gate: Impulse.ar(1)) };
Ndef(\test)[0] = { Pbind(\ins, \bd).play };
Ndef(\test)[1] = f.at(\lpf).(200);
Ndef(\test)[1] = f.at(\pan).(1);
Ndef(\test).set(\wet1, 1)