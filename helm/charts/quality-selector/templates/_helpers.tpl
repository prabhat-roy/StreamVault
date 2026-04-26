{{- define "quality-selector.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "quality-selector.labels" -}}
app.kubernetes.io/name: quality-selector
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: playback
{{- end -}}

{{- define "quality-selector.selectorLabels" -}}
app.kubernetes.io/name: quality-selector
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
