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
{{- .Values.namespaceOverride}}
{{- else }}
{{- .Release.Namespace}}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "apo-dataplane.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "apo-dataplane.labels" -}}
helm.sh/chart: {{ include "apo-dataplane.chart" . }}
{{ include "apo-dataplane.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "apo-dataplane.selectorLabels" -}}
app: apo-dataplane
component: apo-dataplane
app.kubernetes.io/name: {{ include "apo-dataplane.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}