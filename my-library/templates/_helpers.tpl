{{/*
Generate a full name for a resource.
*/}}
{{- define "my-library.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Generate a name with the release name only.
*/}}
{{- define "my-library.name" -}}
{{- printf "%s-%s" .Release.Name "simple-name" -}}
{{- end }}
