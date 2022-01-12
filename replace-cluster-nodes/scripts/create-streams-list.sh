#!/bin/bash

set -euo pipefail

#list streams
streams=(
    rizky
    ramadhan
    foo
    bar
    ruang
    guru
)

#create list streams from list
for i in "${streams[@]}" ; do
nats -s localhost:4222,localhost:4223,localhost:4224 stream add $i \
  --subjects="$i.>" \
  --storage=file \
  --retention=limits \
  --discard=old \
  --replicas=3 \
  --dupe-window="2m" \
  --no-allow-rollup \
  --no-deny-delete \
  --no-deny-purge \
  --max-msgs-per-subject="-1" \
  --max-msgs="-1" \
  --max-msg-size="-1" \
  --max-consumers="-1" \
  --max-age="-1" \
  --max-bytes="-1"
done