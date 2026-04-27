# stream-packager

Service in the live domain of StreamVault.

Language: Go Â· Port: 50121

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/stream-packager/](../../../helm/charts/stream-packager/) â€” Helm chart
- [manifests/live/stream-packager/](../../../manifests/live/stream-packager/) â€” Raw K8s manifests
