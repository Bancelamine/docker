#!/usr/bin/bash

NS1="ns1"
NS2="ns2"
VETH1="veth1"
VPEER1="vpeer1"
VETH2="veth2"
VPEER2="vpeer2"
VPEER_ADDR1="10.11.0.10"
VPEER_ADDR2="10.11.0.20"

ip netns add $NS1
ip netns add $NS2

ip link add ${VETH1} type veth peer name ${VPEER1}
ip link add ${VETH2} type veth peer name ${VPEER2}

ip link set ${VPEER1} netns ${NS1}
ip link set ${VPEER2} netns ${NS2}

ip link set ${VETH1} up
ip link set ${VETH2} up

ip --netns ${NS1} a
ip --netns ${NS2} a

ip netns exec ${NS1} ip link set lo up
ip netns exec ${NS2} ip link set lo up
ip netns exec ${NS1} ip link set ${VPEER1} up
ip netns exec ${NS2} ip link set ${VPEER2} up

ip netns exec ${NS1} ip addr add ${VPEER_ADDR1}/16 dev ${VPEER1}
ip netns exec ${NS2} ip addr add ${VPEER_ADDR2}/16 dev ${VPEER2}

BR_ADDR="10.11.0.1"
BR_DEV="xavki0"

ip link add ${BR_DEV} type bridge
ip link set ${BR_DEV} up

ip link set ${VETH1} master ${BR_DEV}
ip link set ${VETH2} master ${BR_DEV}

ip addr add ${BR_ADDR}/16 dev ${BR_DEV}

ip netns exec ${NS1} ip route add default via ${BR_ADDR}
ip netns exec ${NS2} ip route add default via ${BR_ADDR}

