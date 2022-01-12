#!/bin/bash

set -euo pipefail
publishers=(
    rizky
    ramadhan
    foo
    bar
    ruang
    guru
)
for i in "${publishers[@]}" ; do
nats -s localhost:4222,localhost:4223,localhost:4224 pub --timeout 5s --count 10000 --sleep 1s -w "$i.test" "Hello {{Count}}"
done