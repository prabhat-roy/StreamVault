{{- define "dvr-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "dvr-service.labels" -}}
app.kubernetes.io/name: dvr-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: live
{{- end -}}

{{- define "dvr-service.selectorLabels" -}}
app.kubernetes.io/name: dvr-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
