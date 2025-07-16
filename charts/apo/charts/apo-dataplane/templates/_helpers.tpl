{{/*
Expand the name of the chart
*/}}
{{- define "apo-dataplane.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-"}}
{{- end }}

{{/*
Allow the release namespace to be overridden for multi-namespace deployments in combined charts
*/}}
{{- define "apo-dataplane.namespace" -}}
{{- if .Values.namespaceOverride }}
{{ .Values.namespaceOverride}}
{{- else }}
{{ .Release.Namespace}}
{{- end }}
{{- end }}