{{- define "playback-analytics.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "playback-analytics.labels" -}}
app.kubernetes.io/name: playback-analytics
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: analytics
{{- end -}}

{{- define "playback-analytics.selectorLabels" -}}
app.kubernetes.io/name: playback-analytics
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
