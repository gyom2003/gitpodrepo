
FROM golang:alpine as builder

WORKDIR /app
ADD . /app

RUN go mod download
RUN go build -o serveur

FROM scratch 
COPY --from=builder /app/serveur serveur
CMD ["/serveur"]
