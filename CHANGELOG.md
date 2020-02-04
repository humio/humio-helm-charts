# Changelog

## 0.7.0

# Fixed

- 3534adf Fix issue with kafka properties mount when using saml

# Changed

- b62e1f0 Stop using LoadBalancer type as default to prevent exposing Humio without TLS unless explicitly configured.

_Note: before updating, you must delete the services `humio-humio-core-http` and `humio-humio-core-es` as the default
type has changed from `LoadBalancer` to type `ClusterIP`. If you have defined `service.type` then you don't need to
change anything._

## 0.6.1

# Fixed

- 6895108 Allow metricbeat to access apps/v1/replicasets

## 0.6.0

# Added

- b399cd5 Allow configuring extra Kafka properties for Humio.

# Changed

- e834ae7 Update nginx example to better loadbalance ingest traffic
- 0c2ca4a Use status endpoint to determine if Humio is healthy

## 0.5.1

# Changed

- 457dce2 Use password field rather than user field for token

## 0.5.0

# Added

- be7bfc7 Added functionality to scrape humio-core statefulset with prometheus

# Changed

- 185253f Made fluentbit configs customizable
- e2d6202 Added support for 'byproxy' as auth-method

# Removed

- 185253f removed the parameter `humio-fluentbit.defaultInputSettings.memBufferLimit`. Use `humio-fluentbit.inputConfig`
 instead.
