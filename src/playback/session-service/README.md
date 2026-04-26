# session-service

Service in the **playback** domain of StreamVault.

**Language:** Go · **Port:** 50160

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/session-service/](../../../helm/charts/session-service/) — Helm chart
- [manifests/playback/session-service/](../../../manifests/playback/session-service/) — Raw K8s manifests
