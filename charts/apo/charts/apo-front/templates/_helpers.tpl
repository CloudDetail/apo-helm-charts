{{/*
Expand the name of the chart.
*/}}
{{- define "apo-front.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "apo-front.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "apo-front" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "apo-front.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "apo-front.labels" -}}
helm.sh/chart: {{ include "apo-front.chart" . }}
{{ include "apo-front.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "apo-front.selectorLabels" -}}
app: apo-front
component: apo-front
app.kubernetes.io/name: {{ include "apo-front.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "apo-front.image" -}}
{{- if eq .Values.global.edition "ee" }}
{{- printf "%s/apo-front-ee:%s" (tpl .Values.global.image.eeRepository .) (tpl .Values.image.tag .) -}}
{{- else }}
{{- printf "%s/apo-front:%s" (tpl .Values.image.registry .) (tpl .Values.image.tag .) -}}
{{- end }}
{{- end }}
