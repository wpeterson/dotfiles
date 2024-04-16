#!/usr/bin/env bash

aws-vault exec rw -- aws autoscaling update-auto-scaling-group \
  --auto-scaling-group-name gitlab-ci-runner-medium \
  --desired-capacity 3 \
  --max-size 3 \
  --min-size 3

aws-vault exec rw -- aws autoscaling update-auto-scaling-group \
  --auto-scaling-group-name gitlab-ci-runner-large \
  --desired-capacity 2 \
  --max-size 2 \
  --min-size 2

aws-vault exec rw -- aws autoscaling update-auto-scaling-group \
  --auto-scaling-group-name gitlab-ci-runner-image-builder \
  --desired-capacity 1 \
  --max-size 1 \
  --min-size 1
