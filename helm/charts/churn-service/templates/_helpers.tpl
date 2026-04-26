{{- define "churn-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "churn-service.labels" -}}
app.kubernetes.io/name: churn-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: subscription
{{- end -}}

{{- define "churn-service.selectorLabels" -}}
app.kubernetes.io/name: churn-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
