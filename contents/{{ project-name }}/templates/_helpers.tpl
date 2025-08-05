{{ `{{- define "platform.labels" -}}` }}
p6m.dev/env-name: {{ `{{ .Values.p6m.cluster.env }}` }}
p6m.dev/env-type: {{ `{{ .Values.p6m.cluster.env }}` }}
p6m.dev/unique-name: {{ `{{ .Values.p6m.cluster.uniqueName }}` }}
{{ `{{- if eq .Values.p6m.cloud "aws" }}` }}
p6m.dev/aws-region: {{ `{{.Values.p6m.cluster.aws.region}}` }}
{{ `{{- else if eq .Values.p6m.cloud "azure" }}` }}
p6m.dev/azure-location: {{ `{{ .Values.p6m.cluster.azure.location }}` }}
{{ `{{- end }}` }}
{{ `{{- end }}` }}

{{ `{{- define "gateway.name" -}}` }}
{{ `{{- if .Values.gatewayApi.gateway.create }}` }}
{{ `{{- .Values.gatewayApi.gateway.name | default .Release.Name }}` }}
{{ `{{- else }}` }}
{{ `{{- .Values.gatewayApi.gateway.name | required "Gateway name is required when gateway.create is false" }}` }}
{{ `{{- end }}` }}
{{ `{{- end }}` }}

{{ `{{- define "gateway.namespace" -}}` }}
{{ `{{- if .Values.gatewayApi.gateway.create }}` }}
{{ `{{- .Release.Namespace }}` }}
{{ `{{- else }}` }}
{{ `{{- .Values.gatewayApi.gateway.namespace | required "Gateway namespace is required when gateway.create is false" }}` }}
{{ `{{- end }}` }}
{{ `{{- end }}` }}
