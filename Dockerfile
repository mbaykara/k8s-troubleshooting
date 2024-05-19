#My custom swiss army knife image for debugging and troubleshooting
FROM alpine:latest

LABEL maintainer="Mehmet Ali Baykara"

# Set working directory and user
WORKDIR /home/shooter
# Install necessary packages
RUN apk update && \
    apk add --no-cache curl=8.5.0-r0 \
    hey \
    vim \
    jq \
    yq \
    tree \
    iputils \
    kubectl \
    net-tools \
    tcpdump \
    traceroute \
    strace 



