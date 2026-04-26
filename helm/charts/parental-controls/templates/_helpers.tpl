{{- define "parental-controls.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "parental-controls.labels" -}}
app.kubernetes.io/name: parental-controls
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: identity
{{- end -}}

{{- define "parental-controls.selectorLabels" -}}
app.kubernetes.io/name: parental-controls
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
