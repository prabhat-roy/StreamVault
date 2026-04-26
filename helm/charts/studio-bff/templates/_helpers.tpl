{{- define "studio-bff.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "studio-bff.labels" -}}
app.kubernetes.io/name: studio-bff
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: platform
{{- end -}}

{{- define "studio-bff.selectorLabels" -}}
app.kubernetes.io/name: studio-bff
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
