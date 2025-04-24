{{/*
Configure apo-one-agent variables according to different modes
*/}}
{{- define "apo-one-agent.envAndVolume" -}}
env:
- name: enable_uprobe
  value: 'false'
- name: is_jf_open
  value: 'true'
{{- if (has "no-trace" .Values.global.agentCollectorMode) }}
- name: all_north_star
  value: 'true'
{{- else if (not (has "no-trace" .Values.global.agentCollectorMode))}}
- name: all_north_star
  value: 'false'
{{- end }}
- name: SCAP_HOST_ROOT_ENV_VAR_NAME
  value: /host
- name: CACHE_SECOND
  value: '30'
- name: RUST_BACKTRACE
  value: '1'
- name: HOST_PROC
  value: /host/proc
- name: PL_HOST_PATH
  value: /host
- name: SNAPLEN
  value: '1000'
- name: switch_agg_num
  value: '2'
- name: MY_NODE_IP
  valueFrom:
    fieldRef:
      apiVersion: v1
      fieldPath: status.hostIP
- name: MY_NODE_NAME
  valueFrom:
    fieldRef:
      apiVersion: v1
      fieldPath: spec.nodeName
{{- if (has "trace-sidecar" .Values.global.agentCollectorMode) }}
{{- if eq .Values.global.edition "ee" }}
- name: ASYNC_PROFILER_PARAMS
  value: '-e traceid -e itimer -e lock -l 50'
{{- else }}
- name: ASYNC_PROFILER_PARAMS
  value: '-e traceid'
{{- end }}
{{- else }}
{{- if eq .Values.global.edition "ee" }}
- name: ASYNC_PROFILER_PARAMS
  value: '-e traceid -e itimer -o sw_otel -e lock -l 50'
{{- else }}
- name: ASYNC_PROFILER_PARAMS
  value: '-e traceid -o sw_otel'
{{- end }}
{{- end }}
volumeMounts:
- name: apo-one-agent-config
  mountPath: /app/config
- name: sys-vol
  mountPath: /host/sys
- name: modprobe-d
  readOnly: true
  mountPath: /etc/modprobe.d
- name: dev-vol
  mountPath: /host/dev
- name: proc-vol
  readOnly: true
  mountPath: /host/proc
- name: etc-vol
  readOnly: true
  mountPath: /host/etc
- name: boot-vol
  readOnly: true
  mountPath: /host/boot
- name: modules-vol
  readOnly: true
  mountPath: /host/lib/modules
- name: usr-vol
  readOnly: true
  mountPath: /host/usr
- name: run-vol
  mountPath: /host/run
- name: varrun-vol
  mountPath: /host/var/run
- name: dshm
  mountPath: /dev/shm
- name: signal-uds
  mountPath: /opt/signal
{{- end }}