{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "victoria-metrics.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "victoria-metrics.fullname" -}}
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
{{- define "victoria-metrics.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "victoria-metrics.common-labels" -}}
helm.sh/chart: {{ include "victoria-metrics.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "victoria-metrics.vmselect-pod-fqdn" -}}
{{- $pod := include "victoria-metrics.fullname" . -}}
{{- $svc := include "victoria-metrics.fullname" . -}}
{{- $namespace := .Release.Namespace -}}
{{- $dnsSuffix := .Values.clusterDomainSuffix -}}
{{- range $i := until (.Values.vmselect.replicaCount | int) -}}
{{- printf "- --selectNode=%s-%s-%d.%s-%s.%s.svc.%s:8481\n" $pod "vmselect" $i $svc "vmselect" $namespace $dnsSuffix -}}
{{- end -}}
{{- end -}}

{{/**/}}
{{- define "victoria-metrics.vmselect.vmstorage-pod-fqdn" -}}
{{- $pod := include "victoria-metrics.fullname" . -}}
{{- $svc := include "victoria-metrics.fullname" . -}}
{{- $namespace := .Release.Namespace -}}
{{- $dnsSuffix := .Values.clusterDomainSuffix -}}
{{- range $i := until (.Values.vmstorage.replicaCount | int) -}}
{{- printf "- --storageNode=%s-%s-%d.%s-%s.%s.svc.%s:8401\n" $pod "vmstorage" $i $svc "vmstorage" $namespace $dnsSuffix -}}
{{- end -}}
{{- end -}}

{{/**/}}
{{- define "victoria-metrics.vminsert.vmstorage-pod-fqdn" -}}
{{- $pod := include "victoria-metrics.fullname" . -}}
{{- $svc := include "victoria-metrics.fullname" . -}}
{{- $namespace := .Release.Namespace -}}
{{- $dnsSuffix := .Values.clusterDomainSuffix -}}
{{- range $i := until (.Values.vmstorage.replicaCount | int) -}}
{{- printf "- --storageNode=%s-%s-%d.%s-%s.%s.svc.%s:8400\n" $pod "vmstorage" $i $svc "vmstorage" $namespace $dnsSuffix -}}
{{- end -}}
{{- end -}}

{{/**/}}
{{- define "victoria-metrics.vmstorage.backup-pod-fqdn" -}}
{{- $pod := include "victoria-metrics.fullname" . -}}
{{- $svc := include "victoria-metrics.fullname" . -}}
{{- $namespace := .Release.Namespace -}}
{{- $dnsSuffix := .Values.clusterDomainSuffix -}}
{{- $port := .Values.vmstorage.service.vmbackupPort | int -}}
{{- range $i := until (.Values.vmstorage.replicaCount | int) -}}
{{- printf "curl -sS %s-%s-%d.%s-%s.%s.svc.%s:%d/backup/create &\n" $pod "vmstorage" $i $svc "vmstorage" $namespace $dnsSuffix $port -}}
{{- end -}}
{{- end -}}
