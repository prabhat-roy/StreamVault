# expiry-manager

Service in the **downloads** domain of StreamVault.

**Language:** Go · **Port:** 50283

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/expiry-manager/](../../../helm/charts/expiry-manager/) — Helm chart
- [manifests/downloads/expiry-manager/](../../../manifests/downloads/expiry-manager/) — Raw K8s manifests
