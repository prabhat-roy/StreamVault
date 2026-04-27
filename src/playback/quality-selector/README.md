# quality-selector

Service in the playback domain of StreamVault.

Language: Go Â· Port: 50162

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/quality-selector/](../../../helm/charts/quality-selector/) â€” Helm chart
- [manifests/playback/quality-selector/](../../../manifests/playback/quality-selector/) â€” Raw K8s manifests
