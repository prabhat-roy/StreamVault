package streamvault.manifest_cacheable

# Manifest endpoints (HLS .m3u8, DASH .mpd, CMAF .cmfa) MUST be aggressively
# cacheable. Reject Service / Ingress that disable caching on these paths.

deny[msg] {
  input.kind == "Service"
  some i
  port := input.spec.ports[i]
  port.name == "manifest"
  not input.metadata.annotations["streamvault.io/cache-control"]
  msg := sprintf("Service %s exposes a manifest port but lacks streamvault.io/cache-control annotation", [input.metadata.name])
}

deny[msg] {
  input.kind == "Ingress"
  some i
  rule := input.spec.rules[i]
  some j
  path := rule.http.paths[j]
  endswith(path.path, ".m3u8")
  cc := input.metadata.annotations["nginx.ingress.kubernetes.io/configuration-snippet"]
  contains(cc, "no-store")
  msg := sprintf("Ingress %s sets no-store on manifest path %s — manifests must be cacheable", [input.metadata.name, path.path])
}
