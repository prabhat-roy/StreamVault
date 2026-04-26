{{- define "geo-routing.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "geo-routing.labels" -}}
app.kubernetes.io/name: geo-routing
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: cdn
{{- end -}}

{{- define "geo-routing.selectorLabels" -}}
app.kubernetes.io/name: geo-routing
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
