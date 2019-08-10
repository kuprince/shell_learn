#!/bin/bash

# HOST="google.com"
HOST="g.cn"
ping -c 1 $HOST
RETURN_CODE=$?
if [ "${RETURN_CODE}" -eq "0" ]; then
    echo "$HOST reachable"
else
    echo "$HOST unreachable"
fi
