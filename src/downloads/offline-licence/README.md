# offline-licence

Service in the **downloads** domain of StreamVault.

**Language:** Go · **Port:** 50281

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/offline-licence/](../../../helm/charts/offline-licence/) — Helm chart
- [manifests/downloads/offline-licence/](../../../manifests/downloads/offline-licence/) — Raw K8s manifests
