{{- define "watchlist-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "watchlist-service.labels" -}}
app.kubernetes.io/name: watchlist-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: social
{{- end -}}

{{- define "watchlist-service.selectorLabels" -}}
app.kubernetes.io/name: watchlist-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
