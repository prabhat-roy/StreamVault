# live — StreamVault

Live ingest (RTMP/SRT/RIST), low-latency packaging (LL-HLS/LL-DASH), DVR, clipping.

| Service | Language | Port | Description |
|---|---|---|---|
| live-ingest | go | 50050 | RTMP/SRT/RIST live ingest |
| stream-packager | rust | 50051 | Low-latency CMAF packager (LL-HLS / LL-DASH) |
| dvr-service | go | 50052 | Live DVR window and rewind |
| low-latency-service | rust | 50053 | Sub-3s glass-to-glass control plane |
| clipping-service | go | 50054 | Live-to-VOD clipping |
