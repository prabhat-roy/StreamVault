{{- define "episode-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "episode-service.labels" -}}
app.kubernetes.io/name: episode-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: catalogue
{{- end -}}

{{- define "episode-service.selectorLabels" -}}
app.kubernetes.io/name: episode-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
