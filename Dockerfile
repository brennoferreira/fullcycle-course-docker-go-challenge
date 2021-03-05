FROM golang:alpine3.13 AS builder-go

WORKDIR /go/src

COPY . /go/src

RUN go build -ldflags '-s -w' main.go

FROM scratch

WORKDIR /go/src

COPY --from=builder-go /go/src /

CMD [ "/main" ] 

