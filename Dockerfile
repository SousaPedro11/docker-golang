FROM golang:alpine AS builder

WORKDIR /app

RUN go mod init github.com/sousapedro11/docker-golang

COPY main.go .

RUN go build && rm main.go

FROM scratch

COPY --from=builder /app/docker-golang .

ENTRYPOINT [ "./docker-golang" ]
