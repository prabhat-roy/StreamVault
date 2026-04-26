# studio-dashboard

Service in the **creator** domain of StreamVault.

**Language:** Go · **Port:** 50201

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/studio-dashboard/](../../../helm/charts/studio-dashboard/) — Helm chart
- [manifests/creator/studio-dashboard/](../../../manifests/creator/studio-dashboard/) — Raw K8s manifests
