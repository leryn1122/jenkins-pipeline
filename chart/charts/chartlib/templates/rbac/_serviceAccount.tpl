{{- define "api.rbac.serviceAccount" }}
{{- if .Values.serviceAccount.create }}
apiVersion: v1
kind: ServiceAccount
metadata:
  name: {{ include "_api.rbac.serviceAccount.name" . }}
  labels: {}
{{- if .Values.serviceAccount.annotations }}
  annotations:
    {{ tpl (toYaml .Values.serviceAccount.annotations) . | indent 4 }}
{{- end }}
{{- if .Values.serviceAccount.imagePullSecretName }}
imagePullSecrets:
  - name: {{ .Values.serviceAccount.imagePullSecretName }}
{{- end }}
---
{{- end -}}
{{- end -}}