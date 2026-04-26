# Networking — StreamVault

Service mesh, edge, ingress.

```
networking/
├── istio/        Mesh control plane + mTLS PeerAuthentication + VirtualService for canary
├── cilium/       eBPF CNI + L7 NetworkPolicy + Hubble observability
├── envoy/        Edge envoy for low-latency packager fan-out
├── nginx/        Origin shield NGINX with HLS/DASH cache rules
└── kong/         API gateway plugins (OAuth2, rate-limit, JWT licence claim verification)
```
