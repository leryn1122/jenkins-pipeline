{{/*
  Deployment
==============================
*/}}
{{- define "api.workload.deployment" -}}
{{- range $deployName, $deploy := .Values.application }}
{{- if eq "normal" ($deploy.language | default "normal" ) -}}

apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ $deployName }}
  labels:
    app.kubernetes.io/name: {{ $.Release.Name }}
    app.kubernetes.io/instance: {{ $deployName }}
    app.kubernetes.io/component: {{ $deployName }}
spec:
  replicas: {{ $deploy.replicas | default 3 }}
  selector:
    matchLabels:
      app.kubernetes.io/name: {{ $.Release.Name }}
      app.kubernetes.io/instance: {{ $deployName }}
      app.kubernetes.io/component: {{ $deployName }}
  {{- include "_api.workload.deployment.strategy" $ | nindent 2 }}
  template:
    metadata:
      labels:
        app.kubernetes.io/name: {{ $.Release.Name }}
        app.kubernetes.io/instance: {{ $deployName }}
        app.kubernetes.io/component: {{ $deployName }}
    spec:
      
      containers:
      -
        name: {{ $deployName }}
        {{- include "_api.workload.container.base.image"        . | nindent 8 }}
        {{- include "_api.workload.container.base.environment"  . | nindent 8 }}
        {{- include "_api.workload.container.base.port"         . | nindent 8 }}
        {{- include "_api.workload.container.base.resource"     . | nindent 8 }}
        {{- include "_api.workload.container.base.volume.mount" . | nindent 8 }}
        
      {{- include "_api.workload.deployment.volume"  . | nindent 6 }}
---
{{- end -}}
{{- end -}}
{{- end -}}