# dai-service

Service in the ad domain of StreamVault.

Language: Go Â· Port: 50221

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/dai-service/](../../../helm/charts/dai-service/) â€” Helm chart
- [manifests/ad/dai-service/](../../../manifests/ad/dai-service/) â€” Raw K8s manifests
