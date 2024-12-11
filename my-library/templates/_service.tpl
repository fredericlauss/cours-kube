{{/*
Reusable Service template in my-library
*/}}
{{- define "my-library.service" -}}
{{- range $name, $config := .Values.services }}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "my-library.fullname" $ }}-{{ $name }}
  labels:
    app: {{ $.Chart.Name }}
spec:
  type: {{ $config.type | default $.Values.defaultServiceType }}
  ports:
  - port: {{ $config.port }}
    targetPort: {{ $config.targetPort | default $config.port }}
  selector:
    app: {{ $.Chart.Name }}
---
{{- end }}
{{- end }}
