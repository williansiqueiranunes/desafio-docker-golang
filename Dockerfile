FROM golang:alpine3.19 AS builder

WORKDIR /
RUN go mod init main
COPY . .
RUN go build -ldflags "-s -w" .

FROM scratch
COPY --from=builder /main /

CMD ["/main"]
