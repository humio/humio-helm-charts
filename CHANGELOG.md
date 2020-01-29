# Changelog

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
