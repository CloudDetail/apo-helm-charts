# apo-front

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

apo-front deployment charts

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| config.apoBackendUrl | string | `"http://apo-backend-svc:8080"` |  |
| config.apoGrafanaUrl | string | `"http://apo-grafana-svc:80"` |  |
| config.apoJaegerCollectorUrl | string | `"http://apo-jaeger-collector-svc:16686"` |  |
| dnsPolicy | string | `"ClusterFirst"` |  |
| hostNetwork | string | `"false"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"registry.cn-hangzhou.aliyuncs.com/originx/apo-front"` |  |
| image.tag | string | `""` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| replicas | string | `"1"` |  |
| resources | object | `{}` |  |
| service.nodePort | int | `31364` |  |
| service.type | string | `"NodePort"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
