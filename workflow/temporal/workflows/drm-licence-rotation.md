# DRM licence-key rotation workflow

Runs every 90 days per title. Steps:

1. `GenerateNewKeyInHSM` — Vault Transit creates a new wrapped DEK; raw key never leaves HSM
2. `ReEncryptSegments` — re-encrypt master segments with new key (rolling, per-shard)
3. `UpdateKeyManifest` — new key id propagated to manifest issuer + licence-server
4. `WaitForGracePeriod` — 7 days during which old + new keys both serve licences
5. `RevokeOldKey` — Vault Transit destroys the old key version
6. `EmitRotationCompleted` — Kafka drm.key.rotated

On rotation failure, old key continues to serve until manual intervention.
