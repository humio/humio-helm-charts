#!/bin/sh

set -ex

find . -iname index.yaml | grep -v docs | xargs rm
helm package .
rm docs/*.tgz && mv *.tgz docs/
helm repo index . && mv index.yaml docs/
