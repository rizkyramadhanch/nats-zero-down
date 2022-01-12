#!/bin/bash

set -euo pipefail
subscribers=(
    rizky
    ramadhan
    foo
    bar
    ruang
    guru
)

for i in "${subscribers[@]}" ; do
nats -s localhost:4222,localhost:4223,localhost:4224 sub \
  --queue "$i-c" \
  --ack \
  "$i-c"
done