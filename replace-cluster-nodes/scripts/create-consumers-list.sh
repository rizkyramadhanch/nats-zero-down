#!/bin/bash

set -euo pipefail
#list streams
consumers=(
    rizky
    ramadhan
    foo
    bar
    ruang
    guru
)

for i in "${consumers[@]}" ; do
nats -s localhost:4222,localhost:4223,localhost:4224 consumer add \
  --deliver "all" \
  --target "$i-c" \
  --deliver-group "$i-c" \
  --ack "none" \
  --replay "instant" \
  --filter "" \
  --heartbeat "0s" \
  --no-flow-control \
  --no-headers-only \
  "$i" "$i-c"
done