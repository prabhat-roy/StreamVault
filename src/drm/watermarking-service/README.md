# watermarking-service

Service in the **drm** domain of StreamVault.

**Language:** Go · **Port:** 50081

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/watermarking-service/](../../../helm/charts/watermarking-service/) — Helm chart
- [manifests/drm/watermarking-service/](../../../manifests/drm/watermarking-service/) — Raw K8s manifests
