{{- define "svc.name" -}}{{ .Chart.Name }}{{- end -}}
{{- define "svc.labels" -}}
app.kubernetes.io/name: {{ include "svc.name" . }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: platform
{{- end -}}
