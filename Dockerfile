FROM golang:latest as builder

WORKDIR /src/app/

RUN go mod init example/hello

COPY hello.go .

RUN go build -ldflags "-w"

FROM scratch

WORKDIR /src/app/

COPY --from=builder /src/app/hello .

CMD ["./hello"]