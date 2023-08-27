FROM golang:1.20 AS builder

WORKDIR /app

RUN go mod init main

COPY . .

RUN go build -o main

FROM scratch
COPY --from=builder /app/main /usr/local/bin/main
CMD ["main"]