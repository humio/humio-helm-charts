> **Warning**
> This repo has been **deprecated**. It is no longer maintained, and is not compatible with any supported versions of Humio / LogScale.
> [Humio Operator](https://github.com/humio/humio-operator) is the current Kubernetes operator.

# Humio Helm Charts

This repo contains the Helm charts for running Fluentbit and Metricbeat on Kubernetes for use as a client to Humio.

It is also possible to run the Humio server with this chart, however, this is now deprecated in favor of
the [Humio Operator](https://github.com/humio/humio-operator).

## Important: Kube-State-Metrics Dependency

**As of recent updates, the `humio-metrics` subchart no longer includes `kube-state-metrics` as a hardcoded dependency.** 

### What this means:
- **For Terraform users**: You must install  `kube-state-metrics` separately before installing this chart
- **For direct Helm users**: You must install `kube-state-metrics` separately before installing this chart

### Installing kube-state-metrics separately (via Helm):
```bash
# Add the prometheus-community repository
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Install kube-state-metrics
helm install [RELEASE_NAME] oci://ghcr.io/prometheus-community/charts/kube-state-metrics [flags]
```

### Impact without kube-state-metrics:
If `kube-state-metrics` is not installed, the `humio-metrics` subchart will still function but with limited capabilities:
- ✅ **System metrics** (CPU, memory, disk, network) will be collected via the daemonset
- ✅ **Container metrics** (containerd, pod, container, volume) will be collected via the daemonset  
- ❌ **Kubernetes state metrics** (deployments, replicasets, statefulsets, pod states, events) will **not** be collected

The metricbeat deployment will show connection errors when trying to reach kube-state-metrics at the configured location.

### Configuring kube-state-metrics location:
If your `kube-state-metrics` is deployed in a different namespace or with a different service name, configure it via values:

```yaml
# values.yaml
kubeStateMetrics:
  serviceName: "kube-state-metrics"  # Service name (default: "kube-state-metrics")
  namespace: "monitoring"            # Namespace (default: same as humio-metrics)
  port: 8080                         # Port (default: 8080)
```

**Examples:**
```bash
# kube-state-metrics in 'monitoring' namespace
helm install humio humio/humio-helm-charts --set kubeStateMetrics.namespace=monitoring

# Custom service name in 'kube-system' namespace  
helm install humio humio/humio-helm-charts \
  --set kubeStateMetrics.serviceName=my-ksm \
  --set kubeStateMetrics.namespace=kube-system
```

## Installing

See the [Kubernetes Integration](https://library.humio.com/integrations/ingest-logs-from-a-specific-system/kubernetes/)
docs which walk through how to install and use this chart to run fluentbit.

## Packaging

The chart must be packaged before it can be served. Run the package helper to do this:
```
./bin/package.sh
```
