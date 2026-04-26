{{- define "payment-gateway.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "payment-gateway.labels" -}}
app.kubernetes.io/name: payment-gateway
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: streamvault
streamvault.io/domain: subscription
{{- end -}}

{{- define "payment-gateway.selectorLabels" -}}
app.kubernetes.io/name: payment-gateway
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
