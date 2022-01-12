#!/bin/bash

set -euo pipefail
consumers=(
    rizky
    ramadhan
    foo
    bar
    ruang
    guru
)

for i in "${consumers[@]}" ; do
watch nats -s localhost:4222,localhost:4223,localhost:4224 consumer report $i
done