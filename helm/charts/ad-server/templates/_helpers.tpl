{{- define "ad-server.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ad-server.labels" -}}
app.kubernetes.io/name: ad-server
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: ad
{{- end -}}

{{- define "ad-server.selectorLabels" -}}
app.kubernetes.io/name: ad-server
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
