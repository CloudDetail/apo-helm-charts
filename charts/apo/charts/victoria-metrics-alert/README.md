# Helm Chart For Victoria Metrics Alert.

 ![Version: 0.9.11](https://img.shields.io/badge/Version-0.9.11-informational?style=flat-square)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/victoriametrics)](https://artifacthub.io/packages/helm/victoriametrics/victoria-metrics-alert)
[![Slack](https://img.shields.io/badge/join%20slack-%23victoriametrics-brightgreen.svg)](https://slack.victoriametrics.com/)

Victoria Metrics Alert - executes a list of given MetricsQL expressions (rules) and sends alerts to Alert Manager.

## Prerequisites

* Install the follow packages: ``git``, ``kubectl``, ``helm``, ``helm-docs``. See this [tutorial](../../REQUIREMENTS.md).

## How to install

Access a Kubernetes cluster.

Add a chart helm repository with follow commands:

```console
helm repo add vm https://victoriametrics.github.io/helm-charts/

helm repo update
```

List versions of ``vm/victoria-metrics-alert`` chart available to installation:

```console
helm search repo vm/victoria-metrics-alert -l
```

Export default values of ``victoria-metrics-alert`` chart to file ``values.yaml``:

```console
helm show values vm/victoria-metrics-alert > values.yaml
```

Change the values according to the need of the environment in ``values.yaml`` file.

Test the installation with command:

```console
helm install vmalert vm/victoria-metrics-alert -f values.yaml -n NAMESPACE --debug --dry-run
```

Install chart with command:

```console
helm install vmalert vm/victoria-metrics-alert -f values.yaml -n NAMESPACE
```

Get the pods lists by running this commands:

```console
kubectl get pods -A | grep 'alert'
```

Get the application by running this command:

```console
helm list -f vmalert -n NAMESPACE
```

See the history of versions of ``vmalert`` application with command.

```console
helm history vmalert -n NAMESPACE
```

## HA configuration for Alertmanager

There is no option on this chart to set up Alertmanager with [HA mode](https://github.com/prometheus/alertmanager#high-availability).
To enable the HA configuration, you can use:
- [VictoriaMetrics Operator](https://docs.victoriametrics.com/operator/VictoriaMetrics-Operator.html)
- official [Alertmanager Helm chart](https://github.com/prometheus-community/helm-charts/tree/main/charts/alertmanager)

## How to uninstall

Remove application with command.

```console
helm uninstall vmalert -n NAMESPACE
```

## Documentation of Helm Chart

Install ``helm-docs`` following the instructions on this [tutorial](../../REQUIREMENTS.md).

Generate docs with ``helm-docs`` command.

```bash
cd charts/victoria-metrics-alert

helm-docs
```

The markdown generation is entirely go template driven. The tool parses metadata from charts and generates a number of sub-templates that can be referenced in a template file (by default ``README.md.gotmpl``). If no template file is provided, the tool has a default internal template that will generate a reasonably formatted README.

## Parameters

The following tables lists the configurable parameters of the chart and their default values.

Change the values according to the need of the environment in ``victoria-metrics-alert/values.yaml`` file.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| alertmanager.baseURL | string | `""` |  |
| alertmanager.baseURLPrefix | string | `""` |  |
| alertmanager.configMap | string | `""` |  |
| alertmanager.enabled | bool | `true` |  |
| alertmanager.envFrom | list | `[]` |  |
| alertmanager.extraArgs | object | `{}` |  |
| alertmanager.extraContainers | list | `[]` |  |
| alertmanager.extraHostPathMounts | list | `[]` |  |
| alertmanager.extraVolumeMounts | list | `[]` |  |
| alertmanager.extraVolumes | list | `[]` |  |
| alertmanager.image | string | `"prom/alertmanager"` |  |
| alertmanager.imagePullSecrets | list | `[]` |  |
| alertmanager.ingress.annotations | object | `{}` |  |
| alertmanager.ingress.enabled | bool | `false` |  |
| alertmanager.ingress.extraLabels | object | `{}` |  |
| alertmanager.ingress.hosts | list | `[]` |  |
| alertmanager.ingress.pathType | string | `"Prefix"` | pathType is only for k8s >= 1.1= |
| alertmanager.ingress.tls | list | `[]` |  |
| alertmanager.listenAddress | string | `"0.0.0.0:9093"` |  |
| alertmanager.nodeSelector | object | `{}` |  |
| alertmanager.persistentVolume.accessModes | list | `["ReadWriteOnce"]` | Array of access modes. Must match those of existing PV or dynamic provisioner. Ref: [http://kubernetes.io/docs/user-guide/persistent-volumes/](http://kubernetes.io/docs/user-guide/persistent-volumes/) |
| alertmanager.persistentVolume.annotations | object | `{}` | Persistant volume annotations |
| alertmanager.persistentVolume.enabled | bool | `false` | Create/use Persistent Volume Claim for alertmanager component. Empty dir if false |
| alertmanager.persistentVolume.existingClaim | string | `""` | Existing Claim name. If defined, PVC must be created manually before volume will be bound |
| alertmanager.persistentVolume.mountPath | string | `"/data"` | Mount path. Alertmanager data Persistent Volume mount root path. |
| alertmanager.persistentVolume.size | string | `"50Mi"` | Size of the volume. Better to set the same as resource limit memory property. |
| alertmanager.persistentVolume.storageClass | string | `""` | StorageClass to use for persistent volume. Requires alertmanager.persistentVolume.enabled: true. If defined, PVC created automatically |
| alertmanager.persistentVolume.subPath | string | `""` | Mount subpath |
| alertmanager.podMetadata.annotations | object | `{}` |  |
| alertmanager.podMetadata.labels | object | `{}` |  |
| alertmanager.podSecurityContext.enabled | bool | `false` |  |
| alertmanager.priorityClassName | string | `""` |  |
| alertmanager.resources | object | `{}` |  |
| alertmanager.retention | string | `"120h"` |  |
| alertmanager.securityContext.enabled | bool | `false` |  |
| alertmanager.service.annotations | object | `{}` |  |
| alertmanager.service.port | int | `9093` |  |
| alertmanager.service.type | string | `"ClusterIP"` |  |
| alertmanager.tag | string | `"v0.25.0"` |  |
| alertmanager.templates | object | `{}` |  |
| alertmanager.tolerations | list | `[]` |  |
| extraObjects | list | `[]` | Add extra specs dynamically to this chart |
| global.compatibility.openshift.adaptSecurityContext | string | `"auto"` |  |
| license | object | `{"key":"","secret":{"key":"","name":""}}` | Enterprise license key configuration for VictoriaMetrics enterprise. Required only for VictoriaMetrics enterprise. Documentation - https://docs.victoriametrics.com/enterprise.html, for more information, visit https://victoriametrics.com/products/enterprise/ . To request a trial license, go to https://victoriametrics.com/products/enterprise/trial/ Supported starting from VictoriaMetrics v1.94.0 |
| license.key | string | `""` | License key |
| license.secret | object | `{"key":"","name":""}` | Use existing secret with license key |
| license.secret.key | string | `""` | Key in secret with license key |
| license.secret.name | string | `""` | Existing secret name |
| rbac.annotations | object | `{}` |  |
| rbac.create | bool | `true` |  |
| rbac.extraLabels | object | `{}` |  |
| rbac.namespaced | bool | `false` |  |
| rbac.pspEnabled | bool | `true` |  |
| server.affinity | object | `{}` |  |
| server.annotations | object | `{}` |  |
| server.config.alerts.groups[0].name | string | `"应用指标"` |  |
| server.config.alerts.groups[0].rules[0].alert | string | `"平均请求延时相比昨天升高20%以上"` |  |
| server.config.alerts.groups[0].rules[0].annotations.description | string | `"VALUE = {{ $value }}\nLABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[0].rules[0].expr | string | `"(sum by (svc_name, content_key) (increase(kindling_span_trace_duration_nanoseconds_sum[1m])) / sum by (svc_name, content_key) (increase(kindling_span_trace_duration_nanoseconds_count[1m]))) / (sum by (svc_name, content_key) (increase(kindling_span_trace_duration_nanoseconds_sum[1m] offset 24h))/ sum by (svc_name, content_key) (increase(kindling_span_trace_duration_nanoseconds_count[1m] offset 24h))) - 1 > 0.2"` |  |
| server.config.alerts.groups[0].rules[0].for | string | `"1m"` |  |
| server.config.alerts.groups[0].rules[0].labels.group | string | `"app"` |  |
| server.config.alerts.groups[0].rules[0].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[0].rules[1].alert | string | `"请求错误率相比昨天升高20%以上"` |  |
| server.config.alerts.groups[0].rules[1].annotations.description | string | `"VALUE = {{ $value }}\nLABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[0].rules[1].expr | string | `"((sum by (svc_name, content_key) (increase(kindling_span_trace_duration_nanoseconds_count{is_error=\"true\"}[1m])) / sum by (svc_name, content_key) (increase(kindling_span_trace_duration_nanoseconds_count{}[1m]))) or (sum by (svc_name, content_key) (increase(kindling_span_trace_duration_nanoseconds_count{}[1m])) * 0)) / ((sum by (svc_name, content_key) (increase(kindling_span_trace_duration_nanoseconds_count{is_error=\"true\"}[1m] offset 24h)) / sum by (svc_name, content_key) (increase(kindling_span_trace_duration_nanoseconds_count{}[1m] offset 24h))) or (sum by (svc_name, content_key) (increase(kindling_span_trace_duration_nanoseconds_count{}[1m] offset 24h)) * 0)) - 1 > 0.2"` |  |
| server.config.alerts.groups[0].rules[1].for | string | `"1m"` |  |
| server.config.alerts.groups[0].rules[1].labels.group | string | `"app"` |  |
| server.config.alerts.groups[0].rules[1].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[0].rules[2].alert | string | `"日志错误数相比昨天升高20%以上"` |  |
| server.config.alerts.groups[0].rules[2].annotations.description | string | `"VALUE = {{ $value }}\nLABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[0].rules[2].expr | string | `"((sum by(container_id, node_name, pid) (increase(originx_logparser_level_count_total{level=~\"error|critical\"}[1m])) + sum by(container_id, node_name, pid) (increase(originx_logparser_exception_count_total{}[1m])) or vector(0)) - (sum by(container_id, node_name, pid) (increase(originx_logparser_level_count_total{level=~\"error|critical\"}[1m] offset 24h)) + sum by(container_id, node_name, pid) (increase(originx_logparser_exception_count_total{}[1m] offset 24h)) or vector(0)))/(sum by(container_id, node_name, pid) (increase(originx_logparser_level_count_total{level=~\"error|critical\"}[1m] offset 24h)) + sum by(container_id, node_name, pid) (increase(originx_logparser_exception_count_total{}[1m] offset 24h)) or vector(0)) - 1 > 0.2"` |  |
| server.config.alerts.groups[0].rules[2].for | string | `"1m"` |  |
| server.config.alerts.groups[0].rules[2].labels.group | string | `"app"` |  |
| server.config.alerts.groups[0].rules[2].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[0].rules[3].alert | string | `"平均请求延时超过1s"` |  |
| server.config.alerts.groups[0].rules[3].annotations.description | string | `"平均请求延时超过1s\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[0].rules[3].annotations.summary | string | `"平均请求延时超过1s (服务名 {{ $labels.svc_name }}, 服务端点 {{ $labels.content_key }})"` |  |
| server.config.alerts.groups[0].rules[3].expr | string | `"sum by (svc_name, content_key) (increase(kindling_span_trace_duration_nanoseconds_sum[1m]))/ sum by (svc_name, content_key) (increase(kindling_span_trace_duration_nanoseconds_count[1m]))/1000000 > 1000"` |  |
| server.config.alerts.groups[0].rules[3].for | string | `"1m"` |  |
| server.config.alerts.groups[0].rules[3].labels.group | string | `"app"` |  |
| server.config.alerts.groups[0].rules[3].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[0].rules[4].alert | string | `"请求错误率超过0%"` |  |
| server.config.alerts.groups[0].rules[4].annotations.description | string | `"请求错误率超过0%\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[0].rules[4].annotations.summary | string | `"请求错误率超过0% (服务名 {{ $labels.svc_name }}, 服务端点 {{ $labels.content_key }})"` |  |
| server.config.alerts.groups[0].rules[4].expr | string | `"sum by (svc_name, content_key) (increase(kindling_span_trace_duration_nanoseconds_count{is_error=\"true\"}[1m]))/ sum by (svc_name, content_key) (increase(kindling_span_trace_duration_nanoseconds_count[1m])) > 0"` |  |
| server.config.alerts.groups[0].rules[4].for | string | `"1m"` |  |
| server.config.alerts.groups[0].rules[4].labels.group | string | `"app"` |  |
| server.config.alerts.groups[0].rules[4].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[1].name | string | `"主机相关"` |  |
| server.config.alerts.groups[1].rules[0].alert | string | `"磁盘不足20%"` |  |
| server.config.alerts.groups[1].rules[0].annotations.description | string | `"Disk is almost full (< 20% left)\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[1].rules[0].annotations.summary | string | `"Host out of disk space (instance_name {{ $labels.instance_name }})"` |  |
| server.config.alerts.groups[1].rules[0].expr | string | `"((node_filesystem_avail_bytes * 100) / node_filesystem_size_bytes < 20 and ON (instance_name, device, mountpoint) node_filesystem_readonly == 0) * on(instance_name) group_left (nodename) node_uname_info{nodename=~\".+\"}"` |  |
| server.config.alerts.groups[1].rules[0].for | string | `"1m"` |  |
| server.config.alerts.groups[1].rules[0].labels.group | string | `"infra"` |  |
| server.config.alerts.groups[1].rules[0].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[1].rules[1].alert | string | `"异常网络入吞吐量"` |  |
| server.config.alerts.groups[1].rules[1].annotations.description | string | `"Host network interfaces are probably receiving too much data (> 100 MB/s)\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[1].rules[1].annotations.summary | string | `"Host unusual network throughput in (instance_name {{ $labels.instance_name }})"` |  |
| server.config.alerts.groups[1].rules[1].expr | string | `"(sum by (instance_name) (rate(node_network_receive_bytes_total[2m])) / 1024 / 1024 > 100) * on(instance_name) group_left (nodename) node_uname_info{nodename=~\".+\"}"` |  |
| server.config.alerts.groups[1].rules[1].for | string | `"1m"` |  |
| server.config.alerts.groups[1].rules[1].labels.group | string | `"infra"` |  |
| server.config.alerts.groups[1].rules[1].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[1].rules[2].alert | string | `"异常磁盘读速度"` |  |
| server.config.alerts.groups[1].rules[2].annotations.description | string | `"Disk is probably reading too much data (> 50 MB/s)\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[1].rules[2].annotations.summary | string | `"Host unusual disk read rate (instance_name {{ $labels.instance_name }})"` |  |
| server.config.alerts.groups[1].rules[2].expr | string | `"(sum by (instance_name) (rate(node_disk_read_bytes_total[2m])) / 1024 / 1024 > 50) * on(instance_name) group_left (nodename) node_uname_info{nodename=~\".+\"}"` |  |
| server.config.alerts.groups[1].rules[2].for | string | `"1m"` |  |
| server.config.alerts.groups[1].rules[2].labels.group | string | `"infra"` |  |
| server.config.alerts.groups[1].rules[2].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[1].rules[3].alert | string | `"异常磁盘写速度"` |  |
| server.config.alerts.groups[1].rules[3].annotations.description | string | `"Disk is probably writing too much data (> 50 MB/s)\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[1].rules[3].annotations.summary | string | `"Host unusual disk write rate (instance_name {{ $labels.instance_name }})"` |  |
| server.config.alerts.groups[1].rules[3].expr | string | `"(sum by (instance_name) (rate(node_disk_written_bytes_total[2m])) / 1024 / 1024 > 50) * on(instance_name) group_left (nodename) node_uname_info{nodename=~\".+\"}"` |  |
| server.config.alerts.groups[1].rules[3].for | string | `"1m"` |  |
| server.config.alerts.groups[1].rules[3].labels.group | string | `"infra"` |  |
| server.config.alerts.groups[1].rules[3].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[1].rules[4].alert | string | `"CPU高负载"` |  |
| server.config.alerts.groups[1].rules[4].annotations.description | string | `"CPU load is > 80%\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[1].rules[4].annotations.summary | string | `"Host high CPU load (instance_name {{ $labels.instance_name }})"` |  |
| server.config.alerts.groups[1].rules[4].expr | string | `"(sum by (instance_name) (avg by (mode, instance_name) (rate(node_cpu_seconds_total{mode!=\"idle\"}[2m]))) > 0.8) * on(instance_name) group_left (nodename) node_uname_info{nodename=~\".+\"}"` |  |
| server.config.alerts.groups[1].rules[4].for | string | `"1m"` |  |
| server.config.alerts.groups[1].rules[4].labels.group | string | `"infra"` |  |
| server.config.alerts.groups[1].rules[4].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[1].rules[5].alert | string | `"CPU高IO Wait"` |  |
| server.config.alerts.groups[1].rules[5].annotations.description | string | `"CPU iowait > 10%. A high iowait means that you are disk or network bound.\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[1].rules[5].annotations.summary | string | `"Host CPU high iowait (instance_name {{ $labels.instance_name }})"` |  |
| server.config.alerts.groups[1].rules[5].expr | string | `"(avg by (instance_name) (rate(node_cpu_seconds_total{mode=\"iowait\"}[5m])) * 100 > 10) * on(instance_name) group_left (nodename) node_uname_info{nodename=~\".+\"}"` |  |
| server.config.alerts.groups[1].rules[5].for | string | `"0m"` |  |
| server.config.alerts.groups[1].rules[5].labels.group | string | `"infra"` |  |
| server.config.alerts.groups[1].rules[5].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[1].rules[6].alert | string | `"异常磁盘IO利用率"` |  |
| server.config.alerts.groups[1].rules[6].annotations.description | string | `"Time spent in IO is too high on {{ $labels.instance_name }}. Check storage for issues.\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[1].rules[6].annotations.summary | string | `"Host unusual disk IO (instance_name {{ $labels.instance_name }})"` |  |
| server.config.alerts.groups[1].rules[6].expr | string | `"(rate(node_disk_io_time_seconds_total[1m]) > 0.5) * on(instance_name) group_left (nodename) node_uname_info{nodename=~\".+\"}"` |  |
| server.config.alerts.groups[1].rules[6].for | string | `"1m"` |  |
| server.config.alerts.groups[1].rules[6].labels.group | string | `"infra"` |  |
| server.config.alerts.groups[1].rules[6].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[2].name | string | `"网络相关"` |  |
| server.config.alerts.groups[2].rules[0].alert | string | `"网络RTT延时超过50ms"` |  |
| server.config.alerts.groups[2].rules[0].annotations.description | string | `"RTT is high (> 50 ms)\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[2].rules[0].annotations.summary | string | `"RTT is high (src_ip {{ $labels.src_ip }} dst_ip {{ $labels.dst_ip }})"` |  |
| server.config.alerts.groups[2].rules[0].expr | string | `"kindling_network_rtt{} * 1000 > 50"` |  |
| server.config.alerts.groups[2].rules[0].for | string | `"1m"` |  |
| server.config.alerts.groups[2].rules[0].labels.group | string | `"network"` |  |
| server.config.alerts.groups[2].rules[0].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[3].name | string | `"容器相关"` |  |
| server.config.alerts.groups[3].rules[0].alert | string | `"容器被Killed"` |  |
| server.config.alerts.groups[3].rules[0].annotations.description | string | `"A container has disappeared\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[3].rules[0].annotations.summary | string | `"Container killed (instance_name {{ $labels.instance_name }})"` |  |
| server.config.alerts.groups[3].rules[0].expr | string | `"time() - container_last_seen > 60"` |  |
| server.config.alerts.groups[3].rules[0].for | string | `"0m"` |  |
| server.config.alerts.groups[3].rules[0].labels.group | string | `"container"` |  |
| server.config.alerts.groups[3].rules[0].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[3].rules[1].alert | string | `"容器消亡"` |  |
| server.config.alerts.groups[3].rules[1].annotations.description | string | `"A container is absent for 5 min\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[3].rules[1].annotations.summary | string | `"Container absent (instance_name {{ $labels.instance_name }})"` |  |
| server.config.alerts.groups[3].rules[1].expr | string | `"absent(container_last_seen)"` |  |
| server.config.alerts.groups[3].rules[1].for | string | `"5m"` |  |
| server.config.alerts.groups[3].rules[1].labels.group | string | `"container"` |  |
| server.config.alerts.groups[3].rules[1].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[3].rules[2].alert | string | `"容器CPU使用率超过80%"` |  |
| server.config.alerts.groups[3].rules[2].annotations.description | string | `"Container CPU utilization is above 80%\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[3].rules[2].annotations.summary | string | `"Container High CPU utilization (instance_name {{ $labels.instance_name }})"` |  |
| server.config.alerts.groups[3].rules[2].expr | string | `"(sum(rate(container_cpu_usage_seconds_total{container!=\"\"}[5m])) by (pod, container) / sum(container_spec_cpu_quota{container!=\"\"}/container_spec_cpu_period{container!=\"\"}) by (pod, container) * 100) > 80"` |  |
| server.config.alerts.groups[3].rules[2].for | string | `"2m"` |  |
| server.config.alerts.groups[3].rules[2].labels.group | string | `"container"` |  |
| server.config.alerts.groups[3].rules[2].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[3].rules[3].alert | string | `"容器内存使用率超过80%"` |  |
| server.config.alerts.groups[3].rules[3].annotations.description | string | `"Container Memory usage is above 80%\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[3].rules[3].annotations.summary | string | `"Container High Memory usage (instance_name {{ $labels.instance_name }})"` |  |
| server.config.alerts.groups[3].rules[3].expr | string | `"(sum(container_memory_working_set_bytes{name!=\"\"}) BY (instance_name, name) / sum(container_spec_memory_limit_bytes > 0) BY (instance_name, name) * 100) > 80"` |  |
| server.config.alerts.groups[3].rules[3].for | string | `"2m"` |  |
| server.config.alerts.groups[3].rules[3].labels.group | string | `"container"` |  |
| server.config.alerts.groups[3].rules[3].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[3].rules[4].alert | string | `"容器持久卷使用率超过80%"` |  |
| server.config.alerts.groups[3].rules[4].annotations.description | string | `"Container Volume usage is above 80%\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[3].rules[4].annotations.summary | string | `"Container Volume usage (instance_name {{ $labels.instance_name }})"` |  |
| server.config.alerts.groups[3].rules[4].expr | string | `"(1 - (sum(container_fs_inodes_free{name!=\"\"}) BY (instance_name) / sum(container_fs_inodes_total) BY (instance_name))) * 100 > 80"` |  |
| server.config.alerts.groups[3].rules[4].for | string | `"2m"` |  |
| server.config.alerts.groups[3].rules[4].labels.group | string | `"container"` |  |
| server.config.alerts.groups[3].rules[4].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[3].rules[5].alert | string | `"容器高cpu_cfs_throttled"` |  |
| server.config.alerts.groups[3].rules[5].annotations.description | string | `"Container is being throttled\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[3].rules[5].annotations.summary | string | `"Container high throttle rate (instance_name {{ $labels.instance_name }})"` |  |
| server.config.alerts.groups[3].rules[5].expr | string | `"sum(increase(container_cpu_cfs_throttled_periods_total{container!=\"\"}[5m])) by (container, pod, namespace) / sum(increase(container_cpu_cfs_periods_total[5m])) by (container, pod, namespace) > (25 / 100)"` |  |
| server.config.alerts.groups[3].rules[5].for | string | `"5m"` |  |
| server.config.alerts.groups[3].rules[5].labels.group | string | `"container"` |  |
| server.config.alerts.groups[3].rules[5].labels.severity | string | `"warning"` |  |
| server.config.alerts.groups[3].rules[6].alert | string | `"容器CPU使用率低于20%"` |  |
| server.config.alerts.groups[3].rules[6].annotations.description | string | `"Container CPU utilization is under 20% for 1 week. Consider reducing the allocated CPU.\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[3].rules[6].annotations.summary | string | `"Container Low CPU utilization (instance_name {{ $labels.instance_name }})"` |  |
| server.config.alerts.groups[3].rules[6].expr | string | `"(sum(rate(container_cpu_usage_seconds_total{container!=\"\"}[5m])) by (pod, container) / sum(container_spec_cpu_quota{container!=\"\"}/container_spec_cpu_period{container!=\"\"}) by (pod, container) * 100) < 20"` |  |
| server.config.alerts.groups[3].rules[6].for | string | `"7d"` |  |
| server.config.alerts.groups[3].rules[6].labels.group | string | `"container"` |  |
| server.config.alerts.groups[3].rules[6].labels.severity | string | `"info"` |  |
| server.config.alerts.groups[3].rules[7].alert | string | `"容器内存使用率低于20%"` |  |
| server.config.alerts.groups[3].rules[7].annotations.description | string | `"Container Memory usage is under 20% for 1 week. Consider reducing the allocated memory.\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| server.config.alerts.groups[3].rules[7].annotations.summary | string | `"Container Low Memory usage (instance_name {{ $labels.instance_name }})"` |  |
| server.config.alerts.groups[3].rules[7].expr | string | `"(sum(container_memory_working_set_bytes{name!=\"\"}) BY (instance_name, name) / sum(container_spec_memory_limit_bytes > 0) BY (instance_name, name) * 100) < 20"` |  |
| server.config.alerts.groups[3].rules[7].for | string | `"7d"` |  |
| server.config.alerts.groups[3].rules[7].labels.group | string | `"container"` |  |
| server.config.alerts.groups[3].rules[7].labels.severity | string | `"info"` |  |
| server.configMap | string | `""` |  |
| server.datasource.basicAuth | object | `{"password":"","username":""}` | Basic auth for datasource |
| server.datasource.bearer.token | string | `""` | Token with Bearer token. You can use one of token or tokenFile. You don't need to add "Bearer" prefix string |
| server.datasource.bearer.tokenFile | string | `""` | Token Auth file with Bearer token. You can use one of token or tokenFile |
| server.datasource.url | string | `""` |  |
| server.enabled | bool | `true` |  |
| server.env | list | `[]` | Additional environment variables (ex.: secret tokens, flags) https://github.com/VictoriaMetrics/VictoriaMetrics#environment-variables |
| server.envFrom | list | `[]` |  |
| server.extraArgs."envflag.enable" | string | `"true"` |  |
| server.extraArgs."envflag.prefix" | string | `"VM_"` |  |
| server.extraArgs.configCheckInterval | string | `"15s"` |  |
| server.extraArgs.loggerFormat | string | `"json"` |  |
| server.extraContainers | list | `[]` | Additional containers to run in the same pod |
| server.extraHostPathMounts | list | `[]` | Additional hostPath mounts |
| server.extraVolumeMounts | list | `[]` | Extra Volume Mounts for the container |
| server.extraVolumes | list | `[]` | Extra Volumes for the pod |
| server.fullnameOverride | string | `""` |  |
| server.image.pullPolicy | string | `"IfNotPresent"` |  |
| server.image.repository | string | `"victoriametrics/vmalert"` |  |
| server.image.tag | string | `""` |  |
| server.image.variant | string | `""` |  |
| server.imagePullSecrets | list | `[]` |  |
| server.ingress.annotations | object | `{}` |  |
| server.ingress.enabled | bool | `false` |  |
| server.ingress.extraLabels | object | `{}` |  |
| server.ingress.hosts | list | `[]` |  |
| server.ingress.pathType | string | `"Prefix"` | pathType is only for k8s >= 1.1= |
| server.ingress.tls | list | `[]` |  |
| server.labels | object | `{}` |  |
| server.minReadySeconds | int | `0` |  |
| server.name | string | `"server"` |  |
| server.nameOverride | string | `""` |  |
| server.nodeSelector | object | `{}` |  |
| server.notifier | object | `{"alertmanager":{"basicAuth":{"password":"","username":""},"bearer":{"token":"","tokenFile":""},"url":""}}` | Notifier to use for alerts. Multiple notifiers can be enabled by using `notifiers` section |
| server.notifier.alertmanager.basicAuth | object | `{"password":"","username":""}` | Basic auth for alertmanager |
| server.notifier.alertmanager.bearer.token | string | `""` | Token with Bearer token. You can use one of token or tokenFile. You don't need to add "Bearer" prefix string |
| server.notifier.alertmanager.bearer.tokenFile | string | `""` | Token Auth file with Bearer token. You can use one of token or tokenFile |
| server.notifiers | list | `[]` | Additional notifiers to use for alerts |
| server.podAnnotations | object | `{}` |  |
| server.podDisruptionBudget.enabled | bool | `false` |  |
| server.podDisruptionBudget.labels | object | `{}` |  |
| server.podLabels | object | `{}` |  |
| server.podSecurityContext.enabled | bool | `true` |  |
| server.priorityClassName | string | `""` |  |
| server.probe.liveness.failureThreshold | int | `3` |  |
| server.probe.liveness.initialDelaySeconds | int | `5` |  |
| server.probe.liveness.periodSeconds | int | `15` |  |
| server.probe.liveness.timeoutSeconds | int | `5` |  |
| server.probe.readiness.failureThreshold | int | `3` |  |
| server.probe.readiness.initialDelaySeconds | int | `5` |  |
| server.probe.readiness.periodSeconds | int | `15` |  |
| server.probe.readiness.timeoutSeconds | int | `5` |  |
| server.remote.read.basicAuth | object | `{"password":"","username":""}` | Basic auth for remote read |
| server.remote.read.bearer.token | string | `""` | Token with Bearer token. You can use one of token or tokenFile. You don't need to add "Bearer" prefix string |
| server.remote.read.bearer.tokenFile | string | `""` | Token Auth file with Bearer token. You can use one of token or tokenFile |
| server.remote.read.url | string | `""` |  |
| server.remote.write.basicAuth | object | `{"password":"","username":""}` | Basic auth for remote write |
| server.remote.write.bearer | object | `{"token":"","tokenFile":""}` | Auth based on Bearer token for remote write |
| server.remote.write.bearer.token | string | `""` | Token with Bearer token. You can use one of token or tokenFile. You don't need to add "Bearer" prefix string |
| server.remote.write.bearer.tokenFile | string | `""` | Token Auth file with Bearer token. You can use one of token or tokenFile |
| server.remote.write.url | string | `""` |  |
| server.replicaCount | int | `1` |  |
| server.resources | object | `{}` |  |
| server.securityContext.enabled | bool | `true` |  |
| server.service.annotations | object | `{}` |  |
| server.service.clusterIP | string | `""` |  |
| server.service.externalIPs | list | `[]` |  |
| server.service.labels | object | `{}` |  |
| server.service.loadBalancerIP | string | `""` |  |
| server.service.loadBalancerSourceRanges | list | `[]` |  |
| server.service.servicePort | int | `8880` |  |
| server.service.type | string | `"ClusterIP"` |  |
| server.strategy.rollingUpdate.maxSurge | string | `"25%"` |  |
| server.strategy.rollingUpdate.maxUnavailable | string | `"25%"` |  |
| server.strategy.type | string | `"RollingUpdate"` |  |
| server.tolerations | list | `[]` |  |
| server.verticalPodAutoscaler | object | `{"enabled":false}` | Vertical Pod Autoscaler |
| server.verticalPodAutoscaler.enabled | bool | `false` | Use VPA for vmalert |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automountToken | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| serviceMonitor.annotations | object | `{}` |  |
| serviceMonitor.enabled | bool | `false` |  |
| serviceMonitor.extraLabels | object | `{}` |  |
| serviceMonitor.metricRelabelings | list | `[]` |  |
| serviceMonitor.relabelings | list | `[]` |  |
