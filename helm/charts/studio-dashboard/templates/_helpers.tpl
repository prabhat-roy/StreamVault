{{- define "studio-dashboard.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "studio-dashboard.labels" -}}
app.kubernetes.io/name: studio-dashboard
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: creator
{{- end -}}

{{- define "studio-dashboard.selectorLabels" -}}
app.kubernetes.io/name: studio-dashboard
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
