# forensic-tracker

Service in the drm domain of StreamVault.

Language: Go Â· Port: 50082

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/forensic-tracker/](../../../helm/charts/forensic-tracker/) â€” Helm chart
- [manifests/drm/forensic-tracker/](../../../manifests/drm/forensic-tracker/) â€” Raw K8s manifests
