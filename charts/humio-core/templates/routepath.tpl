{{- define "routepath" -}}
{{- $root := index . 0 }}{{ include "humio-core.fullname" $root }}-http-{{ default "default" $root.Release.Namespace }}.apps.{{ $root.Values.openshift.host }}
{{ end }}
