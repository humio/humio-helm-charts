> **Warning**
> This repo has been **deprecated**. It is no longer maintained, and is not compatible with any supported versions of Humio / LogScale.
> [Humio Operator](https://github.com/humio/humio-operator) is the current Kubernetes operator.

# Humio Helm Charts

This repo contains the Helm charts for running Fluentbit and Metricbeat on Kubernetes for use as a client to Humio.

It is also possible to run the Humio server with this chart, however, this is now deprecated in favor of
the [Humio Operator](https://github.com/humio/humio-operator).

## Installing

See the [Kubernetes Integration](https://library.humio.com/integrations/ingest-logs-from-a-specific-system/kubernetes/)
docs which walk through how to install and use this chart to run fluentbit.

## Packaging

The chart must be packaged before it can be served. Run the package helper to do this:
```
./bin/package.sh
```
