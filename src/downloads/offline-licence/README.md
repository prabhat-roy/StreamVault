# offline-licence

Service in the downloads domain of StreamVault.

Language: Go Â· Port: 50281

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/offline-licence/](../../../helm/charts/offline-licence/) â€” Helm chart
- [manifests/downloads/offline-licence/](../../../manifests/downloads/offline-licence/) â€” Raw K8s manifests
