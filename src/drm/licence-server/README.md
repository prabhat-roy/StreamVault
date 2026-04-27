# licence-server

Service in the drm domain of StreamVault.

Language: Go Â· Port: 50080

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/licence-server/](../../../helm/charts/licence-server/) â€” Helm chart
- [manifests/drm/licence-server/](../../../manifests/drm/licence-server/) â€” Raw K8s manifests
