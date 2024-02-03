#!/bin/sh

NETWORK_NAME="$1"
GATEWAY="$2" # 10.145.4.1
SUBNET="$3" # 10.145.4.0/24
IP_RANGE="${SUBNET}" # 10.145.4.0/24

BRIDGE_NAME="br_${NETWORK_NAME}"

if docker network inspect "${NETWORK_NAME}" > /dev/null 2>&1 ; then
    echo "${NETWORK_NAME} is already exist."
else
    docker network create \
        --attachable \
        --driver bridge \
        --gateway "${GATEWAY}" \
        --subnet "${SUBNET}" \
        --ip-range "${IP_RANGE}" \
        --opt "com.docker.network.bridge.name"="${BRIDGE_NAME}" \
        "${NETWORK_NAME}"
fi

