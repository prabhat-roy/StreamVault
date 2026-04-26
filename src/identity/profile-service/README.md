# profile-service

Service in the **identity** domain of StreamVault.

**Language:** Go · **Port:** 50021

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/profile-service/](../../../helm/charts/profile-service/) — Helm chart
- [manifests/identity/profile-service/](../../../manifests/identity/profile-service/) — Raw K8s manifests
