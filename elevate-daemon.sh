#!/bin/bash
# ChromeOS Elevate Daemon
# shadowed1

FIFO="/tmp/elevate.fifo"
[[ -p "$FIFO" ]] || mkfifo "$FIFO"
chmod 600 "$FIFO"

echo "[elevate-daemon] Listening for commands on $FIFO"

while true; do
    if read -r cmd < "$FIFO"; then
        [[ -z "$cmd" ]] && continue
        echo "[daemon] Executing: $cmd"
        sudo bash -c "$cmd"
    fi
done
