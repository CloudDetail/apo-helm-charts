# altinity-clickhouse-operator

![Version: 0.23.7](https://img.shields.io/badge/Version-0.23.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.23.7](https://img.shields.io/badge/AppVersion-0.23.7-informational?style=flat-square)

Helm chart to deploy [altinity-clickhouse-operator](https://github.com/Altinity/clickhouse-operator).  The ClickHouse Operator creates, configures and manages ClickHouse clusters running on Kubernetes.  For upgrade please install CRDs separately: ```bash   kubectl apply -f https://github.com/Altinity/clickhouse-operator/raw/master/deploy/helm/clickhouse-operator/crds/CustomResourceDefinition-clickhouseinstallations.clickhouse.altinity.com.yaml   kubectl apply -f https://github.com/Altinity/clickhouse-operator/raw/master/deploy/helm/clickhouse-operator/crds/CustomResourceDefinition-clickhouseinstallationtemplates.clickhouse.altinity.com.yaml   kubectl apply -f https://github.com/Altinity/clickhouse-operator/raw/master/deploy/helm/clickhouse-operator/crds/CustomResourceDefinition-clickhouseoperatorconfigurations.clickhouse.altinity.com.yaml ```

**Homepage:** <https://github.com/Altinity/clickhouse-operator>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| altinity | <support@altinity.com> |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalResources | list | `[]` | list of additional resources to create (are processed via `tpl` function), useful for create ClickHouse clusters together with clickhouse-operator, look `kubectl explain chi` for details |
| affinity | object | `{}` | affinity for scheduler pod assignment, look `kubectl explain pod.spec.affinity` for details |
| clickhouse.affinity | object | `{}` |  |
| clickhouse.image.pullPolicy | string | `"IfNotPresent"` |  |
| clickhouse.image.repository | string | `"registry.cn-hangzhou.aliyuncs.com/originx/clickhouse-server"` |  |
| clickhouse.nodeSelector | object | `{}` |  |
| clickhouse.password | string | `"Apo@123456"` |  |
| clickhouse.persistence.data.accessModes | list | `["ReadWriteOnce"]` | Array of access modes. Must match those of existing PV or dynamic provisioner. Ref: [http://kubernetes.io/docs/user-guide/persistent-volumes/](http://kubernetes.io/docs/user-guide/persistent-volumes/) |
| clickhouse.persistence.data.matchLabels | object | `{}` | Bind Persistent Volume by labels. Must match all labels of targeted PV. |
| clickhouse.persistence.data.size | string | `"16Gi"` | Size of the volume. Should be calculated based on the metrics you send and retention policy you set. |
| clickhouse.persistence.data.storageClass | string | `""` | StorageClass to use for persistent volume. Requires clickhouse.persistence.enabled: true. If defined, PVC created automatically |
| clickhouse.persistence.enabled | bool | `false` | Create/use Persistent Volume Claim for server component. Empty dir if false |
| clickhouse.persistence.log.accessModes | list | `["ReadWriteOnce"]` | Array of access modes. Must match those of existing PV or dynamic provisioner. Ref: [http://kubernetes.io/docs/user-guide/persistent-volumes/](http://kubernetes.io/docs/user-guide/persistent-volumes/) |
| clickhouse.persistence.log.matchLabels | object | `{}` | Bind Persistent Volume by labels. Must match all labels of targeted PV. |
| clickhouse.persistence.log.size | string | `"1Gi"` | Size of the volume. Should be calculated based on the metrics you send and retention policy you set. |
| clickhouse.persistence.log.storageClass | string | `""` | StorageClass to use for persistent volume. Requires clickhouse.persistence.enabled: true. If defined, PVC created automatically |
| clickhouse.service.ports[0].name | string | `"http"` |  |
| clickhouse.service.ports[0].port | int | `8123` |  |
| clickhouse.service.ports[0].protocol | string | `"TCP"` |  |
| clickhouse.service.ports[0].targetPort | int | `8123` |  |
| clickhouse.service.ports[1].name | string | `"tcp"` |  |
| clickhouse.service.ports[1].port | int | `9000` |  |
| clickhouse.service.ports[1].protocol | string | `"TCP"` |  |
| clickhouse.service.ports[1].targetPort | int | `9000` |  |
| clickhouse.service.ports[2].name | string | `"interserver"` |  |
| clickhouse.service.ports[2].port | int | `9009` |  |
| clickhouse.service.ports[2].protocol | string | `"TCP"` |  |
| clickhouse.service.ports[2].targetPort | int | `9009` |  |
| clickhouse.service.type | string | `"ClusterIP"` |  |
| clickhouse.tolerations | list | `[]` |  |
| clickhouse.username | string | `"admin"` |  |
| configs | object | check the values.yaml file for the config content, auto-generated from latest operator release | clickhouse-operator configs |
| dashboards.additionalLabels | object | `{"grafana_dashboard":""}` | labels to add to a secret with dashboards |
| dashboards.annotations | object | `{}` | annotations to add to a secret with dashboards |
| dashboards.enabled | bool | `false` | provision grafana dashboards as secrets (can be synced by grafana dashboards sidecar https://github.com/grafana/helm-charts/blob/grafana-6.33.1/charts/grafana/values.yaml#L679 ) |
| dashboards.grafana_folder | string | `"clickhouse"` |  |
| fullnameOverride | string | `""` | full name of the chart. |
| imagePullSecrets | list | `[]` | image pull secret for private images in clickhouse-operator pod  possible value format [{"name":"your-secret-name"}]  look `kubectl explain pod.spec.imagePullSecrets` for details |
| metrics.containerSecurityContext | object | `{}` |  |
| metrics.enabled | bool | `true` |  |
| metrics.env | list | `[]` | additional environment variables for the deployment of metrics-exporter containers possible format value [{"name": "SAMPLE", "value": "text"}] |
| metrics.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| metrics.image.repository | string | `"registry.cn-hangzhou.aliyuncs.com/originx/metrics-exporter"` | image repository |
| metrics.image.tag | string | `""` | image tag (chart's appVersion value will be used if not set) |
| metrics.resources | object | `{}` | custom resource configuration |
| nameOverride | string | `""` | override name of the chart |
| nodeSelector | object | `{}` | node for scheduler pod assignment, look `kubectl explain pod.spec.nodeSelector` for details |
| operator.containerSecurityContext | object | `{}` |  |
| operator.env | list | `[]` | additional environment variables for the clickhouse-operator container in deployment possible format value [{"name": "SAMPLE", "value": "text"}] |
| operator.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| operator.image.repository | string | `"registry.cn-hangzhou.aliyuncs.com/originx/clickhouse-operator"` | image repository |
| operator.image.tag | string | `""` | image tag (chart's appVersion value will be used if not set) |
| operator.resources | object | `{}` | custom resource configuration, look `kubectl explain pod.spec.containers.resources` for details |
| podAnnotations | object | `{"clickhouse-operator-metrics/port":"9999","clickhouse-operator-metrics/scrape":"true","prometheus.io/port":"8888","prometheus.io/scrape":"true"}` | annotations to add to the clickhouse-operator pod, look `kubectl explain pod.spec.annotations` for details |
| podLabels | object | `{}` | labels to add to the clickhouse-operator pod |
| podSecurityContext | object | `{}` |  |
| rbac.create | bool | `true` | specifies whether cluster roles and cluster role bindings should be created |
| secret.create | bool | `true` | create a secret with operator credentials |
| secret.password | string | `"clickhouse_operator_password"` | operator credentials password |
| secret.username | string | `"clickhouse_operator"` | operator credentials username |
| serviceAccount.annotations | object | `{}` | annotations to add to the service account |
| serviceAccount.create | bool | `true` | specifies whether a service account should be created |
| serviceAccount.name | string | `nil` | the name of the service account to use; if not set and create is true, a name is generated using the fullname template |
| serviceMonitor.additionalLabels | object | `{}` | additional labels for service monitor |
| serviceMonitor.enabled | bool | `false` | ServiceMonitor Custom resource is created for a (prometheus-operator)[https://github.com/prometheus-operator/prometheus-operator] |
| tolerations | list | `[]` | tolerations for scheduler pod assignment, look `kubectl explain pod.spec.tolerations` for details |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
