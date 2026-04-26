# platform — StreamVault

Services in the **platform** domain.

| Service | Language | gRPC port | Description |
|---|---|---|---|
| api-gateway | go | 50000 | HTTP+gRPC ingress, OAuth2, rate limit, DRM token, geo routing |
| web-bff | go | 50001 | BFF for web player (Next.js) |
| mobile-bff | go | 50002 | BFF for mobile clients (iOS, Android, React Native) |
| tv-bff | go | 50003 | BFF for connected TV apps (Flutter, tvOS, Android TV) |
| studio-bff | go | 50004 | BFF for creator/studio portal (Angular) |
| graphql-gateway | go | 50005 | Federated GraphQL across domains |

> Each service has its own folder with `Dockerfile`, `Makefile`, `.env.example`, `README.md`, and a language-specific entry file.
> See [../../proto/platform/](../../proto/platform/) for the gRPC contracts.
