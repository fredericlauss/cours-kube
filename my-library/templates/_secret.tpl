{{- define "my-library.secret" -}}
{{- if .Values.secret }}
apiVersion: v1
kind: Secret
metadata:
  name: {{ .Values.fullnameOverride | default "default-secret" }}
  labels:
    app.kubernetes.io/managed-by: Helm
  annotations:
    meta.helm.sh/release-name: {{ .Release.Name }}
    meta.helm.sh/release-namespace: {{ .Release.Namespace }}
data:
{{- range $key, $value := .Values.secret }}
  {{ $key }}: {{ $value | b64enc }}
{{- end }}
{{- end }}
{{- end }}
