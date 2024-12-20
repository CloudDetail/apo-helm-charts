# apo-backend

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

apo-backend deployment charts

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| apoBackend.image.pullPolicy | string | `"IfNotPresent"` |  |
| apoBackend.image.registry | string | `"registry.cn-hangzhou.aliyuncs.com/kindlingx"` |  |
| apoBackend.image.tag | string | `""` |  |
| apoBackend.resources | object | `{}` |  |
| apoPolarisAnalyzer.image.pullPolicy | string | `"IfNotPresent"` |  |
| apoPolarisAnalyzer.image.repository | string | `"registry.cn-hangzhou.aliyuncs.com/kindlingx/polaris-analyzer"` |  |
| apoPolarisAnalyzer.image.tag | string | `""` |  |
| apoPolarisAnalyzer.resources | object | `{}` |  |
| config.clickhousePassword | string | `"Apo@123456"` |  |
| config.clickhouseUrl | string | `"apo-clickhouse-svc:9000"` |  |
| config.clickhouseUsername | string | `"admin"` |  |
| config.victoriaMetricsUrl | string | `"http://apo-victoria-metrics-single-server-svc:8428"` |  |
| dnsPolicy | string | `"ClusterFirst"` |  |
| hostNetwork | string | `"false"` |  |
| initImage.pullPolicy | string | `"IfNotPresent"` |  |
| initImage.repository | string | `"registry.cn-hangzhou.aliyuncs.com/kindlingx/busybox"` |  |
| initImage.tag | string | `"1.36.1"` |  |
| nameOverride | string | `""` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `false` |  |
| persistence.size | string | `"1Gi"` |  |
| persistence.storageClass | string | `""` |  |
| replicas | string | `"1"` |  |
| service.nodePort | int | `31363` |  |
| service.type | string | `"NodePort"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
