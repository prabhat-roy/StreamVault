# ad-server

Service in the ad domain of StreamVault.

Language: Go Â· Port: 50220

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ad-server/](../../../helm/charts/ad-server/) â€” Helm chart
- [manifests/ad/ad-server/](../../../manifests/ad/ad-server/) â€” Raw K8s manifests
