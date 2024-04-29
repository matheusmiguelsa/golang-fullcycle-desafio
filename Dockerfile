# Build stage 
FROM golang:1.20 AS builder

WORKDIR /app

COPY . .

RUN go build -o ./ main.go

# Final stage
FROM scratch

COPY --from=builder /app/main /app/main

CMD ["/app/main"]
