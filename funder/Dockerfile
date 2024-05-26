FROM ghcr.io/foundry-rs/foundry:nightly-9881e7de5d112c8d602b466a901b83fc99667906

RUN apk add --no-cache \
    curl \
    jq 

WORKDIR /app
COPY . .

RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
