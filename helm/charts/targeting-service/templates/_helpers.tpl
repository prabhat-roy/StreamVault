{{- define "targeting-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "targeting-service.labels" -}}
app.kubernetes.io/name: targeting-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: ad
{{- end -}}

{{- define "targeting-service.selectorLabels" -}}
app.kubernetes.io/name: targeting-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
