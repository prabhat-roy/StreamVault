# Ingest pipeline workflow

Triggered when a partner uploads a mezzanine file. Steps:

1. `ProbeAsset` — MediaInfo probe; emits asset metadata
2. `RightsCheck` — verifies territorial + DRM rights
3. `TranscodeFanout` — fans out per-bitrate encode jobs (child workflows)
4. `PackageHLSDASHCMAF` — Shaka Packager wraps outputs into HLS+DASH+CMAF
5. `EncryptDRM` — calls drm-service to encrypt segments with per-title key (key from Vault HSM Transit)
6. `PublishToOrigin` — uploads to S3/GCS/Blob origin; invalidates CDN
7. `IndexCatalogue` — writes title to MongoDB + Elasticsearch
8. `EmitTitlePublished` — Kafka catalogue.title.published

Compensation: on any failure, child encode jobs are cancelled and the partial
manifest is removed from origin to prevent half-published titles.
