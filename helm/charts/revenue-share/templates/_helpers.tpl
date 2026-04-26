{{- define "revenue-share.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "revenue-share.labels" -}}
app.kubernetes.io/name: revenue-share
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: creator
{{- end -}}

{{- define "revenue-share.selectorLabels" -}}
app.kubernetes.io/name: revenue-share
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
