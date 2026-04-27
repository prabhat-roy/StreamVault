# clipping-service

Service in the live domain of StreamVault.

Language: Go Â· Port: 50124

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/clipping-service/](../../../helm/charts/clipping-service/) â€” Helm chart
- [manifests/live/clipping-service/](../../../manifests/live/clipping-service/) â€” Raw K8s manifests
