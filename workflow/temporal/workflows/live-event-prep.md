# Live-event preparation workflow

Triggered T-2h before a marquee live event (sports / awards). Steps:

1. `ScalePackagers` — KEDA pre-warm to absorb concurrent-stream surge
2. `WarmCDN` — pre-populate edge POPs with manifest preroll
3. `RotateLicenceKey` — generate per-event DRM key in Vault HSM
4. `OpenSCTE35Pipeline` — confirm ad-server SCTE-35 cue listener ready
5. `AnnounceToClients` — push notifications via communications domain
6. `OnAirGate` — wait for control-room "ON AIR" signal (Temporal signal)
7. `MonitorQoE` — for the duration of the event, watch QoE; rollback canary on regression
8. `OffAirCleanup` — DVR finalisation, clip generation, scale-down packagers
