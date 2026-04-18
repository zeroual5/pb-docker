FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache ca-certificates wget unzip

# Download PocketBase (change version if needed)
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.8/pocketbase_0.22.8_linux_amd64.zip \
    && unzip pocketbase_0.22.8_linux_amd64.zip \
    && chmod +x pocketbase

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
