FROM docker.io/library/golang:alpine AS builder

ARG GOMOCK_VERSION

ENV GO111MODULE=on

RUN go get github.com/golang/mock/mockgen@$GOMOCK_VERSION

FROM docker.io/library/alpine:latest

LABEL org.opencontainers.image.source "https://github.com/dane/gomock"
LABEL org.opencontainers.image.authors "Dane Harrigan"
LABEL org.opencontainers.image.licenses "Mozilla 2.0"

WORKDIR /app

COPY --from=builder /go/bin/mockgen /usr/local/bin/mockgen

ENTRYPOINT ["/usr/local/bin/mockgen"]
