#!/bin/sh


#                 network-name  gateway     subnet
create-bridge.sh  proxy145      10.145.3.1  10.145.3.0/24

# overlay ネットワークの適応用
docker run -itd --name for_overlay12 --net overlay12 --ip=10.28.12.254 busybox



