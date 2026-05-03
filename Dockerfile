FROM ghcr.io/zeroclaw-labs/zeroclaw:latest

USER root

RUN apt-get update && apt-get install -y git curl \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /zeroclaw-data/.zeroclaw \
             /zeroclaw-data/workspace/skills \
             /zeroclaw-data/web/dist

COPY config.toml /zeroclaw-data/.zeroclaw/config.toml

RUN chmod 600 /zeroclaw-data/.zeroclaw/config.toml \
    && chown -R 65534:65534 /zeroclaw-data

USER 65534

EXPOSE 42617

CMD ["zeroclaw", "daemon"]
