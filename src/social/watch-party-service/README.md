# watch-party-service

Service in the social domain of StreamVault.

Language: Go Â· Port: 50263

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/watch-party-service/](../../../helm/charts/watch-party-service/) â€” Helm chart
- [manifests/social/watch-party-service/](../../../manifests/social/watch-party-service/) â€” Raw K8s manifests
