FROM debian:sid-slim AS base

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y openconnect iptables inetutils-ping dnsutils curl dnsmasq net-tools iproute2

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]


# podman run -it --rm --cap-add=NET_ADMIN --device /dev/net/tun --network debeka --ip 10.89.0.2 --security-opt label=type:container_runtime_t vpn
