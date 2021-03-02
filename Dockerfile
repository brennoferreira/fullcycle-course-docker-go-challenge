FROM golang:alpine3.13

WORKDIR /go/src

COPY . /go/src

CMD [ "go", "run", "main.go" ] 

