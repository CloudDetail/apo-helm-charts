# grafana

![Version: 7.3.11](https://img.shields.io/badge/Version-7.3.11-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 10.4.1](https://img.shields.io/badge/AppVersion-10.4.1-informational?style=flat-square)

The leading tool for querying and visualizing time series and metrics.

**Homepage:** <https://grafana.com>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| zanhsieh | <zanhsieh@gmail.com> |  |
| rtluckie | <rluckie@cisco.com> |  |
| maorfr | <maor.friedman@redhat.com> |  |
| Xtigyro | <miroslav.hadzhiev@gmail.com> |  |
| torstenwalter | <mail@torstenwalter.de> |  |

## Source Code

* <https://github.com/grafana/grafana>
* <https://github.com/grafana/helm-charts>

## Requirements

Kubernetes: `^1.8.0-0`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| "grafana.ini"."auth.anonymous".enabled | bool | `true` |  |
| "grafana.ini"."auth.anonymous".hide_version | bool | `true` |  |
| "grafana.ini"."auth.anonymous".org_name | string | `"Main Org."` |  |
| "grafana.ini"."auth.anonymous".org_role | string | `"Admin"` |  |
| "grafana.ini".analytics.check_for_updates | bool | `false` |  |
| "grafana.ini".analytics.reporting_enabled | bool | `false` |  |
| "grafana.ini".app_mode | string | `"production"` |  |
| "grafana.ini".auth.disable_login_form | bool | `false` |  |
| "grafana.ini".auth.disable_signout_menu | bool | `false` |  |
| "grafana.ini".database.type | string | `"sqlite3"` |  |
| "grafana.ini".grafana_net.url | string | `"https://grafana.net"` |  |
| "grafana.ini".log.mode | string | `"console"` |  |
| "grafana.ini".news.news_feed_enabled | bool | `false` |  |
| "grafana.ini".paths.data | string | `"/var/lib/grafana/"` |  |
| "grafana.ini".paths.logs | string | `"/var/log/grafana"` |  |
| "grafana.ini".paths.plugins | string | `"/var/lib/grafana/plugins"` |  |
| "grafana.ini".paths.provisioning | string | `"/etc/grafana/provisioning"` |  |
| "grafana.ini".profile.enabled | bool | `false` |  |
| "grafana.ini".quota.enabled | bool | `false` |  |
| "grafana.ini".security.allow_embedding | bool | `true` |  |
| "grafana.ini".security.disable_gravatar | bool | `true` |  |
| "grafana.ini".security.disable_initial_admin_creation | bool | `false` |  |
| "grafana.ini".server.;http_port | int | `3000` |  |
| "grafana.ini".server.domain | string | `""` |  |
| "grafana.ini".server.enable_gzip | bool | `true` |  |
| "grafana.ini".server.enforce_domain | bool | `false` |  |
| "grafana.ini".server.protocol | string | `"http"` |  |
| "grafana.ini".server.root_url | string | `"%(protocol)s://%(domain)s/grafana/"` |  |
| "grafana.ini".server.serve_from_sub_path | bool | `true` |  |
| "grafana.ini".snapshots.external_enabled | bool | `false` |  |
| "grafana.ini".users.allow_org_create | bool | `true` |  |
| "grafana.ini".users.allow_sign_up | bool | `true` |  |
| "grafana.ini".users.auto_assign_org_role | string | `"Admin"` |  |
| "grafana.ini".users.default_language | string | `"zh-Hans"` |  |
| "grafana.ini".users.home_page | string | `"/grafana/"` |  |
| admin.existingSecret | string | `""` |  |
| admin.passwordKey | string | `"admin-password"` |  |
| admin.userKey | string | `"admin-user"` |  |
| adminPassword | string | `"admin"` |  |
| adminUser | string | `"admin"` |  |
| affinity | object | `{}` |  |
| alerting | object | `{}` |  |
| assertNoLeakedSecrets | bool | `true` |  |
| automountServiceAccountToken | bool | `true` |  |
| autoscaling.behavior | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `5` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPU | string | `"60"` |  |
| autoscaling.targetMemory | string | `""` |  |
| containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| createConfigmap | bool | `true` |  |
| dashboardProviders."dashboardproviders.yaml".apiVersion | int | `1` |  |
| dashboardProviders."dashboardproviders.yaml".providers[0].disableDeletion | bool | `false` |  |
| dashboardProviders."dashboardproviders.yaml".providers[0].editable | bool | `true` |  |
| dashboardProviders."dashboardproviders.yaml".providers[0].folder | string | `""` |  |
| dashboardProviders."dashboardproviders.yaml".providers[0].name | string | `"default"` |  |
| dashboardProviders."dashboardproviders.yaml".providers[0].options.path | string | `"/tmp/dashboards/default"` |  |
| dashboardProviders."dashboardproviders.yaml".providers[0].orgId | int | `1` |  |
| dashboardProviders."dashboardproviders.yaml".providers[0].type | string | `"file"` |  |
| dashboardProviders."dashboardproviders.yaml".providers[1].disableDeletion | bool | `false` |  |
| dashboardProviders."dashboardproviders.yaml".providers[1].editable | bool | `true` |  |
| dashboardProviders."dashboardproviders.yaml".providers[1].folder | string | `"中间件"` |  |
| dashboardProviders."dashboardproviders.yaml".providers[1].folderUid | string | `"edwu5b9rkv94wb"` |  |
| dashboardProviders."dashboardproviders.yaml".providers[1].name | string | `"middleware-dashboard"` |  |
| dashboardProviders."dashboardproviders.yaml".providers[1].options.path | string | `"/tmp/dashboards/middleware-dashboard"` |  |
| dashboardProviders."dashboardproviders.yaml".providers[1].orgId | int | `1` |  |
| dashboardProviders."dashboardproviders.yaml".providers[1].type | string | `"file"` |  |
| dashboards | list | `[]` |  |
| dashboardsConfigMaps | object | `{}` |  |
| datasources | object | `{}` |  |
| deploymentStrategy.type | string | `"RollingUpdate"` |  |
| dnsConfig | object | `{}` |  |
| dnsPolicy | string | `nil` |  |
| downloadDashboards.env | object | `{}` |  |
| downloadDashboards.envFromSecret | string | `""` |  |
| downloadDashboards.envValueFrom | object | `{}` |  |
| downloadDashboards.resources | object | `{}` |  |
| downloadDashboards.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| downloadDashboards.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| downloadDashboards.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| downloadDashboardsImage.pullPolicy | string | `"IfNotPresent"` |  |
| downloadDashboardsImage.registry | string | `"registry.cn-hangzhou.aliyuncs.com/kindlingx"` | The Docker registry |
| downloadDashboardsImage.repository | string | `"curlimagescurl"` |  |
| downloadDashboardsImage.sha | string | `""` |  |
| downloadDashboardsImage.tag | string | `"7.85.0"` |  |
| enableKubeBackwardCompatibility | bool | `false` |  |
| enableServiceLinks | bool | `true` |  |
| env | object | `{}` |  |
| envFromConfigMaps | list | `[]` |  |
| envFromSecret | string | `""` |  |
| envFromSecrets | list | `[]` |  |
| envRenderSecret | object | `{}` |  |
| envValueFrom | object | `{}` |  |
| extraConfigmapMounts | list | `[]` |  |
| extraContainerVolumes | list | `[]` |  |
| extraContainers | string | `""` |  |
| extraEmptyDirMounts[0].mountPath | string | `"/tmp/dashboards"` |  |
| extraEmptyDirMounts[0].name | string | `"apo-dashboards"` |  |
| extraExposePorts | list | `[]` |  |
| extraInitContainers[0].image | string | `"registry.cn-hangzhou.aliyuncs.com/kindlingx/apo-grafana-init-dashboards:v0.4.0"` |  |
| extraInitContainers[0].imagePullPolicy | string | `"Always"` |  |
| extraInitContainers[0].name | string | `"apo-grafana-init-dashboard"` |  |
| extraInitContainers[0].volumeMounts[0].mountPath | string | `"/tmp/dashboards"` |  |
| extraInitContainers[0].volumeMounts[0].name | string | `"apo-dashboards"` |  |
| extraLabels | object | `{}` |  |
| extraObjects | list | `[]` |  |
| extraSecretMounts | list | `[]` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.imageRegistry | string | `nil` | Overrides the Docker registry globally for all images |
| gossipPortName | string | `"gossip"` |  |
| headlessService | bool | `false` |  |
| hostAliases | list | `[]` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.pullSecrets | list | `[]` |  |
| image.registry | string | `"registry.cn-hangzhou.aliyuncs.com/kindlingx"` | The Docker registry |
| image.repository | string | `"grafana"` | Docker image repository |
| image.sha | string | `""` |  |
| image.tag | string | `""` |  |
| imageRenderer.affinity | object | `{}` |  |
| imageRenderer.autoscaling.behavior | object | `{}` |  |
| imageRenderer.autoscaling.enabled | bool | `false` |  |
| imageRenderer.autoscaling.maxReplicas | int | `5` |  |
| imageRenderer.autoscaling.minReplicas | int | `1` |  |
| imageRenderer.autoscaling.targetCPU | string | `"60"` |  |
| imageRenderer.autoscaling.targetMemory | string | `""` |  |
| imageRenderer.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| imageRenderer.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| imageRenderer.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| imageRenderer.containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| imageRenderer.deploymentStrategy | object | `{}` |  |
| imageRenderer.enabled | bool | `false` |  |
| imageRenderer.env.HTTP_HOST | string | `"0.0.0.0"` |  |
| imageRenderer.envValueFrom | object | `{}` |  |
| imageRenderer.grafanaProtocol | string | `"http"` |  |
| imageRenderer.grafanaSubPath | string | `""` |  |
| imageRenderer.hostAliases | list | `[]` |  |
| imageRenderer.image.pullPolicy | string | `"Always"` |  |
| imageRenderer.image.registry | string | `"docker.io"` | The Docker registry |
| imageRenderer.image.repository | string | `"grafana/grafana-image-renderer"` |  |
| imageRenderer.image.sha | string | `""` |  |
| imageRenderer.image.tag | string | `"latest"` |  |
| imageRenderer.networkPolicy.extraIngressSelectors | list | `[]` |  |
| imageRenderer.networkPolicy.limitEgress | bool | `false` |  |
| imageRenderer.networkPolicy.limitIngress | bool | `true` |  |
| imageRenderer.nodeSelector | object | `{}` |  |
| imageRenderer.podAnnotations | object | `{}` |  |
| imageRenderer.podPortName | string | `"http"` |  |
| imageRenderer.priorityClassName | string | `""` |  |
| imageRenderer.replicas | int | `1` |  |
| imageRenderer.resources | object | `{}` |  |
| imageRenderer.revisionHistoryLimit | int | `10` |  |
| imageRenderer.securityContext | object | `{}` |  |
| imageRenderer.service.appProtocol | string | `""` |  |
| imageRenderer.service.enabled | bool | `true` |  |
| imageRenderer.service.port | int | `8081` |  |
| imageRenderer.service.portName | string | `"http"` |  |
| imageRenderer.service.targetPort | int | `8081` |  |
| imageRenderer.serviceAccountName | string | `""` |  |
| imageRenderer.serviceMonitor.enabled | bool | `false` |  |
| imageRenderer.serviceMonitor.interval | string | `"1m"` |  |
| imageRenderer.serviceMonitor.labels | object | `{}` |  |
| imageRenderer.serviceMonitor.path | string | `"/metrics"` |  |
| imageRenderer.serviceMonitor.relabelings | list | `[]` |  |
| imageRenderer.serviceMonitor.scheme | string | `"http"` |  |
| imageRenderer.serviceMonitor.scrapeTimeout | string | `"30s"` |  |
| imageRenderer.serviceMonitor.targetLabels | list | `[]` |  |
| imageRenderer.serviceMonitor.tlsConfig | object | `{}` |  |
| imageRenderer.tolerations | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.extraPaths | list | `[]` |  |
| ingress.hosts[0] | string | `"chart-example.local"` |  |
| ingress.labels | object | `{}` |  |
| ingress.path | string | `"/"` |  |
| ingress.pathType | string | `"Prefix"` |  |
| ingress.tls | list | `[]` |  |
| initChownData.enabled | bool | `true` |  |
| initChownData.image.pullPolicy | string | `"IfNotPresent"` |  |
| initChownData.image.registry | string | `"docker.io"` | The Docker registry |
| initChownData.image.repository | string | `"library/busybox"` |  |
| initChownData.image.sha | string | `""` |  |
| initChownData.image.tag | string | `"1.31.1"` |  |
| initChownData.resources | object | `{}` |  |
| initChownData.securityContext.capabilities.add[0] | string | `"CHOWN"` |  |
| initChownData.securityContext.runAsNonRoot | bool | `false` |  |
| initChownData.securityContext.runAsUser | int | `0` |  |
| initChownData.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| initImage.pullPolicy | string | `"{{ .Values.global.image.pullPolicy }}"` |  |
| initImage.repository | string | `"{{ .Values.global.image.repository }}/busybox"` |  |
| initImage.tag | string | `"1.36.1"` |  |
| ldap.config | string | `""` |  |
| ldap.enabled | bool | `false` |  |
| ldap.existingSecret | string | `""` |  |
| lifecycleHooks | object | `{}` |  |
| livenessProbe.failureThreshold | int | `10` |  |
| livenessProbe.httpGet.path | string | `"/api/health"` |  |
| livenessProbe.httpGet.port | int | `3000` |  |
| livenessProbe.initialDelaySeconds | int | `60` |  |
| livenessProbe.timeoutSeconds | int | `30` |  |
| namespaceOverride | string | `""` |  |
| networkPolicy.allowExternal | bool | `true` |  |
| networkPolicy.egress.blockDNSResolution | bool | `false` |  |
| networkPolicy.egress.enabled | bool | `false` |  |
| networkPolicy.egress.ports | list | `[]` |  |
| networkPolicy.egress.to | list | `[]` |  |
| networkPolicy.enabled | bool | `false` |  |
| networkPolicy.explicitNamespacesSelector | object | `{}` |  |
| networkPolicy.ingress | bool | `true` |  |
| nodeSelector | object | `{}` |  |
| notifiers | object | `{}` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `false` |  |
| persistence.extraPvcLabels | object | `{}` |  |
| persistence.finalizers[0] | string | `"kubernetes.io/pvc-protection"` |  |
| persistence.inMemory.enabled | bool | `false` |  |
| persistence.size | string | `"10Gi"` |  |
| persistence.type | string | `"pvc"` |  |
| plugins | list | `[]` |  |
| podDisruptionBudget | object | `{}` |  |
| podPortName | string | `"grafana"` |  |
| rbac.create | bool | `true` |  |
| rbac.extraClusterRoleRules | list | `[]` |  |
| rbac.extraRoleRules | list | `[]` |  |
| rbac.namespaced | bool | `false` |  |
| rbac.pspEnabled | bool | `false` |  |
| rbac.pspUseAppArmor | bool | `false` |  |
| readinessProbe.httpGet.path | string | `"/api/health"` |  |
| readinessProbe.httpGet.port | int | `3000` |  |
| replicas | int | `1` |  |
| resources | object | `{}` |  |
| revisionHistoryLimit | int | `10` |  |
| securityContext.fsGroup | int | `472` |  |
| securityContext.runAsGroup | int | `472` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `472` |  |
| service.annotations | object | `{}` |  |
| service.appProtocol | string | `""` |  |
| service.enabled | bool | `true` |  |
| service.labels | object | `{}` |  |
| service.loadBalancerClass | string | `""` |  |
| service.loadBalancerIP | string | `""` |  |
| service.loadBalancerSourceRanges | list | `[]` |  |
| service.port | int | `80` |  |
| service.portName | string | `"service"` |  |
| service.targetPort | int | `3000` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.automountServiceAccountToken | bool | `false` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.labels | object | `{}` |  |
| serviceAccount.name | string | `nil` |  |
| serviceAccount.nameTest | string | `nil` |  |
| serviceMonitor.enabled | bool | `false` |  |
| serviceMonitor.interval | string | `"30s"` |  |
| serviceMonitor.labels | object | `{}` |  |
| serviceMonitor.metricRelabelings | list | `[]` |  |
| serviceMonitor.path | string | `"/metrics"` |  |
| serviceMonitor.relabelings | list | `[]` |  |
| serviceMonitor.scheme | string | `"http"` |  |
| serviceMonitor.scrapeTimeout | string | `"30s"` |  |
| serviceMonitor.targetLabels | list | `[]` |  |
| serviceMonitor.tlsConfig | object | `{}` |  |
| sidecar.alerts.enabled | bool | `false` |  |
| sidecar.alerts.env | object | `{}` |  |
| sidecar.alerts.extraMounts | list | `[]` |  |
| sidecar.alerts.initAlerts | bool | `false` |  |
| sidecar.alerts.label | string | `"grafana_alert"` |  |
| sidecar.alerts.labelValue | string | `""` |  |
| sidecar.alerts.reloadURL | string | `"http://localhost:3000/api/admin/provisioning/alerting/reload"` |  |
| sidecar.alerts.resource | string | `"both"` |  |
| sidecar.alerts.script | string | `nil` |  |
| sidecar.alerts.searchNamespace | string | `nil` |  |
| sidecar.alerts.sizeLimit | object | `{}` |  |
| sidecar.alerts.skipReload | bool | `false` |  |
| sidecar.alerts.watchMethod | string | `"WATCH"` |  |
| sidecar.dashboards.SCProvider | bool | `true` |  |
| sidecar.dashboards.defaultFolderName | string | `nil` |  |
| sidecar.dashboards.enabled | bool | `false` |  |
| sidecar.dashboards.env | object | `{}` |  |
| sidecar.dashboards.extraMounts | list | `[]` |  |
| sidecar.dashboards.folder | string | `"/tmp/dashboards"` |  |
| sidecar.dashboards.folderAnnotation | string | `nil` |  |
| sidecar.dashboards.label | string | `"grafana_dashboard"` |  |
| sidecar.dashboards.labelValue | string | `""` |  |
| sidecar.dashboards.provider.allowUiUpdates | bool | `false` |  |
| sidecar.dashboards.provider.disableDelete | bool | `false` |  |
| sidecar.dashboards.provider.folder | string | `""` |  |
| sidecar.dashboards.provider.foldersFromFilesStructure | bool | `false` |  |
| sidecar.dashboards.provider.name | string | `"sidecarProvider"` |  |
| sidecar.dashboards.provider.orgid | int | `1` |  |
| sidecar.dashboards.provider.type | string | `"file"` |  |
| sidecar.dashboards.reloadURL | string | `"http://localhost:3000/api/admin/provisioning/dashboards/reload"` |  |
| sidecar.dashboards.resource | string | `"both"` |  |
| sidecar.dashboards.script | string | `nil` |  |
| sidecar.dashboards.searchNamespace | string | `nil` |  |
| sidecar.dashboards.sizeLimit | object | `{}` |  |
| sidecar.dashboards.skipReload | bool | `false` |  |
| sidecar.dashboards.watchMethod | string | `"WATCH"` |  |
| sidecar.datasources.enabled | bool | `false` |  |
| sidecar.datasources.env | object | `{}` |  |
| sidecar.datasources.envValueFrom | object | `{}` |  |
| sidecar.datasources.initDatasources | bool | `false` |  |
| sidecar.datasources.label | string | `"grafana_datasource"` |  |
| sidecar.datasources.labelValue | string | `""` |  |
| sidecar.datasources.reloadURL | string | `"http://localhost:3000/api/admin/provisioning/datasources/reload"` |  |
| sidecar.datasources.resource | string | `"both"` |  |
| sidecar.datasources.script | string | `nil` |  |
| sidecar.datasources.searchNamespace | string | `nil` |  |
| sidecar.datasources.sizeLimit | object | `{}` |  |
| sidecar.datasources.skipReload | bool | `false` |  |
| sidecar.datasources.watchMethod | string | `"WATCH"` |  |
| sidecar.enableUniqueFilenames | bool | `false` |  |
| sidecar.image.registry | string | `"quay.io"` | The Docker registry |
| sidecar.image.repository | string | `"kiwigrid/k8s-sidecar"` |  |
| sidecar.image.sha | string | `""` |  |
| sidecar.image.tag | string | `"1.26.1"` |  |
| sidecar.imagePullPolicy | string | `"IfNotPresent"` |  |
| sidecar.livenessProbe | object | `{}` |  |
| sidecar.notifiers.enabled | bool | `false` |  |
| sidecar.notifiers.env | object | `{}` |  |
| sidecar.notifiers.initNotifiers | bool | `false` |  |
| sidecar.notifiers.label | string | `"grafana_notifier"` |  |
| sidecar.notifiers.labelValue | string | `""` |  |
| sidecar.notifiers.reloadURL | string | `"http://localhost:3000/api/admin/provisioning/notifications/reload"` |  |
| sidecar.notifiers.resource | string | `"both"` |  |
| sidecar.notifiers.script | string | `nil` |  |
| sidecar.notifiers.searchNamespace | string | `nil` |  |
| sidecar.notifiers.sizeLimit | object | `{}` |  |
| sidecar.notifiers.skipReload | bool | `false` |  |
| sidecar.notifiers.watchMethod | string | `"WATCH"` |  |
| sidecar.plugins.enabled | bool | `false` |  |
| sidecar.plugins.env | object | `{}` |  |
| sidecar.plugins.initPlugins | bool | `false` |  |
| sidecar.plugins.label | string | `"grafana_plugin"` |  |
| sidecar.plugins.labelValue | string | `""` |  |
| sidecar.plugins.reloadURL | string | `"http://localhost:3000/api/admin/provisioning/plugins/reload"` |  |
| sidecar.plugins.resource | string | `"both"` |  |
| sidecar.plugins.script | string | `nil` |  |
| sidecar.plugins.searchNamespace | string | `nil` |  |
| sidecar.plugins.sizeLimit | object | `{}` |  |
| sidecar.plugins.skipReload | bool | `false` |  |
| sidecar.plugins.watchMethod | string | `"WATCH"` |  |
| sidecar.readinessProbe | object | `{}` |  |
| sidecar.resources | object | `{}` |  |
| sidecar.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| sidecar.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| sidecar.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| smtp.existingSecret | string | `""` |  |
| smtp.passwordKey | string | `"password"` |  |
| smtp.userKey | string | `"user"` |  |
| testFramework.enabled | bool | `true` |  |
| testFramework.image.registry | string | `"docker.io"` | The Docker registry |
| testFramework.image.repository | string | `"bats/bats"` |  |
| testFramework.image.tag | string | `"v1.4.1"` |  |
| testFramework.imagePullPolicy | string | `"IfNotPresent"` |  |
| testFramework.resources | object | `{}` |  |
| testFramework.securityContext | object | `{}` |  |
| tolerations | list | `[]` |  |
| topologySpreadConstraints | list | `[]` |  |
| useStatefulSet | bool | `false` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
