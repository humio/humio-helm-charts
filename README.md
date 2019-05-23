# This is a work in progress and requires some manual configuration

This chart requires the Confluent open source charts, this will be a dependency in the future.

https://github.com/confluentinc/cp-helm-charts

If you don't use the default cp-helm hostnames you need to update the statefulset config, in particular the Kafka and Zookeper env variables.
humio-kafka-cp-kafka-X.humio-kafka-cp-kafka-headless:9092
humio-kafka-cp-zookeeper-X.humio-kafka-cp-zookeeper-headless:2181

This repo is limited to current Humio users, don't spread it around quite yet as it needs to be cleaned up A LOT. 

This is currently missing a proper nodeport and ingress setup, I'll push that soon after I fix some minor problems.
