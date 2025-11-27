{{- define "rag-management.name" -}}
{{- printf "%s-rag-management" .Chart.Name | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "rag-management.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rag-management.labels" -}}
helm.sh/chart: {{ include "rag-management.chart" . }}
{{ include "rag-management.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rag-management.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rag-management.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
init-postgres InitImage
*/}}
{{- define "rag-management-init-postgres.image" -}}
{{- if .Values.ragManagement.initImage.registry -}}
{{ tpl .Values.ragManagement.initImage.registry . }}/{{ .Values.ragManagement.initImage.repository }}:{{ .Values.ragManagement.initImage.tag }}
{{- else -}}
{{ .Values.global.image.registry }}/{{ .Values.ragManagement.initImage.repository }}:{{ .Values.ragManagement.initImage.tag }}
{{- end -}}
{{- end -}}

{{/*
Image
*/}}
{{- define "rag-management.image" -}}
{{- if .Values.ragManagement.ragManagement.image.registry -}}
{{ tpl .Values.ragManagement.ragManagement.image.registry . }}/{{ .Values.ragManagement.ragManagement.image.repository }}:{{ .Values.ragManagement.ragManagement.image.tag }}
{{- else -}}
{{ .Values.global.image.registry }}/{{ .Values.ragManagement.ragManagement.image.repository }}:{{ .Values.ragManagement.ragManagement.image.tag }}
{{- end -}}
{{- end -}}
{{/*
ImagePullPolicy
*/}}
{{- define "rag-management.imagePullPolicy" -}}
{{- if .Values.ragManagement.ragManagement.image.pullPolicy -}}
{{ .Values.ragManagement.ragManagement.image.pullPolicy }}
{{- else -}}
{{ .Values.global.image.pullPolicy }}
{{- end -}}
{{- end -}}
