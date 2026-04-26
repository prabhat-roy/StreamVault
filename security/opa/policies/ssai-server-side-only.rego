package streamvault.ssai_server_side_only

# Ad insertion for monetised content MUST be server-side (SSAI). Client-side
# stitching is rejected because (a) ad-blockers defeat it and (b) it leaks
# advertiser identity. Reject any service whose name or label declares CSAI.

deny[msg] {
  input.kind == "Deployment"
  some l
  label := input.metadata.labels[l]
  contains(lower(label), "csai")
  msg := sprintf("Deployment %s appears to do client-side ad insertion (CSAI) — only SSAI is permitted", [input.metadata.name])
}

deny[msg] {
  input.kind == "ConfigMap"
  startswith(input.metadata.name, "ad-")
  data := input.data
  data["AD_INSERTION_MODE"] == "client"
  msg := sprintf("ConfigMap %s sets AD_INSERTION_MODE=client — only SSAI (server) permitted", [input.metadata.name])
}
