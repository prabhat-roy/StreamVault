package streamvault.drm_key_no_log

# DRM key material, content URLs, or playback tokens must never appear in
# log statements. Scan source files in src/drm/ for forbidden field names.

forbidden_fields := {
  "drm_key", "drmKey", "kid", "content_key", "contentKey",
  "playback_token", "playbackToken", "licence_key", "licenceKey",
  "widevine_key", "fairplay_key", "playready_key",
  "master_key", "masterKey",
}

deny[msg] {
  input.kind == "GoSource"
  some i
  line := input.lines[i]
  contains(line, "log.")
  some f
  field := forbidden_fields[f]
  contains(line, field)
  msg := sprintf("DRM-sensitive field %q appears in a log call at line %d (%s)", [field, i, input.path])
}

deny[msg] {
  input.kind == "Deployment"
  some c
  container := input.spec.template.spec.containers[c]
  container.env[_].name == "LOG_LEVEL"
  container.env[_].value == "debug"
  startswith(container.name, "drm-")
  msg := sprintf("DRM container %s must not run with LOG_LEVEL=debug — risk of key leakage", [container.name])
}
