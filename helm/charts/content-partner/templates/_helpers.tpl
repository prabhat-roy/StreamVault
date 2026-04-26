{{- define "content-partner.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "content-partner.labels" -}}
app.kubernetes.io/name: content-partner
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: ingest
{{- end -}}

{{- define "content-partner.selectorLabels" -}}
app.kubernetes.io/name: content-partner
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
