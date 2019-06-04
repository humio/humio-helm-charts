# Humio Helm Chart

This repo contains the Helm charts for running Humio on Kubernetes. Currently the Humio Core installation is supported,
which includes the [Confluent Helm Chart](https://github.com/confluentinc/cp-helm-charts) as a dependency for running
Kafka and Zookeeper.

The Humio collector Helm chart will be added soon.

## Installing

### Using Helm Repo

Add the repo:
```
helm repo add humio https://humio.github.io/humio-helm-charts
helm repo update
```

And then install. We recommend installing Humio into its own namespace, in this example we're using the "logging"
namespace:
```
helm install humio/humio-helm-charts --name humio --namespace logging
```

## Packaging

The chart must be packaged before it can be served. Run the package helper to do this:
```
./bin/package.sh
```
