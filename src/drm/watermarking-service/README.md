# watermarking-service

Service in the drm domain of StreamVault.

Language: Go Â· Port: 50081

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/watermarking-service/](../../../helm/charts/watermarking-service/) â€” Helm chart
- [manifests/drm/watermarking-service/](../../../manifests/drm/watermarking-service/) â€” Raw K8s manifests
