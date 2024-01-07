#!/bin/sh

NETWORK="proxy145"
BRIDGE_NAME="br_${NETWORK}"
SOFTETHER_TAP="tap_softether"

#docker network rm "${NETWORK}"

if docker network inspect "${NETWORK}" > /dev/null 2>&1 ; then
    echo "${NETWORK} is exist."
else
    echo "${NETWORK} is not exist."

    docker network create \
        --attachable \
        --driver bridge \
        --gateway 10.145.4.1 \
        --subnet 10.145.4.0/24 \
        --ip-range 10.145.4.0/24 \
        --opt "com.docker.network.bridge.name"="${BRIDGE_NAME}" \
        "${NETWORK}"
fi

sudo ip link set dev tap_softether master "${BRIDGE_NAME}"
