# microdOsc

Experimenting with UGens and ProxySpace:

```
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
```
