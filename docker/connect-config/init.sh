#!/usr/bin/env bash

curl -i -X \
  POST \
  -H "Accept:application/json" \
  -H "Content-Type:application/json" \
  http://connect:8083/connectors/ \
  -d @/source.json

