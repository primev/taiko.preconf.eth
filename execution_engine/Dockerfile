FROM golang:1.21-alpine AS builder

RUN apk add --no-cache \
    gcc \
    musl-dev \
    linux-headers \
    git make

RUN git clone https://github.com/primev/taiko-geth.git /taiko-preconf

WORKDIR /taiko-preconf

RUN make geth

FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /taiko-preconf/build/bin/geth /usr/local/bin/

ENTRYPOINT ["geth"]
