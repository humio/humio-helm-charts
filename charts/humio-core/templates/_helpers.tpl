{{/* vim: set filetype=mustache: */}}

{{- define "humio-core.name" -}}
  {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "humio-core.fullname" -}}
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

{{- define "humio-core.chart" -}}
  {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "humio-core.kafka.brokers" -}}
  {{- if ne .Values.external.kafkaBrokers "" -}}
    {{- .Values.external.kafkaBrokers -}}
  {{- else -}}
    {{- $brokerCount := index .Values "cp-helm-charts" "cp-kafka" "brokers" | int }}
    {{- range $index0 := until $brokerCount -}}
      {{- $index1 := $index0 | add1 -}}
      {{ $.Release.Name }}-cp-kafka-{{ $index0 }}.{{ $.Release.Name }}-cp-kafka-headless:9092{{ if ne $index1 $brokerCount }},{{ end }}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "humio-core.kafka.lastBroker" -}}
  {{- $brokerCount := index .Values "cp-helm-charts" "cp-kafka" "brokers" | int }}
  {{- range $index0 := until $brokerCount -}}
    {{- $index1 := $index0 | add1 -}}
    {{- if eq $index1 $brokerCount -}}
      {{- $index0 -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "humio-core.zookeeper.servers" -}}
  {{- if ne .Values.external.zookeeperServers "" -}}
    {{- .Values.external.zookeeperServers -}}
  {{- else -}}
    {{- $serverCount := index .Values "cp-helm-charts" "cp-zookeeper" "servers" | int }}
    {{- range $index0 := until $serverCount -}}
      {{- $index1 := $index0 | add1 -}}
      {{ $.Release.Name }}-cp-zookeeper-{{ $index0 }}.{{ $.Release.Name }}-cp-zookeeper-headless:2181{{ if ne $index1 $serverCount }},{{ end }}
    {{- end -}}
  {{- end -}}
{{- end -}}
