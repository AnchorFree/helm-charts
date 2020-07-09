## Introduction

This chart provides [CronJob](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/)
to schedule [elasticsearch index templates](https://www.elastic.co/guide/en/elasticsearch/reference/6.8/indices-templates.html)
execution on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh)
package manager.


## Installing the Chart

To install the chart with the release name `my-release`:

```console
# cd into this directory
$ helm install . --name my-release
```

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
| `image.pullPolicy`                         | Image pull policy                                                      | `IfNotPresent`                        |
| `image.repository`                         | Image repository                                                       | `byrnedo/alpine-curl`                 |
| `image.tag`                                | Image tag                                                              | `0.1.8`                               |
| `imagePullSecrets`                         | Specify image pull secrets                                             | `[]`                                  |
| `extraArgs`                                | Additional prometheus-ha-proxy container arguments                     | `[]`                                  |
| `nodeSelector`                             | node labels for pod assignment                                         | `{}`                                  |
| `resources`                                | pod resource requests & limits                                         | `{}`                                  |
| `schedule`                                 | Job schedule                                                           | `"00 12 * * *"`                       |
| `concurrencyPolicy`                        | Job concurrency policy                                                 | `"Forbid"`                            |
| `backoffLimit`                             | Pod backoff failure policy                                             | `2`                                   |
| `successfulJobsHistoryLimit`               | How many completed jobs should be kept                                 | `3`                                   |
| `failedJobsHistoryLimit`                   | How many failed jobs should be kept                                    | `3`                                   |
| `elasticsearch.host`                       | Elasticsearch host                                                     | `elasticsearch`                       |
| `elasticsearch.port`                       | Elasticsearch port                                                     | `9200`                                |
| `templates`                                | Files with templates to apply                                          | `[]`                                  |
| `tolerations`                              | List of node taints to tolerate                                        | `[]`                                  |

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
