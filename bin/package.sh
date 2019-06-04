#!/bin/sh

set -ex

# Remove any existing indexes
find . -iname index.yaml | grep -v docs | xargs rm

# Move existing releases to the charts directory so they can be re-indexed with proper URLs
find docs/ -name '*.tgz' -maxdepth 1 -exec mv {} ./ \;

helm package .
helm repo index . --url / && mv index.yaml docs/

# Move all the charts to the docs so they can be served by github pages
find . -name '*.tgz' -mindepth 1 -maxdepth 1 -exec mv {} docs/ \;
