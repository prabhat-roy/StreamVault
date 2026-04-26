{{- define "notification-orchestrator.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "notification-orchestrator.labels" -}}
app.kubernetes.io/name: notification-orchestrator
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: communications
{{- end -}}

{{- define "notification-orchestrator.selectorLabels" -}}
app.kubernetes.io/name: notification-orchestrator
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
