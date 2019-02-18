# Cloudwatch exporter

this is a modified fork of https://github.com/helm/charts/tree/master/stable/prometheus-cloudwatch-exporter

* Installs [cloudwatch exporter](http://github.com/prometheus/cloudwatch_exporter)

## TL;DR;

```console
$ helm install stable/prometheus-cloudwatch-exporter
```

## Introduction

This chart bootstraps a [cloudwatch exporter](http://github.com/prometheus/cloudwatch_exporter) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- [kube2iam](../../stable/kube2iam) installed to used the **aws.role** config option otherwise configure **aws.aws_access_key_id** and **aws.aws_secret_access_key** or **aws.secret.name**

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ # pass AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY as values
$ helm install --name my-release stable/prometheus-cloudwatch-exporter --set aws.aws_access_key_id=$AWS_ACCESS_KEY_ID,aws.aws_secret_access_key=$AWS_SECRET_ACCESS_KEY

$ # or store them in a secret and pass its name as a value
$ kubectl create secret generic <SECRET_NAME> --from-literal=access_key=$AWS_ACCESS_KEY_ID --from-literal=secret_key=$AWS_SECRET_ACCESS_KEY
$ helm install --name my-release stable/prometheus-cloudwatch-exporter --set aws.secret.name=<SECRET_NAME>

$ # or add a role to aws with the [correct policy](https://github.com/prometheus/cloudwatch_exporter#credentials-and-permissions) to add to cloud watch and pass its name as a value
$ helm install --name my-release stable/prometheus-cloudwatch-exporter --set awsRole=<ROLL_NAME>
```

The command deploys Cloudwatch exporter on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the Cloudwatch Exporter chart and their default values.

|          Parameter          |                      Description                       |          Default           |
| --------------------------- | ------------------------------------------------------ | -------------------------- |
| `image.repository`          | Image                                                  | `prom/cloudwatch-exporter` |
| `image.tag`                 | Image tag                                              | `cloudwatch_exporter-0.5.0`                   |
| `image.pullPolicy`          | Image pull policy                                      | `IfNotPresent`             |
| `service.type`              | Service type                                           | `ClusterIP`                |
| `service.port`              | The service port                                       | `9106`                     |
| `service.targetPort`        | The service target port                                | `9106`                     |
| `service.portName`          | The name of the service port                           | `http`                     |
| `service.annotations`       | Custom annotations for service                         | `{}`                       |
| `service.labels`            | Additional custom labels for the service               | `{}`                       |
| `resources`                 |                                                        | `{}`                       |
| `aws.role`                  | AWS IAM Role To Use                                    |                            |
| `aws.aws_access_key_id`     | AWS access key id                                      |                            |
| `aws.aws_secret_access_key` | AWS secret access key                                  |                            |
| `aws.secret.name` | The name of a pre-created secret in which AWS credentials are stored                                 |                            |
| `aws.secret.includesSessionToken` |  Whether or not the pre-created secret contains an AWS STS session token                                  |                            |
| `config`                    | Map with Cloudwatch exporter configuration, see values for example             | `see default values.yaml`    |
| `predefinedMetrics`         | Predefined metrics types that can be used in config section described above | `see default values.yaml` |
| `rbac.create`               | If true, create & use RBAC resources                   | `false`                    |
| `serviceAccount.create`     | Specifies whether a service account should be created. | `true`                     |
| `serviceAccount.name`       | Name of the service account.                           |                            |
| `tolerations`               | Add tolerations                                        | `[]`                       |
| `nodeSelector`              | node labels for pod assignment                         | `{}`                       |
| `affinity`                  | node/pod affinities                                    | `{}`                       |
| `livenessProbe`             | Liveness probe settings                                |                            |
| `readinessProbe`            | Readiness probe settings                               |                            |
| `serviceMonitor.enable`     | If enabled chart will create servicemonitor resource   | `false`                    |
| `serviceMonitor.scrapeInterval` | Period of scraping metrics from cloudwatch exporter| `inherit from prometheus`                      |
| `serviceMonitor.scrapeTimeout` | Timeout for scraping metrics from cloudwatch exporter| `inherit from prometheus`                      |
| `serviceMonitor.namespace` | Namespace in which serviceonitor resource will be created | `monitoring`             |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install --name my-release \
    --set aws.role=my-aws-role \
    stable/prometheus-cloudwatch-exporter
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install --name my-release -f values.yaml stable/prometheus-cloudwatch-exporter
```
