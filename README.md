# Humio Helm Charts

This repo contains the Helm charts for running Humio on Kubernetes.

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

### Logging in

If `humio-core.authenticationMethod` is set to `single-user` (default), then you need to supply a username and password
when logging in. The default username is `developer` and the password can be retrieved from the command:
```
kubectl get secret developer-user-password -n logging -o=template --template={{.data.password}} | base64 -D
```
_Note: the base64 command may vary depending on OS and distribution._

## Subcharts

### Humio Core

Humio Core includes the [Confluent Helm Chart](https://github.com/confluentinc/cp-helm-charts) as a dependency for
running Kafka and Zookeeper. It will start Zookeeper, Kafka, and Humio Core pods.

See the file `examples/core-only.yaml`.

### Humio Fluentbit

Fluentbit is the recommended way to collect logs from a Kubernetes cluster. This chart can be installed standalone, but
if it's installed along with the Humio Core chart, it will automatically discover the right endpoint and token.

If running Fluentbit by itself, you'll need to create a Kubernetes secret with the token to access the Humio server,
where `my-namespace` is the namespace where you are installing the chart:

```
kubectl create secret generic fluentbit-shared-token --from-literal=token=my-token -n my-namespace
```

You will also need to configure the endpoint if running in standalone. For example:

```
sed -i 's/HUMIO_HOSTNAME/my-humio-hostname/' examples/fluentbit-only.yaml
```

### Humio Strix

Strix is a performance testing tool for Humio. See https://github.com/humio/strix for more information.

## Packaging

The chart must be packaged before it can be served. Run the package helper to do this:
```
./bin/package.sh
```
