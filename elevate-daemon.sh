#!/bin/bash
# ChromeOS Elevate Daemon
# shadowed1

FIFO="/usr/local/.elevate.fifo"

sudo rm -f "$FIFO"
sudo mkfifo "$FIFO"
exec 3<> "$FIFO"

while true; do
    if read -r cmd <&3; then
        cmd="${cmd#"${cmd%%[![:space:]]*}"}"
        cmd="${cmd%"${cmd##*[![:space:]]}"}"
        [[ -z "$cmd" ]] && continue
        sudo bash -c "$cmd"
    fi
done
