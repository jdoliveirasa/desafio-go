FROM golang:1.14 AS builder
WORKDIR /go/src/app
COPY . .

#RUN go get -d -v ./...
#RUN go install -v ./...

#CMD ["app"]

FROM golang:1.14-alpine
WORKDIR /go/src/app
COPY --from=builder /go/src/app .

RUN go get -d -v ./...
RUN go install -v ./...

CMD ["app"]