#!/usr/bin/env bash

set pipefail

export DISPLAY=:0

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

OUTPUT=$($SCRIPT_DIR/mem-monitor.sh)
CODE=$?

if [ $CODE -eq 1 ]; then
    notify-send -t 10000 "Memory monitor alert" "$OUTPUT"
fi
