{{- define "forensic-tracker.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "forensic-tracker.labels" -}}
app.kubernetes.io/name: forensic-tracker
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: drm
{{- end -}}

{{- define "forensic-tracker.selectorLabels" -}}
app.kubernetes.io/name: forensic-tracker
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
