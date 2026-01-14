#!/bin/bash
# Sucros Wrapper
# shadowed1

FIFO="/home/chronos/.sucros.fifo"

if [[ ! -p "$FIFO" ]]; then
    echo "sucros-daemon not running" >&2
    exit 1
fi

if [[ $# -eq 0 ]]; then
    echo "usage: sucros command" >&2
    exit 1
fi

printf '%q ' "$@" | sed 's/ $/\n/' >"$FIFO"
