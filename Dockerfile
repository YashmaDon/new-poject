FROM quay.io/projectquay/golang:1.20 as builder
ARG os=linux
ENV TARGETOS=${os}

WORKDIR /go/src/app
COPY . .

FROM golang:latest as linux
WORKDIR /
COPY --from=builder /go/src/app/new-poject .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT [ "./new-poject" ]

FROM golang:latest as linux_arm
WORKDIR /
COPY . .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT [ "./new-poject" ]

FROM golang:latest as windows
WORKDIR /
COPY --from=builder /go/src/app/new-poject .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT [ "new-poject.exe" ]

FROM golang:latest
WORKDIR /
COPY --from=builder /go/src/app/new-poject .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT ["./new-poject", "go"]