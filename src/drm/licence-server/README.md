# licence-server

Service in the **drm** domain of StreamVault.

**Language:** Go · **Port:** 50080

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/licence-server/](../../../helm/charts/licence-server/) — Helm chart
- [manifests/drm/licence-server/](../../../manifests/drm/licence-server/) — Raw K8s manifests
