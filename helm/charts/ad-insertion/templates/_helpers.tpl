{{- define "ad-insertion.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ad-insertion.labels" -}}
app.kubernetes.io/name: ad-insertion
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: playback
{{- end -}}

{{- define "ad-insertion.selectorLabels" -}}
app.kubernetes.io/name: ad-insertion
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
