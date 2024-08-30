{{/*
Expand the name of the chart.
*/}}
{{- define "naviqore-chart.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{/*
Expand the full name of the chart by combining the release name and chart name.
*/}}
{{- define "naviqore-chart.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create common labels.
*/}}
{{- define "naviqore-chart.labels" -}}
app.kubernetes.io/name: {{ include "naviqore-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
