{{/*
Expand the name of the chart.
*/}}
{{- define "apo-backend.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "apo-backend.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "apo-backend" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "apo-backend.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "apo-backend.labels" -}}
helm.sh/chart: {{ include "apo-backend.chart" . }}
{{ include "apo-backend.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "apo-backend.selectorLabels" -}}
app: apo-backend
component: apo-backend
app.kubernetes.io/name: {{ include "apo-backend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "apo-backend.image" -}}
{{- if eq .Values.global.edition "ee" }}
{{- printf "%s/apo-backend-ee:%s" (tpl .Values.global.image.eeRepository .) (tpl .Values.apoBackend.image.tag .) -}}
{{- else }}
{{- printf "%s/apo-backend:%s" (tpl .Values.apoBackend.image.registry .) (tpl .Values.apoBackend.image.tag .) -}}
{{- end }}
{{- end }}

{{- define "apo-backend.serviceAccountName" -}}
{{- default (include "apo-backend.fullname" .) .Values.serviceAccount.name }}
{{- end }}
