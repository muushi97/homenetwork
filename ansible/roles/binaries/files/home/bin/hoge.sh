#!/bin/sh

CONTAINER_NAME="$1"
shift

dcenter.sh "${CONTAINER_NAME}" ip route add "10.135.4.0/24" via "10.145.4.200"



