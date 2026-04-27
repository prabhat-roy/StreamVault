# sync-service

Service in the downloads domain of StreamVault.

Language: Go Â· Port: 50282

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/sync-service/](../../../helm/charts/sync-service/) â€” Helm chart
- [manifests/downloads/sync-service/](../../../manifests/downloads/sync-service/) â€” Raw K8s manifests
