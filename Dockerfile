# FROM golang:1.16-buster AS builder-go

# WORKDIR /go/src
# COPY . /go/src

# #CMD [ "go", "run", "main.go" ]

# FROM debian:9-slim

# WORKDIR /app

# COPY --from=builder-go /go/src .

# CMD [ "go", "run", "main.go" ]

FROM golang:alpine3.13 AS builder-go

WORKDIR /go/src

COPY . /go/src

RUN go build -ldflags '-s -w' main.go

FROM scratch

WORKDIR /go/src

COPY --from=builder-go /go/src /

CMD [ "/main" ] 

