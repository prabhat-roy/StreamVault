# Load Testing — StreamVault

```
load-testing/
├── k6/scenarios/         marquee-live-surge, vod-binge, search-burst, signup-storm
├── locust/               long-tail catalogue browse simulation
└── gatling/              billing renewal day spike
```

The `marquee-live-surge` scenario simulates a 30-million concurrent-viewer kickoff
(e.g. World Cup final / awards show) — ramps to peak in 90 seconds, holds 2h,
then graceful tail-off.
