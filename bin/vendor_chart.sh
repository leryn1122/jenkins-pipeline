#!/usr/bin/env bash

helm template --debug devops ./chart -n devops | tee .preview-charts.yaml