# comment-service

Service in the social domain of StreamVault.

Language: Go Â· Port: 50262

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/comment-service/](../../../helm/charts/comment-service/) â€” Helm chart
- [manifests/social/comment-service/](../../../manifests/social/comment-service/) â€” Raw K8s manifests
