# playback — StreamVault

Playback session, manifest assembly, quality selection, ad insertion.

| Service | Language | Port | Description |
|---|---|---|---|
| session-service | go | 50070 | Playback session lifecycle, signed JWT issuance |
| playback-orchestrator | go | 50071 | Manifest assembly, ABR + DRM coordination |
| quality-selector | go | 50072 | Quality / device profile selection |
| ad-insertion | rust | 50073 | Server-side ad insertion (SSAI) manifest manipulation |
