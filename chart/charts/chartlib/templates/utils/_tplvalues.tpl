{{/*
Renders a value that contains template.
==============================
Usage:
{{ include "utils.tplvalues.render" ( dict "value" .Values.path.to.the.Value "context" $) }}
*/}}
{{- define "utils.tplvalues.render" -}}
  {{- if typeIs "string" .value }}
    {{- tpl .value .context }}
  {{- else }}
    {{- tpl (.value | toYaml) .context }}
  {{- end }}
{{- end -}}