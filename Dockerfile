FROM golang:1.15.10-alpine3.13 AS builder
WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...
RUN go build -ldflags "-s -w"

FROM scratch
WORKDIR /go/src/app
COPY --from=builder /go/src/app .

CMD ["./app"]