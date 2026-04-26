# drm — StreamVault

Multi-DRM (Widevine + FairPlay + PlayReady), licence issuance, forensic watermarking.

> DRM keys live ONLY in HashiCorp Vault (HSM-backed). Application services never read raw keys —
> licence-server uses Vault transit encrypt/decrypt. See `security/vault/policies/streamvault-drm.hcl`.

| Service | Language | Port | Description |
|---|---|---|---|
| drm-service | go | 50030 | Multi-DRM orchestrator (Widevine, FairPlay, PlayReady) |
| licence-server | rust | 50031 | Licence issuance with HSM-backed keys (Vault transit) |
| watermarking-service | rust | 50032 | Forensic A/B variant watermark embedder |
| forensic-tracker | go | 50033 | Leak detection from in-the-wild watermark recovery |
