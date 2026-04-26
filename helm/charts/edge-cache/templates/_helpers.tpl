{{- define "edge-cache.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "edge-cache.labels" -}}
app.kubernetes.io/name: edge-cache
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: cdn
{{- end -}}

{{- define "edge-cache.selectorLabels" -}}
app.kubernetes.io/name: edge-cache
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
