#!/bin/sh


#                 network-name  gateway     subnet
create-bridge.sh  proxy145      10.145.4.1  10.145.4.0/24
create-bridge.sh  dry100        10.100.4.1  10.100.4.0/24
create-bridge.sh  wet101        10.101.4.1  10.101.4.0/24
create-bridge.sh  cold102       10.102.4.1  10.102.4.0/24
create-bridge.sh  hot103        10.103.4.1  10.103.4.0/24

create-overlay.sh overlay12     10.28.12.1  10.28.12.0/24




# tap_softether が br_proxy145 と繋がっているなら
if [ "$(sudo ip link show tap_softether | grep 'master br_proxy145')" ]; then
    echo '"tap_softether" is already linked to "br_proxy145"'
else
    sudo ip link set dev "tap_softether" master "br_proxy145"
fi


