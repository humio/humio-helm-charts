# Humio Helm Chart

This repo contains the Helm charts for running Humio on Kubernetes. Currently the Humio Core installation is supported,
which includes the [Confluent Helm Chart](https://github.com/confluentinc/cp-helm-charts) as a dependency for running
Kafka and Zookeeper.

The Humio collector Helm chart will be added soon.

## Installing

### Using Helm Repo

Add the repo:
```
helm repo add humio http://127.0.0.1:8879
helm repo update
```

And then install. We recommend installing Humio into its own namespace, in this example we're using the "logging"
namespace:
```
helm install humio/humio-helm-chart --name humio --namespace logging
```

### Using git

First, clone this repo:
```
git clone git@github.com:humio/humio-helm-chart.git
cd humio-helm-chart
```

This helm chart contains nested dependencies. Currently there is no way to build helm chart dependencies recursively
(https://github.com/helm/helm/issues/2247), so until that issue is fixed, run this:
```
pushd charts/humio-core && helm dep up; popd
```

And then install. We recommend installing Humio into its own namespace, in this example we're using the "logging"
namespace:
```
helm install . --name humio --namespace logging
```

## Packaging

The chart must be packaged before it can be served. Run the package helper to do this:
```
./bin/package.sh
```
