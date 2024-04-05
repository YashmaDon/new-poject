FROM quay.io/projectquay/golang:1.20 as builder
ARG os=linux
ENV TARGETOS=${os}

WORKDIR /go/src/app
COPY . .

RUN go get
RUN make build

FROM golang:1.22 as linux
WORKDIR /
COPY --from=builder /go/src/app/new-poject .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT [ "./new-poject" ]

FROM --platform=arm64 golang:1.22 as linux_arm
WORKDIR /
COPY --from=builder /go/src/app/new-poject .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT [ "./new-poject" ]

FROM --platform=windows golang:1.22 as windows
WORKDIR /
COPY --from=builder /go/src/app/kbot ./new-poject.exe
ENTRYPOINT [ "new-poject.exe" ]

FROM scratch
WORKDIR /
COPY --from=builder /go/src/app/kbotnew-poject .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT ["./new-poject"]

FROM golang:latest
WORKDIR /
COPY --from=builder /go/src/app/new-poject .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT ["./new-poject", "go"]