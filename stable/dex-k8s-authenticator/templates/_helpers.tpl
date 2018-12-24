{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "dex-k8s-authenticator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "dex-k8s-authenticator.fullname" -}}
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
{{- define "dex-k8s-authenticator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "-" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create healthcheck path dependent on web_path_prefix
*/}}
{{- define "dex-k8s-authenticator.healthCheckPath" -}}
{{- if .Values.healthCheckPath -}}
  {{ .Values.healthCheckPath }}
{{- else -}}
  {{- if .Values.dexK8sAuthenticator.web_path_prefix -}}
    {{ .Values.dexK8sAuthenticator.web_path_prefix | trimSuffix "/" }}/healthz
  {{- else -}}
    {{ "/healthz" }}
  {{- end -}}
{{- end -}}
{{- end -}}
