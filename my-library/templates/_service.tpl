{{- define "my-library.service" -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "my-library.fullname" . }}-{{ .name }}
  labels:
    app: {{ include "my-library.fullname" . }}
    {{- with .labels }}
    {{ toYaml . | nindent 4 }}
    {{- end }}
spec:
  type: {{ .type | default "ClusterIP" }}
  ports:
  {{- range .ports }}
  - port: {{ .port }}
    targetPort: {{ .targetPort | default .port }}
  {{- end }}
  selector:
    app: {{ include "my-library.fullname" . }}
{{- end }}
