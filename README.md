# apo

![Version: 0.6.000](https://img.shields.io/badge/Version-0.6.000-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.6.0](https://img.shields.io/badge/AppVersion-0.6.0-informational?style=flat-square)

apo deployment charts

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://dep/altinity-clickhouse-operator | altinity-clickhouse-operator |  |
| file://dep/apo-backend | apo-backend |  |
| file://dep/apo-collector | apo-collector |  |
| file://dep/apo-front | apo-front |  |
| file://dep/apo-jaeger-collector | apo-jaeger-collector |  |
| file://dep/apo-one-agent | apo-one-agent |  |
| file://dep/apo-otel-collector-gateway | apo-otel-collector-gateway |  |
| file://dep/grafana | grafana |  |
| file://dep/vector | vector |  |
| file://dep/victoria-metrics-alert | victoria-metrics-alert |  |
| file://dep/victoria-metrics-single | victoria-metrics-single |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| altinity-clickhouse-operator.clickhouse.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| altinity-clickhouse-operator.clickhouse.image.repository | string | `"{{ .Values.global.image.repository }}/clickhouse-server"` |  |
| altinity-clickhouse-operator.clickhouse.password | string | `"{{ .Values.global.clickhouseRootPassword }}"` |  |
| altinity-clickhouse-operator.clickhouse.persistence.enabled | bool | `false` |  |
| altinity-clickhouse-operator.clickhouse.username | string | `"{{ .Values.global.clickhouseRootUsername }}"` |  |
| altinity-clickhouse-operator.enabled | bool | `true` |  |
| altinity-clickhouse-operator.metrics.enabled | bool | `true` |  |
| altinity-clickhouse-operator.metrics.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| altinity-clickhouse-operator.metrics.image.repository | string | `"{{ .Values.global.image.repository }}/metrics-exporter"` |  |
| altinity-clickhouse-operator.operator.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| altinity-clickhouse-operator.operator.image.repository | string | `"{{ .Values.global.image.repository }}/clickhouse-operator"` |  |
| apo-backend.apoBackend.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-backend.apoBackend.image.repository | string | `"{{ .Values.global.image.repository }}/apo-backend"` |  |
| apo-backend.apoBackend.image.tag | string | `"v0.6.0"` |  |
| apo-backend.apoPolarisAnalyzer.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-backend.apoPolarisAnalyzer.image.repository | string | `"{{ .Values.global.image.repository }}/polaris-analyzer"` |  |
| apo-backend.apoPolarisAnalyzer.image.tag | string | `"v0.1.1"` |  |
| apo-backend.config.clickhousePassword | string | `"{{ .Values.global.clickhouseRootPassword }}"` |  |
| apo-backend.config.clickhouseUrl | string | `"{{ .Values.global.clickhouseUrl }}"` |  |
| apo-backend.config.clickhouseUsername | string | `"{{ .Values.global.clickhouseRootUsername }}"` |  |
| apo-backend.config.victoriaMetricsUrl | string | `"{{ .Values.global.victoriaMetricsUrl }}"` |  |
| apo-backend.enabled | bool | `true` |  |
| apo-backend.initImage.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-backend.initImage.repository | string | `"{{ .Values.global.image.repository }}/busybox"` |  |
| apo-backend.initImage.tag | string | `"1.36.1"` |  |
| apo-backend.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| apo-backend.persistence.enabled | bool | `false` |  |
| apo-backend.persistence.size | string | `"1Gi"` |  |
| apo-backend.persistence.storageClass | string | `""` |  |
| apo-backend.service.nodePort | int | `31363` |  |
| apo-backend.service.type | string | `"NodePort"` |  |
| apo-collector.apoApmAdapter.config.jaegerCollectorUrl | string | `"apo-jaeger-collector-svc:16686"` |  |
| apo-collector.apoApmAdapter.config.pinpointAddress | string | `""` |  |
| apo-collector.apoApmAdapter.config.skywalkingAddress | string | `""` |  |
| apo-collector.apoApmAdapter.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-collector.apoApmAdapter.image.repository | string | `"{{ .Values.global.image.repository }}/apm-adapter"` |  |
| apo-collector.apoApmAdapter.image.tag | string | `"v1.6.0"` |  |
| apo-collector.apoApmAdapter.service.port | int | `8079` |  |
| apo-collector.apoCollector.config.apmAdapterUrl | string | `"apo-apm-adapter-svc:8079"` |  |
| apo-collector.apoCollector.config.apoBackendUrl | string | `"http://apo-backend-svc:8080"` |  |
| apo-collector.apoCollector.config.clickhousePassword | string | `"{{ .Values.global.clickhouseRootPassword }}"` |  |
| apo-collector.apoCollector.config.clickhouseUrl | string | `"{{ .Values.global.clickhouseUrl }}"` |  |
| apo-collector.apoCollector.config.clickhouseUsername | string | `"{{ .Values.global.clickhouseRootUsername }}"` |  |
| apo-collector.apoCollector.config.victoriaMetricsUrl | string | `"{{ .Values.global.victoriaMetricsUrl }}"` |  |
| apo-collector.apoCollector.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-collector.apoCollector.image.repository | string | `"{{ .Values.global.image.repository }}/apo-collector"` |  |
| apo-collector.apoCollector.image.tag | string | `"v1.6.1"` |  |
| apo-collector.apoCollector.service.nodePortGrpc | int | `30044` |  |
| apo-collector.apoCollector.service.nodePortHttp | int | `30090` |  |
| apo-collector.apoCollector.service.port | int | `29090` |  |
| apo-collector.apoCollector.service.targetPort | int | `29090` |  |
| apo-collector.apoCollector.service.type | string | `"NodePort"` |  |
| apo-collector.enabled | bool | `true` |  |
| apo-collector.initImage.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-collector.initImage.repository | string | `"{{ .Values.global.image.repository }}/busybox"` |  |
| apo-collector.initImage.tag | string | `"1.36.1"` |  |
| apo-front.config.apoBackendUrl | string | `"http://apo-backend-svc:8080"` |  |
| apo-front.config.apoGrafanaUrl | string | `"http://apo-grafana-svc:80"` |  |
| apo-front.config.apoJaegerCollectorUrl | string | `"http://apo-jaeger-collector-svc:16686"` |  |
| apo-front.enabled | bool | `true` |  |
| apo-front.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-front.image.repository | string | `"{{ .Values.global.image.repository }}/apo-front"` |  |
| apo-front.image.tag | string | `"v0.6.0"` |  |
| apo-front.service.nodePort | int | `31364` |  |
| apo-front.service.type | string | `"NodePort"` |  |
| apo-jaeger-collector.config.clickhousePassword | string | `"{{ .Values.global.clickhouseRootPassword }}"` |  |
| apo-jaeger-collector.config.clickhouseUrl | string | `"{{ .Values.global.clickhouseUrl }}"` |  |
| apo-jaeger-collector.config.clickhouseUsername | string | `"{{ .Values.global.clickhouseRootUsername }}"` |  |
| apo-jaeger-collector.enabled | bool | `true` |  |
| apo-jaeger-collector.initImage.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-jaeger-collector.initImage.repository | string | `"{{ .Values.global.image.repository }}/busybox"` |  |
| apo-jaeger-collector.initImage.tag | string | `"1.36.1"` |  |
| apo-jaeger-collector.jaegerCollector.image.repository | string | `"{{ .Values.global.image.repository }}/jaeger-collector"` |  |
| apo-jaeger-collector.jaegerCollector.image.tag | string | `"1.59-latest"` |  |
| apo-jaeger-collector.jaegerQuery.image.repository | string | `"{{ .Values.global.image.repository }}/jaeger-query"` |  |
| apo-jaeger-collector.jaegerQuery.image.tag | float | `1.58` |  |
| apo-jaeger-collector.remoteStorage.image.pullPolicy | string | `"IfNotPresent"` |  |
| apo-jaeger-collector.remoteStorage.image.repository | string | `"{{ .Values.global.image.repository }}/jaeger-remote-storage"` |  |
| apo-jaeger-collector.remoteStorage.image.tag | string | `"v0.2.0"` |  |
| apo-one-agent.apo-nginx-proxy.enabled | bool | `false` |  |
| apo-one-agent.apo-nginx-proxy.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-one-agent.apo-nginx-proxy.image.repository | string | `"{{ .Values.global.image.repository }}/nginx"` |  |
| apo-one-agent.apo-nginx-proxy.image.tag | string | `"stable-alpine3.20"` |  |
| apo-one-agent.apo-otel-collector.enabled | bool | `false` |  |
| apo-one-agent.apoGoSdkAuto.apoOtelCollectorUrl | string | `"localhost:4318"` |  |
| apo-one-agent.apoGoSdkAuto.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-one-agent.apoGoSdkAuto.image.repository | string | `"{{ .Values.global.image.repository }}/sdk-auto"` |  |
| apo-one-agent.apoGoSdkAuto.image.tag | string | `"v1.1.0"` |  |
| apo-one-agent.apoIlogtail.apoOtelCollectorGrpcUrl | string | `"apo-otel-collector-gateway-svc:4315"` |  |
| apo-one-agent.apoIlogtail.apoVectorLogUrl | string | `"apo-vector-svc:4310"` |  |
| apo-one-agent.apoIlogtail.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-one-agent.apoIlogtail.image.repository | string | `"{{ .Values.global.image.repository }}/ilogtail"` |  |
| apo-one-agent.apoIlogtail.image.tag | string | `"v1.5.0"` |  |
| apo-one-agent.apoNodeAgent.apoOtelCollectorUrl | string | `"apo-otel-collector-gateway-svc:8080"` |  |
| apo-one-agent.apoNodeAgent.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-one-agent.apoNodeAgent.image.repository | string | `"{{ .Values.global.image.repository }}/node-agent"` |  |
| apo-one-agent.apoNodeAgent.image.tag | string | `"v1.6.1"` |  |
| apo-one-agent.apoOneAgent.config.apoCollectorPort | string | `"29090"` |  |
| apo-one-agent.apoOneAgent.config.apoCollectorUrl | string | `"apo-collector-svc.apo"` |  |
| apo-one-agent.apoOneAgent.config.javaAgentType | string | `"opentelemetry"` |  |
| apo-one-agent.apoOneAgent.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-one-agent.apoOneAgent.image.repository | string | `"{{ .Values.global.image.repository }}/ebpf-agent"` |  |
| apo-one-agent.apoOneAgent.image.tag | string | `"v1.7.0"` |  |
| apo-one-agent.apoOtelCollectorAgent.config.apoCollectorPort | string | `"29090"` |  |
| apo-one-agent.apoOtelCollectorAgent.config.apoCollectorUrl | string | `"apo-collector-svc"` |  |
| apo-one-agent.apoOtelCollectorAgent.config.apoOtelCollectorGRPCPort | string | `"4315"` |  |
| apo-one-agent.apoOtelCollectorAgent.config.apoOtelCollectorUrl | string | `"apo-otel-collector-gateway-svc"` |  |
| apo-one-agent.apoOtelCollectorAgent.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-one-agent.apoOtelCollectorAgent.image.repository | string | `"{{ .Values.global.image.repository }}/apo-otel-collector"` |  |
| apo-one-agent.apoOtelCollectorAgent.image.tag | string | `"v0.6.0"` |  |
| apo-one-agent.enabled | bool | `false` |  |
| apo-one-agent.grafanaAlloy.config.apoOtelCollectorGrpcUrl | string | `"apo-otel-collector-gateway-svc:4315"` |  |
| apo-one-agent.grafanaAlloy.config.apoOtelCollectorHttpUrl | string | `"apo-otel-collector-gateway-svc:4316"` |  |
| apo-one-agent.grafanaAlloy.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-one-agent.grafanaAlloy.image.repository | string | `"{{ .Values.global.image.repository }}/grafana-alloy"` |  |
| apo-one-agent.grafanaAlloy.image.tag | string | `"v1.2.1"` |  |
| apo-one-agent.odiglet.apoOtelCollectorGrpcUrl | string | `"apo-otel-collector-svc.apo:4317"` |  |
| apo-one-agent.odiglet.apoOtelCollectorHttpUrl | string | `"apo-otel-collector-svc.apo:4318"` |  |
| apo-one-agent.odiglet.apoOtelCollectorSkywalkingUrl | string | `"apo-otel-collector-svc.apo:11800"` |  |
| apo-one-agent.odiglet.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-one-agent.odiglet.image.repository | string | `"{{ .Values.global.image.repository }}/apo-odiglet"` |  |
| apo-one-agent.odiglet.image.tag | string | `"v0.5.1"` |  |
| apo-one-agent.odigos.config.apoOtelCollectorGrpcUrl | string | `"apo-otel-collector-gateway-svc.apo:4315"` |  |
| apo-one-agent.odigos.config.apoOtelCollectorHttpUrl | string | `"apo-otel-collector-gateway-svc.apo:4316"` |  |
| apo-one-agent.odigos.config.apoOtelCollectorSkywalkingUrl | string | `"apo-otel-collector-gateway-svc.apo:11800"` |  |
| apo-one-agent.odigos.config.javaAgentType | string | `"opentelemetry"` |  |
| apo-one-agent.odigos.enabled | bool | `true` |  |
| apo-one-agent.odigos.instrumentor.forceInstrumentAllNamespace | bool | `false` |  |
| apo-one-agent.odigos.instrumentor.image.imagePullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-one-agent.odigos.instrumentor.image.repository | string | `"{{ .Values.global.image.repository }}/apo-odigos-instrumentor"` |  |
| apo-one-agent.odigos.instrumentor.image.tag | string | `"v0.5.0"` |  |
| apo-one-agent.odigos.instrumentor.instrumentAllNamespace | bool | `false` |  |
| apo-one-agent.odigos.instrumentor.targetNamespace[0].name | string | `"default"` |  |
| apo-one-agent.odigos.instrumentor.targetNamespace[0].value | string | `"disabled"` |  |
| apo-otel-collector-gateway.config.apoBackendPort | string | `"8080"` |  |
| apo-otel-collector-gateway.config.apoBackendUrl | string | `"apo-backend-svc"` |  |
| apo-otel-collector-gateway.config.clickhousePassword | string | `"{{ .Values.global.clickhouseRootPassword }}"` |  |
| apo-otel-collector-gateway.config.clickhouseUrl | string | `"{{ .Values.global.clickhouseUrl }}"` |  |
| apo-otel-collector-gateway.config.clickhouseUsername | string | `"{{ .Values.global.clickhouseRootUsername }}"` |  |
| apo-otel-collector-gateway.config.jaegerCollectorUrl | string | `"http://apo-jaeger-collector-svc:4317"` |  |
| apo-otel-collector-gateway.config.victoriaMetricsUrl | string | `"{{ .Values.global.victoriaMetricsUrl }}"` |  |
| apo-otel-collector-gateway.enabled | bool | `true` |  |
| apo-otel-collector-gateway.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-otel-collector-gateway.image.repository | string | `"{{ .Values.global.image.repository }}/apo-otel-collector"` |  |
| apo-otel-collector-gateway.image.tag | string | `"v0.6.0"` |  |
| apo-otel-collector-gateway.initImage.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-otel-collector-gateway.initImage.repository | string | `"{{ .Values.global.image.repository }}/busybox"` |  |
| apo-otel-collector-gateway.initImage.tag | string | `"1.36.1"` |  |
| apo-otel-collector-gateway.rbac.create | bool | `true` |  |
| apo-otel-collector-gateway.serviceNodePort.ports[0].name | string | `"otlpgrpc"` |  |
| apo-otel-collector-gateway.serviceNodePort.ports[0].nodePort | int | `30317` |  |
| apo-otel-collector-gateway.serviceNodePort.ports[0].port | int | `4317` |  |
| apo-otel-collector-gateway.serviceNodePort.ports[0].protocol | string | `"TCP"` |  |
| apo-otel-collector-gateway.serviceNodePort.ports[0].targetPort | int | `4317` |  |
| apo-otel-collector-gateway.serviceNodePort.ports[1].name | string | `"otlpk8s"` |  |
| apo-otel-collector-gateway.serviceNodePort.ports[1].nodePort | int | `30319` |  |
| apo-otel-collector-gateway.serviceNodePort.ports[1].port | int | `4319` |  |
| apo-otel-collector-gateway.serviceNodePort.ports[1].protocol | string | `"TCP"` |  |
| apo-otel-collector-gateway.serviceNodePort.ports[1].targetPort | int | `4319` |  |
| apo-otel-collector-gateway.serviceNodePort.type | string | `"NodePort"` |  |
| global.agentCollectorMode[0] | string | `"trace"` |  |
| global.agentCollectorMode[1] | string | `"metrics"` |  |
| global.agentCollectorMode[2] | string | `"log"` |  |
| global.clickhouseClusterName | string | `""` |  |
| global.clickhouseDatabase | string | `"apo"` |  |
| global.clickhouseHttpUrl | string | `"apo-clickhouse-svc:8123"` |  |
| global.clickhouseReplication | string | `"false"` |  |
| global.clickhouseRootPassword | string | `"WPKf-e9U.X)K)ezTDo9#"` |  |
| global.clickhouseRootUsername | string | `"admin"` |  |
| global.clickhouseUrl | string | `"apo-clickhouse-svc:9000"` |  |
| global.image.pullPolicy | string | `"Always"` |  |
| global.image.repository | string | `"registry.cn-hangzhou.aliyuncs.com/kindlingx"` |  |
| global.victoriaMetricsUrl | string | `"http://apo-victoria-metrics-single-server-svc:8428"` |  |
| grafana."grafana.ini".server.domain | string | `"localhost"` |  |
| grafana.datasources."datasources.yaml".apiVersion | int | `1` |  |
| grafana.datasources."datasources.yaml".datasources[0].access | string | `"proxy"` |  |
| grafana.datasources."datasources.yaml".datasources[0].isDefault | bool | `true` |  |
| grafana.datasources."datasources.yaml".datasources[0].name | string | `"APO-VictoriaMetric"` |  |
| grafana.datasources."datasources.yaml".datasources[0].type | string | `"prometheus"` |  |
| grafana.datasources."datasources.yaml".datasources[0].uid | string | `"APO-VictoriaMetric"` |  |
| grafana.datasources."datasources.yaml".datasources[0].url | string | `"{{ .Values.global.victoriaMetricsUrl }}"` |  |
| grafana.enabled | bool | `true` |  |
| grafana.extraInitContainers[0].image | string | `"{{ .Values.global.image.repository }}/apo-grafana-init-dashboards:v0.5.0"` |  |
| grafana.extraInitContainers[0].imagePullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| grafana.extraInitContainers[0].name | string | `"apo-grafana-init-dashboard"` |  |
| grafana.extraInitContainers[0].volumeMounts[0].mountPath | string | `"/tmp/dashboards"` |  |
| grafana.extraInitContainers[0].volumeMounts[0].name | string | `"apo-dashboards"` |  |
| grafana.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| grafana.image.registry | string | `"{{ .Values.global.image.repository }}"` |  |
| grafana.image.repository | string | `"grafana"` | Docker image repository |
| grafana.image.tag | string | `"10.4.1"` |  |
| grafana.rbac.create | bool | `false` |  |
| vector.clickhousePassword | string | `"{{ .Values.global.clickhouseRootPassword }}"` |  |
| vector.clickhouseUrl | string | `"{{ .Values.global.clickhouseUrl }}"` |  |
| vector.clickhouseUsername | string | `"{{ .Values.global.clickhouseRootUsername }}"` |  |
| vector.enabled | bool | `true` |  |
| vector.fullnameOverride | string | `"apo-vector"` |  |
| vector.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| vector.image.repository | string | `"{{ .Values.global.image.repository }}/vector"` |  |
| vector.image.tag | string | `"0.41.1-distroless-libc"` |  |
| vector.role | string | `"Stateless-Aggregator"` |  |
| vector.service.ports[0].name | string | `"datadog-agent"` |  |
| vector.service.ports[0].nodePort | int | `30310` |  |
| vector.service.ports[0].port | int | `4310` |  |
| vector.service.ports[0].protocol | string | `"TCP"` |  |
| vector.service.ports[0].targetPort | int | `4310` |  |
| vector.service.type | string | `"NodePort"` |  |
| victoria-metrics-alert.alertmanager.config.global.resolve_timeout | string | `"5m"` |  |
| victoria-metrics-alert.alertmanager.config.receivers[0].name | string | `"alert-collector"` |  |
| victoria-metrics-alert.alertmanager.config.receivers[0].webhook_configs[0].url | string | `"http://apo-backend-svc:8080/api/alerts/inputs/alertmanager"` |  |
| victoria-metrics-alert.alertmanager.config.route.group_by[0] | string | `"alertname"` |  |
| victoria-metrics-alert.alertmanager.config.route.group_interval | string | `"10s"` |  |
| victoria-metrics-alert.alertmanager.config.route.group_wait | string | `"30s"` |  |
| victoria-metrics-alert.alertmanager.config.route.receiver | string | `"alert-collector"` |  |
| victoria-metrics-alert.alertmanager.config.route.repeat_interval | string | `"1m"` |  |
| victoria-metrics-alert.alertmanager.enabled | bool | `true` |  |
| victoria-metrics-alert.alertmanager.extraContainers[0].args[0] | string | `"--volume-dir=/config"` |  |
| victoria-metrics-alert.alertmanager.extraContainers[0].args[1] | string | `"--webhook-url=http://127.0.0.1:9093/-/reload"` |  |
| victoria-metrics-alert.alertmanager.extraContainers[0].image | string | `"{{ .Values.global.image.repository }}/alertmanager-configmap-reload:v0.9.0"` |  |
| victoria-metrics-alert.alertmanager.extraContainers[0].imagePullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| victoria-metrics-alert.alertmanager.extraContainers[0].name | string | `"alertmanager-configmap-reload"` |  |
| victoria-metrics-alert.alertmanager.extraContainers[0].volumeMounts[0].mountPath | string | `"/config"` |  |
| victoria-metrics-alert.alertmanager.extraContainers[0].volumeMounts[0].name | string | `"config"` |  |
| victoria-metrics-alert.alertmanager.extraContainers[0].volumeMounts[0].readOnly | bool | `true` |  |
| victoria-metrics-alert.alertmanager.image | string | `"{{ .Values.global.image.repository }}/alertmanager"` |  |
| victoria-metrics-alert.alertmanager.tag | string | `"v0.25.0"` |  |
| victoria-metrics-alert.enabled | bool | `true` |  |
| victoria-metrics-alert.rbac.create | bool | `false` |  |
| victoria-metrics-alert.server.datasource.url | string | `"{{ .Values.global.victoriaMetricsUrl }}"` |  |
| victoria-metrics-alert.server.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| victoria-metrics-alert.server.image.repository | string | `"{{ .Values.global.image.repository }}/vmalert"` |  |
| victoria-metrics-alert.server.image.tag | string | `"v1.102.0"` |  |
| victoria-metrics-single.enabled | bool | `true` |  |
| victoria-metrics-single.rbac.create | bool | `false` |  |
| victoria-metrics-single.server.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| victoria-metrics-single.server.image.repository | string | `"{{ .Values.global.image.repository }}/victoria-metrics"` |  |
| victoria-metrics-single.server.image.tag | string | `"v1.101.0"` |  |
| victoria-metrics-single.server.persistentVolume.enabled | bool | `false` |  |
| victoria-metrics-single.server.service.type | string | `"ClusterIP"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
