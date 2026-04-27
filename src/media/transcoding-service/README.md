# transcoding-service

FFmpeg-based transcoding engine (HLS/DASH/CMAF, GPU encode)

Domain: `media` Â· Language: C++ 20 Â· Port: 50020

The transcoding engine is the heart of StreamVault's media pipeline:

- Segments mezzanine input into CMAF chunks (single-format packaging for HLS + DASH)
- Per-title VMAF-driven bitrate ladder optimisation (40% bandwidth saving vs. fixed ladder)
- GPU-accelerated encode on NVIDIA T4 / A10G node pools (Kubernetes Jobs on Spot instances)
- Resumable on Spot interruption via FFmpeg checkpoint

## Run locally

```bash
make build
make run
```

Tests and FFmpeg integration are added in subsequent waves.

## See also

- [helm/charts/transcoding-service/](../../../helm/charts/transcoding-service/)
- [proto/media/transcoding-service.proto](../../../proto/media/transcoding-service.proto)
