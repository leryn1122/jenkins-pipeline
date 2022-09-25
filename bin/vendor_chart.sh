#!/usr/bin/env bash

helm template --debug kubeops ./chart -n kubeops | tee .preview-charts.yaml