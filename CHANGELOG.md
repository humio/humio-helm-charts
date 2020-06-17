# Changelog

## 0.8.17

- c162b84 Add support for GCP bucket storage credentials

## 0.8.16

- 13d100d cp4mcm and openshift compatability update

## 0.8.15

### Fixed

- 3ed80f6 Increase fluentbit es output Buffer_Size

_Note: It is recommended to upgrade to this version when sending logs to Humio Cloud or using Humio verion 1.11.1 or
greater._

## 0.8.14

- 57100ef feat: Allow specifying service account annotations for Humio

## 0.8.13

- e9d07b0 Use apps/v1 for metricbeat deployment

_Note: before updating, you must delete the deploment `metricbeat` as the API version has changed
to support Kubernetes v1.16+._

## 0.8.12

- 04d3f63 Use apiVersion apps/v1 for DaemonSet's if available

_Note: before updating, you must delete the daemonsets `local-volume-provisioner` and `metricbeat`
as the API version has changed to support Kubernetes v1.16+._

## 0.8.11

- 17d96e0 humio-metrics: Mount configuration with expected gid for metricbeat deployment, instead of using uid 0 for reading it.

## 0.8.10

### Changed

- 1ed7ff7 Update compression level to reflect Humio's defaults

## 0.8.9

- 105cfc3 Reverts Merge_Log change in favor of enable Merge_Log_Key

## 0.8.8

### Changed

- 1a07b55 Remove fluentbit Merge_Log from default configuration

 _Note: the default behavior of fluentbit changes with this version_

## 0.8.7
- 3c401f6 Expose property for setting the fluentbit token secret name

## 0.8.6
- bec775e Bump versions Humio 1.8.9, Fluent bit 1.4.2 & Metricbeat 7.6.2

## 0.8.5
- 2adaca4 Bump kube-state-metrics dependency.

## 0.8.4
- 744954e Allow specifying securityContext for humio-core

## 0.8.3

- 798bf11 Run java process as pid 1

## 0.8.2

- 1f217c9 Fix ingress api version

## 0.8.1

### Fixed

- 1db468c Add grace period to humio pods

## 0.8.0

### Fixed

- ab4ad70 Support newer Kubernetes api versions

## 0.7.2

### Fixed

- a31fd49 Bugfix: mountPath doesn't belong on a volume

## 0.7.1

### Fixed

- a776035 Fix bug where fluentbit will not be able to connect to the es endpoint

### Changed

- 53dff9f Allow metricbeat to reload its configuration at deploy time

## 0.7.0

### Fixed

- 3534adf Fix issue with kafka properties mount when using saml

### Changed

- b62e1f0 Stop using LoadBalancer type as default to prevent exposing Humio without TLS unless explicitly configured.

_Note: before updating, you must delete the services `humio-humio-core-http` and `humio-humio-core-es` as the default
type has changed from `LoadBalancer` to type `ClusterIP`. If you have defined `service.type` then you don't need to
change anything._

## 0.6.1

### Fixed

- 6895108 Allow metricbeat to access apps/v1/replicasets

## 0.6.0

### Added

- b399cd5 Allow configuring extra Kafka properties for Humio.

### Changed

- e834ae7 Update nginx example to better loadbalance ingest traffic
- 0c2ca4a Use status endpoint to determine if Humio is healthy

## 0.5.1

### Changed

- 457dce2 Use password field rather than user field for token

## 0.5.0

### Added

- be7bfc7 Added functionality to scrape humio-core statefulset with prometheus

### Changed

- 185253f Made fluentbit configs customizable
- e2d6202 Added support for 'byproxy' as auth-method

### Removed

- 185253f removed the parameter `humio-fluentbit.defaultInputSettings.memBufferLimit`. Use `humio-fluentbit.inputConfig`
 instead.
