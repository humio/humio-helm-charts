# This is a work in progress and requires some manual configuration

This chart requires the Confluent open source charts, this will be a dependency in the future.

https://github.com/confluentinc/cp-helm-charts

If you don't use the default cp-helm hostnames you need to update the statefulset config, in particular the Kafka and Zookeper env variables.
humio-kafka-cp-kafka-X.humio-kafka-cp-kafka-headless:9092
humio-kafka-cp-zookeeper-X.humio-kafka-cp-zookeeper-headless:2181

All peices are working but currently the setup requires creating local persistant volumes on each Kubernetes nodes. This is a beta feature and isn't fully baked. Local PVs are in beta and it is possible to switch out the volume claim to an EBS one similar to other charts like the Kafka one.

https://serverascode.com/2018/09/19/persistent-local-volumes-kubernetes.html


There is also an ingress controller which was previously needed for the web UI on AWS which may no longer be required.