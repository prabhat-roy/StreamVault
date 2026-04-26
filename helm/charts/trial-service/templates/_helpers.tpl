{{- define "trial-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "trial-service.labels" -}}
app.kubernetes.io/name: trial-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: subscription
{{- end -}}

{{- define "trial-service.selectorLabels" -}}
app.kubernetes.io/name: trial-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
