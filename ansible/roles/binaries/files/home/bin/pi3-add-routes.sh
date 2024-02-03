#!/bin/sh


# route の追加
CONTAINERS="testpage-it-3 testpage-en-3 latex-server-2021"
for CONTAINER in $CONTAINERS; do
    dcenter.sh ${CONTAINER} ip route add 10.145.4.0/24 via 10.28.12.100
done

