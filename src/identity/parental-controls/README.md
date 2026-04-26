# parental-controls

Service in the **identity** domain of StreamVault.

**Language:** Go · **Port:** 50022

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/parental-controls/](../../../helm/charts/parental-controls/) — Helm chart
- [manifests/identity/parental-controls/](../../../manifests/identity/parental-controls/) — Raw K8s manifests
