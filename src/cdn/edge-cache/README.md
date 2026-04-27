# edge-cache

Service in the cdn domain of StreamVault.

Language: Go Â· Port: 50102

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/edge-cache/](../../../helm/charts/edge-cache/) â€” Helm chart
- [manifests/cdn/edge-cache/](../../../manifests/cdn/edge-cache/) â€” Raw K8s manifests
