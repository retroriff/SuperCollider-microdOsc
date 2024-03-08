# microdOsc

Experimenting with UGens and ProxySpace:

```
(
// Start Proxy
p = ProxySpace(s).push;
p.fadeTime = 20;
p.makeTempoClock(120 / 60);
p.quant = 4;
StageLimiter.new(2);
)

(
// Panes
m = ProxyMixer(p, 8);
m.parent.alwaysOnTop_(true);
PdefAllGui.new;
s.makeWindow;
s.plotTree;
s.scope(2);
)
```
