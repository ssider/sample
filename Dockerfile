# Build the manager binary
FROM alpine:3.7  as sample
WORKDIR /
COPY ./cmd/bin/sample .
ENTRYPOINT ["./sample"]