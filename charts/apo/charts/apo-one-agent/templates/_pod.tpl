{{/*
Configure apo-one-agent variables according to different modes
*/}}
{{- define "apo-one-agent.envAndVolume" -}}
env:
- name: enable_uprobe
  value: 'true'
- name: CACHE_SECOND
  value: '30'
- name: RUST_BACKTRACE
  value: '1'
- name: HOST_PROC
  value: /host/proc
- name: PL_HOST_PATH
  value: /host
- name: SYSDIG_HOST_ROOT
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
- name: ASYNC_PROFILER_PARAMS
  value: '-e traceid -o sw_otel'
volumeMounts:
- name: apo-one-agent-config
  mountPath: /app/config
- name: sys-vol
  mountPath: /sys
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