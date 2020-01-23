# Changelog

## 0.5.0

# Added

- be7bfc7 Added functionality to scrape humio-core statefulset with prometheus

# Changed

- 185253f Made fluentbit configs customizable
- e2d6202 Added support for 'byproxy' as auth-method

# Removed

- 185253f removed the parameter `humio-fluentbit.defaultInputSettings.memBufferLimit`. Use `humio-fluentbit.inputConfig`
 instead.
