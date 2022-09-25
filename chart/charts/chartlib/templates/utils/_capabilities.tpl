{{/*
  Kubernetes version
==============================
*/}}
{{- define "charts.capabilities.kubeVersion" -}}
{{- default $.Values.kubeVersion $.Capabilities.KubeVersion.Version -}}
{{- end -}}

---
