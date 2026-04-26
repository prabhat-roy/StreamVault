# watch-party-service

Service in the **social** domain of StreamVault.

**Language:** Go · **Port:** 50263

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/watch-party-service/](../../../helm/charts/watch-party-service/) — Helm chart
- [manifests/social/watch-party-service/](../../../manifests/social/watch-party-service/) — Raw K8s manifests
