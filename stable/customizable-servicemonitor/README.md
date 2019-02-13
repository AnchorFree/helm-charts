# customizable servicemonitor 

## Introduction

This chart is for the case if you need some specific service monitor for service that do not scraped by prometheus-operator

## Configuration

The following table lists the configurable parameters

|          Parameter          |                      Description                       |          Default           |
| --------------------------- | ------------------------------------------------------ | -------------------------- |
| `scrapeInterval`            | Scrape interval                                        | `60s`                      | 
| `scrapeTimeout`             | Scrape timeout                                         | `59s`                      |
| `namespace`                 | Namespace to which install service monitor resource    | `monitoring`               |
| `jobLabel`                  | From what label prometheus set job name                | `app`                      |
| `portName`                  | Port name of the service from wher to get metrics      | `metrics`                  |
| `scheme`                    | Scheme of request                                      | `http`                     |
| `honorLabels`               | Honor label parameter for prometheus                   | `false`                    |
| `path`                      | Path from where to request metrics                     | `/metrics`                 |
| `selector.matchLabels`      | map with key value properties to filter needed service | `{}`                       |
| `selector.namespace`        | namespace where needed service is located              | `http`                     |
