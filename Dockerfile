FROM debian:stretch-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends shadowsocks-libev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 配置 Shadowsocks
RUN mkdir -p /etc/shadowsocks-libev
COPY config.json /etc/shadowsocks-libev/config.json

EXPOSE 8388

CMD ["ss-server", "-c", "/etc/shadowsocks-libev/config.json"]
