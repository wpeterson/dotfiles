#!/usr/bin/env bash

aws-vault exec rw -- aws autoscaling update-auto-scaling-group \
  --auto-scaling-group-name gitlab-ci-runner-medium \
  --desired-capacity 0 \
  --max-size 0 \
  --min-size 0

aws-vault exec rw -- aws autoscaling update-auto-scaling-group \
  --auto-scaling-group-name gitlab-ci-runner-large \
  --desired-capacity 0 \
  --max-size 0 \
  --min-size 0

aws-vault exec rw -- aws autoscaling update-auto-scaling-group \
  --auto-scaling-group-name gitlab-ci-runner-image-builder \
  --desired-capacity 0 \
  --max-size 0 \
  --min-size 0
