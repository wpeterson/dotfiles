#! /bin/bash

set -e

pushd ~/src/local-config/nix
make nix_hosts
popd

overmind s
