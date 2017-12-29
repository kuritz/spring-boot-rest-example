#!/usr/bin/env bash

# Matt's local container
SPLUNK_TOKEN="5af6e0ad-80f1-45ec-8b87-4bb48f36c00b"

docker run \
    -d \
    -e "SPLUNK_START_ARGS=--accept-license" \
    -e "SPLUNK_USER=root" \
    -p "8000:8000" \
    -p "8088:8088" \
  splunk/splunk \
  ;

# Needs to be automated
########################################
# - log in, set admin pass
# - enable http event collector
# - setup event collector for docker
########################################

docker run \
    -d -t \
    -p "8090:8090" \
    -p "8091:8091" \
    --log-driver "splunk" \
    --log-opt "splunk-token=${SPLUNK_TOKEN}" \
    --log-opt "splunk-url=http://localhost:8000" \
  spring-boot-rest-example \
  ;
