## Introduction

This chart bootstraps a [prometheus-ha-proxy](https://github.com/AnchorFree/prometheus-ha-proxy) deployment on a [Kubernetes](http://kubernetes.io)
cluster using the [Helm](https://helm.sh) package manager.


## Installing the Chart

To install the chart with the release name `my-release`:

```console
# cd into this directory
$ helm install . --name my-release
```

The command deploys *prometheus-ha-proxy* on the Kubernetes cluster in the default
configuration. The [configuration](#configuration) section lists the parameters
that can be configured during installation.


## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and
deletes the release.

## Configuration

The following table lists the configurable parameters of the *prometheus-ha-proxy* chart and their default values.

| Parameter                                  | Description                                                            | Default                               |
| ------------------------------------------ | ---------------------------------------------------------------------- | ------------------------------------- |
| `affinity`                                 | node/pod affinities                                                    | `{}`                                  |
| `livenessProbe.enabled`                    | livenessProbe to be enabled?                                           | `true`                                |
| `livenessProbe.initialDelaySeconds`        | number of seconds                                                      | 15                                    |
| `livenessProbe.periodSeconds`              | number of seconds                                                      | 10                                    |
| `livenessProbe.timeoutSeconds`             | number of seconds                                                      | 3                                     |
| `livenessProbe.failureThreshold`           | number of failures                                                     | 3                                     |
| `image.pullPolicy`                         | Image pull policy                                                      | `IfNotPresent`                        |
| `image.repository`                         | Image repository                                                       | `anchorfree/https-okta-proxy`         |
| `image.tag`                                | Image tag                                                              | `v0.5.14.1`                           |
| `imagePullSecrets`                         | Specify image pull secrets                                             | `[]`                                  |
| `extraArgs`                                | Additional prometheus-ha-proxy container arguments                     | `[]`                                  |
| `nodeSelector`                             | node labels for pod assignment                                         | `{}`                                  |
| `replicaCount`                             | desired number of pods                                                 | `1`                                   |
| `resources`                                | pod resource requests & limits                                         | `{}`                                  |
| `service.type`                             | type of service                                                        | `ClusterIP`                           |
| `service.port`                             | Port to expose by ClusterIP service                                    | `9091`                                |
| `tolerations`                              | List of node taints to tolerate                                        | `[]`                                  |
| `readinessProbe.enabled`                   | readinessProbe to be enabled?                                          | `true`                                |
| `readinessProbe.initialDelaySeconds`       | number of seconds                                                      | 15                                    |
| `readinessProbe.periodSeconds`             | number of seconds                                                      | 10                                    |
| `readinessProbe.timeoutSeconds`            | number of seconds                                                      | 3                                     |
| `readinessProbe.successThreshold`          | number of successes                                                    | 1                                     |
| `readinessProbe.failureThreshold`          | number of failures                                                     | 3                                     |

Specify each parameter using the `--set key=value[,key=value]` argument to
`helm install`. For example:

```console
$ helm install . --name my-release \
  --set=image.tag=latest,resources.limits.cpu=200m
```

Alternatively, a YAML file that specifies the values for the above parameters
can be provided while installing the chart. For example:

```console
$ helm install . --name my-release -f values.yaml
```

> **Tip**: You can use the default [values.yaml](values.yaml)
