# cdn — StreamVault

Multi-CDN orchestration, origin, edge cache, geo routing, ABR ladder selection.

| Service | Language | Port | Description |
|---|---|---|---|
| cdn-orchestrator | go | 50040 | Multi-CDN orchestration (Cloudflare, CloudFront, Akamai) |
| origin-service | go | 50041 | HLS/DASH manifest + segment origin |
| edge-cache | rust | 50042 | Edge cache controller and invalidation |
| geo-routing | go | 50043 | Geo-aware request routing and traffic steering |
| abr-service | go | 50044 | Adaptive bitrate ladder selection (per-title VMAF) |
