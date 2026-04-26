{{- define "comment-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "comment-service.labels" -}}
app.kubernetes.io/name: comment-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: social
{{- end -}}

{{- define "comment-service.selectorLabels" -}}
app.kubernetes.io/name: comment-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
