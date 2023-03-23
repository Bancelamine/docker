#!/usr/bin/bash


cat /etc/docker/daemon.json
#{
#    "bip": "10.10.0.1/24",
#    "dns": ["8.8.8.8","0.0.0.0"]
#}

    --bip= network + mask bridge ip 

    --fixed-cidr= subnet

    --mtu= longueur des paquets sur docker0

    --default-gateway= spécifications de la gateway

    --dns=[]: liste des serveurs dns


apt install bridge-utils net-tools iproute2
docker network ls
docker network inspect xxx
brctl show


docker network create -o com.docker.network.bridge.name=titi titi
brctl show

ip route
ip link show type veth


ip netns ls
ls /var/run/netns/

# pour docker
ls /var/run/docker/netns/
ip netns list-id

# macaddress 2 ip
docker network inspect bridge
