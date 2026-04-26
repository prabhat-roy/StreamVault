{{- define "recommendation-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "recommendation-service.labels" -}}
app.kubernetes.io/name: recommendation-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: personalisation
{{- end -}}

{{- define "recommendation-service.selectorLabels" -}}
app.kubernetes.io/name: recommendation-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
