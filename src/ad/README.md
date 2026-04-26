# ad — StreamVault

Server-side ad insertion (SSAI), VAST/VMAP decisioning, contextual targeting.

| Service | Language | Port | Description |
|---|---|---|---|
| ad-server | go | 50100 | VAST/VMAP ad decisioning |
| dai-service | go | 50101 | Dynamic ad insertion control plane |
| targeting-service | python | 50102 | Contextual ad targeting (no PII) |
| ad-analytics | python | 50103 | Ad impression / completion analytics |
| ssai-service | rust | 50104 | SSAI manifest stitcher |
