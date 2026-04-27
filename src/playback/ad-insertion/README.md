# ad-insertion

Service in the playback domain of StreamVault.

Language: Go Â· Port: 50163

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ad-insertion/](../../../helm/charts/ad-insertion/) â€” Helm chart
- [manifests/playback/ad-insertion/](../../../manifests/playback/ad-insertion/) â€” Raw K8s manifests
