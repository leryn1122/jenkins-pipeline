{{/*
Renders a value that contains template.
==============================
Usage:
{{ include "utils.tplvalues.render" ( dict "value" .Values.path.to.the.Value "context" $) }}
*/}}
{{- define "utils.tplvalues.render" -}}
  {{- if typeIs "string" .value }}
    {{- tpl .value .Context }}
  {{- else }}
    {{- tpl (.value | toYaml) .Context }}
  {{- end }}
{{- end -}}