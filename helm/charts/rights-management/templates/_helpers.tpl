{{- define "rights-management.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "rights-management.labels" -}}
app.kubernetes.io/name: rights-management
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: ingest
{{- end -}}

{{- define "rights-management.selectorLabels" -}}
app.kubernetes.io/name: rights-management
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
