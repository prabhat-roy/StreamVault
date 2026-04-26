{{- define "watch-party-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "watch-party-service.labels" -}}
app.kubernetes.io/name: watch-party-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: social
{{- end -}}

{{- define "watch-party-service.selectorLabels" -}}
app.kubernetes.io/name: watch-party-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
