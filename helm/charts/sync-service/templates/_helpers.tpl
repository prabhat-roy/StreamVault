{{- define "sync-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "sync-service.labels" -}}
app.kubernetes.io/name: sync-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: downloads
{{- end -}}

{{- define "sync-service.selectorLabels" -}}
app.kubernetes.io/name: sync-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
