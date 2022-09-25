{{- define "_api.rbac.serviceAccount.name" }}
{{- if .Values.serviceAccount.create }}
  {{- default "default" .Values.serviceAccount.name }}
{{- else }}
  {{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}