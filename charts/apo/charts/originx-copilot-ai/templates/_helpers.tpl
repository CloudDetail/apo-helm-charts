{{/*
Expand the name of the chart.
*/}}
{{- define "originx-copilot-ai.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "originx-copilot-ai.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s" $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "originx-copilot-ai.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "originx-copilot-ai.labels" -}}
helm.sh/chart: {{ include "originx-copilot-ai.chart" . }}
{{ include "originx-copilot-ai.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "originx-copilot-ai.selectorLabels" -}}
app: originx-copilot-ai
component: originx-copilot-ai
app.kubernetes.io/name: {{ include "originx-copilot-ai.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "originx-copilot-ai.image" -}}
{{- if eq .Values.global.edition "ee" }}
{{- printf "%s/originx-copilot-ai-ee:%s" (tpl .Values.global.image.eeRepository .) (tpl .Values.apoBackend.image.tag .) -}}
{{- else }}
{{- printf "%s/originx-copilot-ai:%s" (tpl .Values.apoBackend.image.registry .) (tpl .Values.apoBackend.image.tag .) -}}
{{- end }}
{{- end }}

{{- define "originx-copilot-ai.serviceAccountName" -}}
{{- default (include "originx-copilot-ai.fullname" .) .Values.serviceAccount.name }}
{{- end }}
