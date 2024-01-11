FROM golang:alpine3.19 as base

WORKDIR /app

COPY . .

RUN go mod download

RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o main .
#cgo desabled script c 
#flag pour supp les elements pas nécessaire compilateur
#go build 

FROM scratch

COPY --from=base /app/main .

EXPOSE 8080

CMD ["./main"]
