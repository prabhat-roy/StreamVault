# in-app-message

Service in the **communications** domain of StreamVault.

**Language:** Go · **Port:** 50324

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/in-app-message/](../../../helm/charts/in-app-message/) — Helm chart
- [manifests/communications/in-app-message/](../../../manifests/communications/in-app-message/) — Raw K8s manifests
