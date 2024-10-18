# apo-collector

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

apo-collector deployment charts

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| apoApmAdapter.config.jaegerCollectorUrl | string | `"apo-jaeger-collector-svc:16686"` |  |
| apoApmAdapter.config.pinpointAddress | string | `""` |  |
| apoApmAdapter.config.skywalkingAddress | string | `""` |  |
| apoApmAdapter.image.pullPolicy | string | `"IfNotPresent"` |  |
| apoApmAdapter.image.repository | string | `"registry.cn-hangzhou.aliyuncs.com/originx/apm-adapter"` |  |
| apoApmAdapter.image.tag | string | `""` |  |
| apoApmAdapter.resources | object | `{}` |  |
| apoApmAdapter.service.port | int | `8079` |  |
| apoCollector.config.apmAdapterUrl | string | `"apo-apm-adapter-svc:8080"` |  |
| apoCollector.config.apoBackendUrl | string | `"http://apo-backend-svc:8080"` |  |
| apoCollector.config.clickhousePassword | string | `"Apo@123456"` |  |
| apoCollector.config.clickhouseUrl | string | `"apo-clickhouse-svc:9000"` |  |
| apoCollector.config.clickhouseUsername | string | `"admin"` |  |
| apoCollector.config.victoriaMetricsUrl | string | `"http://apo-victoria-metrics-single-server-svc:8428"` |  |
| apoCollector.image.pullPolicy | string | `"IfNotPresent"` |  |
| apoCollector.image.repository | string | `"registry.cn-hangzhou.aliyuncs.com/originx/apo-collector"` |  |
| apoCollector.image.tag | string | `""` |  |
| apoCollector.resources | object | `{}` |  |
| apoCollector.service.nodePortGrpc | int | `30044` |  |
| apoCollector.service.nodePortHttp | int | `30090` |  |
| apoCollector.service.port | int | `29090` |  |
| apoCollector.service.targetPort | int | `29090` |  |
| apoCollector.service.type | string | `"NodePort"` |  |
| config.apmAdapterUrl | string | `"http://apo-apm-adapter-svc:8079"` |  |
| config.apoBackendUrl | string | `"http://apo-backend-svc:8080"` |  |
| config.clickhousePassword | string | `"Apo@123456"` |  |
| config.clickhouseUrl | string | `"apo-clickhouse-svc:9000"` |  |
| config.clickhouseUsername | string | `"admin"` |  |
| config.victoriaMetricsUrl | string | `"http://apo-victoria-metrics-single-server-svc:8428"` |  |
| fullnameOverride | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| initImage.pullPolicy | string | `"IfNotPresent"` |  |
| initImage.repository | string | `"registry.cn-hangzhou.aliyuncs.com/kindlingx/busybox"` |  |
| initImage.tag | string | `"1.36.1"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| replicaCount | int | `1` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)