# apo-one-agent

![Version: 1.0.001](https://img.shields.io/badge/Version-1.0.001-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

apo-one-agent deployment charts

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://dep/apo-nginx-proxy | apo-nginx-proxy |  |
| file://dep/apo-otel-collector | apo-otel-collector |  |
| file://dep/odigos | odigos |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| apo-nginx-proxy.config.apoCollectorPort | string | `"{{ .Values.global.apoCollectorPort }}"` |  |
| apo-nginx-proxy.config.apoCollectorUrl | string | `"{{ .Values.global.apoServerIP }}"` |  |
| apo-nginx-proxy.enabled | bool | `true` |  |
| apo-nginx-proxy.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-nginx-proxy.image.repository | string | `"{{ .Values.global.image.repository }}/nginx"` |  |
| apo-nginx-proxy.image.tag | string | `"stable-alpine3.20"` |  |
| apo-otel-collector.config.apoBackendPort | string | `"{{ .Values.global.apoBackendPort }}"` |  |
| apo-otel-collector.config.apoBackendUrl | string | `"{{ .Values.global.apoServerIP }}"` |  |
| apo-otel-collector.config.apoOtelCollectorGatewayGRPCPort | string | `"{{ .Values.global.apoOtelCollectorGatewayGRPCPort }}"` |  |
| apo-otel-collector.config.apoOtelCollectorGatewayK8SPort | string | `"{{ .Values.global.apoOtelCollectorGatewayK8SPort }}"` |  |
| apo-otel-collector.config.apoOtelCollectorGatewayURL | string | `"{{ .Values.global.apoServerIP }}"` |  |
| apo-otel-collector.enabled | bool | `true` |  |
| apo-otel-collector.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apo-otel-collector.image.repository | string | `"{{ .Values.global.image.repository }}/apo-otel-collector"` |  |
| apo-otel-collector.image.tag | string | `"v1.0.0"` |  |
| apo-otel-collector.rbac.create | bool | `true` |  |
| apo-otel-collector.resources.limits.cpu | string | `"3000m"` |  |
| apo-otel-collector.resources.limits.memory | string | `"3072Mi"` |  |
| apo-otel-collector.resources.requests.cpu | string | `"100m"` |  |
| apo-otel-collector.resources.requests.memory | string | `"128Mi"` |  |
| apo-otel-collector.service.ports[0].name | string | `"query"` |  |
| apo-otel-collector.service.ports[0].port | int | `8080` |  |
| apo-otel-collector.service.ports[0].protocol | string | `"TCP"` |  |
| apo-otel-collector.service.ports[0].targetPort | int | `8080` |  |
| apo-otel-collector.service.ports[1].name | string | `"metric"` |  |
| apo-otel-collector.service.ports[1].port | int | `9500` |  |
| apo-otel-collector.service.ports[1].protocol | string | `"TCP"` |  |
| apo-otel-collector.service.ports[1].targetPort | int | `9500` |  |
| apo-otel-collector.service.ports[2].name | string | `"otlpgrpc"` |  |
| apo-otel-collector.service.ports[2].port | int | `4317` |  |
| apo-otel-collector.service.ports[2].protocol | string | `"TCP"` |  |
| apo-otel-collector.service.ports[2].targetPort | int | `4317` |  |
| apo-otel-collector.service.ports[3].name | string | `"otlphttp"` |  |
| apo-otel-collector.service.ports[3].port | int | `4318` |  |
| apo-otel-collector.service.ports[3].protocol | string | `"TCP"` |  |
| apo-otel-collector.service.ports[3].targetPort | int | `4318` |  |
| apo-otel-collector.service.ports[4].name | string | `"sk-receiver"` |  |
| apo-otel-collector.service.ports[4].port | int | `11800` |  |
| apo-otel-collector.service.ports[4].protocol | string | `"TCP"` |  |
| apo-otel-collector.service.ports[4].targetPort | int | `11800` |  |
| apo-otel-collector.service.type | string | `"ClusterIP"` |  |
| apoIlogtail.apoOtelCollectorGrpcUrl | string | `"apo-otel-collector-svc:4317"` |  |
| apoIlogtail.apoVectorLogUrl | string | `"{{ .Values.global.apoServerIP }}:{{ .Values.global.apoVectorLogPort }}"` |  |
| apoIlogtail.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apoIlogtail.image.repository | string | `"{{ .Values.global.image.repository }}/ilogtail"` |  |
| apoIlogtail.image.tag | string | `"v1.5.0"` |  |
| apoIlogtail.resources.limits.cpu | string | `"1000m"` |  |
| apoIlogtail.resources.limits.memory | string | `"1024Mi"` |  |
| apoIlogtail.resources.requests.cpu | string | `"100m"` |  |
| apoIlogtail.resources.requests.memory | string | `"128Mi"` |  |
| apoNodeAgent.apoOtelCollectorUrl | string | `"apo-otel-collector-svc:8080"` |  |
| apoNodeAgent.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apoNodeAgent.image.repository | string | `"{{ .Values.global.image.repository }}/node-agent"` |  |
| apoNodeAgent.image.tag | string | `"v1.7.0"` |  |
| apoNodeAgent.resources.limits.cpu | string | `"200m"` |  |
| apoNodeAgent.resources.limits.memory | string | `"128Mi"` |  |
| apoNodeAgent.resources.requests.cpu | string | `"100m"` |  |
| apoNodeAgent.resources.requests.memory | string | `"128Mi"` |  |
| apoOneAgent.config.apoCollectorPort | string | `"{{ .Values.global.apoProxyPort }}"` |  |
| apoOneAgent.config.apoCollectorUrl | string | `"{{ .Values.global.apoProxyUrl }}"` |  |
| apoOneAgent.config.javaAgentType | string | `"opentelemetry"` |  |
| apoOneAgent.enabled | bool | `true` |  |
| apoOneAgent.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apoOneAgent.image.repository | string | `"{{ .Values.global.image.repository }}/ebpf-agent"` |  |
| apoOneAgent.image.tag | string | `"v1.7.3"` |  |
| apoOneAgent.resources.limits.cpu | string | `"1000m"` |  |
| apoOneAgent.resources.limits.memory | string | `"1024Mi"` |  |
| apoOneAgent.resources.requests.cpu | string | `"100m"` |  |
| apoOneAgent.resources.requests.memory | string | `"128Mi"` |  |
| apoOtelCollectorAgent.config.apoCollectorPort | string | `"{{ .Values.global.apoProxyPort }}"` |  |
| apoOtelCollectorAgent.config.apoCollectorUrl | string | `"{{ .Values.global.apoProxyUrl }}"` |  |
| apoOtelCollectorAgent.config.apoOtelCollectorGRPCPort | string | `"4317"` |  |
| apoOtelCollectorAgent.config.apoOtelCollectorUrl | string | `"apo-otel-collector-svc"` |  |
| apoOtelCollectorAgent.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| apoOtelCollectorAgent.image.repository | string | `"{{ .Values.global.image.repository }}/apo-otel-collector"` |  |
| apoOtelCollectorAgent.image.tag | string | `"v1.0.0"` |  |
| apoOtelCollectorAgent.resources.limits.cpu | string | `"1000m"` |  |
| apoOtelCollectorAgent.resources.limits.memory | string | `"1024Mi"` |  |
| apoOtelCollectorAgent.resources.requests.cpu | string | `"100m"` |  |
| apoOtelCollectorAgent.resources.requests.memory | string | `"128Mi"` |  |
| dnsPolicy | string | `"ClusterFirstWithHostNet"` |  |
| global.agentCollectorMode[0] | string | `"trace"` |  |
| global.agentCollectorMode[1] | string | `"metrics"` |  |
| global.agentCollectorMode[2] | string | `"log"` |  |
| global.apoBackendPort | int | `31363` |  |
| global.apoCollectorPort | int | `30044` |  |
| global.apoOtelCollectorGatewayGRPCPort | int | `30317` |  |
| global.apoOtelCollectorGatewayK8SPort | int | `30319` |  |
| global.apoProxyPort | int | `29090` |  |
| global.apoProxyUrl | string | `"apo-nginx-proxy-svc"` |  |
| global.apoServerIP | string | `""` |  |
| global.apoVectorLogPort | int | `30310` |  |
| global.edition | string | `"ee"` |  |
| global.image.eeRepository | string | `"registry.cn-hangzhou.aliyuncs.com/kindlingx"` |  |
| global.image.pullPolicy | string | `"Always"` |  |
| global.image.repository | string | `"registry.cn-hangzhou.aliyuncs.com/kindlingx"` |  |
| grafanaAlloy.config.apoOtelCollectorGrpcUrl | string | `"apo-otel-collector-svc:4317"` |  |
| grafanaAlloy.config.apoOtelCollectorHttpUrl | string | `"apo-otel-collector-svc:4318"` |  |
| grafanaAlloy.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| grafanaAlloy.image.repository | string | `"{{ .Values.global.image.repository }}/grafana-alloy"` |  |
| grafanaAlloy.image.tag | string | `"v1.4.2"` |  |
| grafanaAlloy.resources.limits.cpu | string | `"2000m"` |  |
| grafanaAlloy.resources.limits.memory | string | `"2048Mi"` |  |
| grafanaAlloy.resources.requests.cpu | string | `"100m"` |  |
| grafanaAlloy.resources.requests.memory | string | `"128Mi"` |  |
| grafanaBeyla.config.k8sNamespace | string | `"^/(/?/!apo$).*"` |  |
| grafanaBeyla.enabled | bool | `true` |  |
| grafanaBeyla.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| grafanaBeyla.image.repository | string | `"{{ .Values.global.image.repository }}/apo-beyla"` |  |
| grafanaBeyla.image.tag | string | `"v1.8.4-1"` |  |
| grafanaBeyla.resources.limits.cpu | string | `"1000m"` |  |
| grafanaBeyla.resources.limits.memory | string | `"1024Mi"` |  |
| grafanaBeyla.resources.requests.cpu | string | `"100m"` |  |
| grafanaBeyla.resources.requests.memory | string | `"128Mi"` |  |
| nameOverride | string | `""` |  |
| odiglet.apoOtelCollectorGrpcUrl | string | `"apo-otel-collector-svc.{{ .Release.Namespace }}:4317"` |  |
| odiglet.apoOtelCollectorHttpUrl | string | `"apo-otel-collector-svc.{{ .Release.Namespace }}:4318"` |  |
| odiglet.apoOtelCollectorSkywalkingUrl | string | `"apo-otel-collector-svc.{{ .Release.Namespace }}:11800"` |  |
| odiglet.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| odiglet.image.repository | string | `"{{ .Values.global.image.repository }}/apo-odiglet"` |  |
| odiglet.image.tag | string | `"v1.0.0"` |  |
| odiglet.resources.limits.cpu | string | `"200m"` |  |
| odiglet.resources.limits.memory | string | `"200Mi"` |  |
| odiglet.resources.requests.cpu | string | `"10m"` |  |
| odiglet.resources.requests.memory | string | `"64Mi"` |  |
| odigos.config.apoOtelCollectorGrpcUrl | string | `"apo-otel-collector-svc.{{ .Release.Namespace }}:4317"` |  |
| odigos.config.apoOtelCollectorHttpUrl | string | `"apo-otel-collector-svc.{{ .Release.Namespace }}:4318"` |  |
| odigos.config.apoOtelCollectorSkywalkingUrl | string | `"apo-otel-collector-svc.{{ .Release.Namespace }}:11800"` |  |
| odigos.config.javaAgentType | string | `"opentelemetry"` |  |
| odigos.enabled | bool | `true` |  |
| odigos.instrumentor.forceInstrumentAllNamespace | bool | `false` |  |
| odigos.instrumentor.image.imagePullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| odigos.instrumentor.image.repository | string | `"{{ .Values.global.image.repository }}/apo-odigos-instrumentor"` |  |
| odigos.instrumentor.image.tag | string | `"v1.0.0"` |  |
| odigos.instrumentor.instrumentAllNamespace | bool | `true` |  |
| odigos.instrumentor.resources.limits.cpu | string | `"1000m"` |  |
| odigos.instrumentor.resources.limits.memory | string | `"1024Mi"` |  |
| odigos.instrumentor.resources.requests.cpu | string | `"10m"` |  |
| odigos.instrumentor.resources.requests.memory | string | `"64Mi"` |  |
| originxGcAgent.config.apoCollectorPort | string | `"{{ .Values.global.apoProxyPort }}"` |  |
| originxGcAgent.config.apoCollectorUrl | string | `"{{ .Values.global.apoProxyUrl }}"` |  |
| originxGcAgent.image.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| originxGcAgent.image.repository | string | `"{{ .Values.global.image.eeRepository }}/originx-gc-agent"` |  |
| originxGcAgent.image.tag | string | `"v1.4.1"` |  |
| originxGcAgent.resources.limits.cpu | string | `"1000m"` |  |
| originxGcAgent.resources.limits.memory | string | `"1024Mi"` |  |
| originxGcAgent.resources.requests.cpu | string | `"10m"` |  |
| originxGcAgent.resources.requests.memory | string | `"64Mi"` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| serviceAccount.additionalLabels | object | `{}` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the created service account. |
| serviceAccount.name | string | `nil` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
