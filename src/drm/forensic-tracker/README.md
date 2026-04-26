# forensic-tracker

Service in the **drm** domain of StreamVault.

**Language:** Go · **Port:** 50082

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/forensic-tracker/](../../../helm/charts/forensic-tracker/) — Helm chart
- [manifests/drm/forensic-tracker/](../../../manifests/drm/forensic-tracker/) — Raw K8s manifests
