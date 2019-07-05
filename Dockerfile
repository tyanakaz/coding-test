FROM golang:1.12.6-alpine

ENV GOPATH /go
ENV PATH $PATH:/go/bin

RUN set -x \
      && apk add --no-cache git bash \
      && go get -u github.com/golang/dep/cmd/dep \
      && go get -u golang.org/x/lint/golint 

COPY . /go/src

RUN set -x \
      && cd /go/src/code \
      && dep ensure

WORKDIR /go/src

EXPOSE 8080

# CMD CGO_ENABLED=0 GOOS=linux go build -v -a -installsuffix cgo -o ./main ./main.go
