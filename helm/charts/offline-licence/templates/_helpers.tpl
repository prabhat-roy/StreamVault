{{- define "offline-licence.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "offline-licence.labels" -}}
app.kubernetes.io/name: offline-licence
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: downloads
{{- end -}}

{{- define "offline-licence.selectorLabels" -}}
app.kubernetes.io/name: offline-licence
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
