# Use Alpine Linux as the base image
FROM alpine:latest

# Install network troubleshooting tools
RUN apk --no-cache add \
    curl \
    netcat-openbsd \
    iputils \
    bind-tools \
    nmap \
    tcpdump \
    traceroute \
    iperf3 \
    mtr

# Set working directory
WORKDIR /app

