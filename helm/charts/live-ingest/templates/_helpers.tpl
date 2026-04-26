{{- define "live-ingest.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "live-ingest.labels" -}}
app.kubernetes.io/name: live-ingest
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: live
{{- end -}}

{{- define "live-ingest.selectorLabels" -}}
app.kubernetes.io/name: live-ingest
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
