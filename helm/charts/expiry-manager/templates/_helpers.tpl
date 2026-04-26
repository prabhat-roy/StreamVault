{{- define "expiry-manager.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "expiry-manager.labels" -}}
app.kubernetes.io/name: expiry-manager
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: downloads
{{- end -}}

{{- define "expiry-manager.selectorLabels" -}}
app.kubernetes.io/name: expiry-manager
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
