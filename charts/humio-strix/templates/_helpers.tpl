{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "humio-strix.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "humio-strix.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "humio-strix.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "humio-strix.labels" -}}
app.kubernetes.io/name: {{ include "humio-strix.name" . }}
helm.sh/chart: {{ include "humio-strix.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "humio-strix.humioUrl" -}}
{{- if .Values.baseUrl -}}
{{- .Values.baseUrl -}}
{{- else -}}
{{- if or (eq .Values.simulation "HECSimulation") (eq .Values.simulation "HECRandomnessSimulation") -}}
{{- printf "http://%s-humio-core-headless:8080/api/v1/ingest/hec" .Release.Name -}}
{{- else -}}
{{- printf "http://%s-humio-core-headless:8080/api/v1/ingest/elastic-bulk" .Release.Name -}}
{{- end -}}
{{- end -}}
{{- end -}}
