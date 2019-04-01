# ElasticHQ Helm Chart

Deploys [ElasticHQ](https://github.com/ElasticHQ/elasticsearch-HQ) in Kubernetes.

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release stable/elastichq
```

## Deleting the Charts

Delete the Helm deployment as normal:

```
$ helm delete my-release
```

## Configuration

The following table lists the configurable parameters of the elastichq chart and their default values.

|              Parameter               |                             Description                             |                       Default                       |
| ------------------------------------ | ------------------------------------------------------------------- | --------------------------------------------------- |
| `replicaCount`                       | Number of ElasticHQ instances                                       | `1`                                                 |
| `image.repository`                   | Container image name                                                | `elastichq/elasticsearch-hq`                        |
| `image.tag`                          | Container image tag                                                 | `release-v3.5.0`                                    |
| `image.pullPolicy`                   | Container pull policy                                               | `IfNotPresent`                                      |
| `service.type`                       | Service type                                                        | `ClusterIP`                                         |
| `service.port`                       | Service port                                                        | `5000`                                              |
| `env`                                | Environment variables                                               | `HQ_DEFAULT_URL: http://elasticsearch:9200`         |
| `resources`                          | Pod resources                                                       | `{}`                                                |
| `nodeSelector`                       | Pod node selector                                                   | `{}`                                                |
| `tolerations`                        | Pod tolerations                                                     | `[]`                                                |
| `affinity`                           | Pod affinity                                                        | `{}`                                                |
