FROM alpine:latest

RUN apk add --no-cache \
    curl \
    gnupg \
    jq \
    tar

WORKDIR /app

RUN curl -L https://github.com/primev/mev-commit-p2p/releases/download/v0.3.0-rc2/mev-commit_Linux_x86_64.tar.gz -o mev-commit.tar.gz \
    && tar -xzf mev-commit.tar.gz \
    && rm mev-commit.tar.gz 

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
