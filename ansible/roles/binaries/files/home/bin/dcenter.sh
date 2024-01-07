#!/bin/sh

# Docker Container ENTER

CONTAINER="$1"
shift
COMMAND="$@"

PID="$(docker inspect -f "{{ .State.Pid }}" "${CONTAINER}")"
sudo nsenter -t "${PID}" -n ${COMMAND}
