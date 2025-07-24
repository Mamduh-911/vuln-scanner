FROM golang:1.20-alpine

RUN apk add --no-cache git

ENV GO111MODULE=on
ENV GOPROXY=https://proxy.golang.org,direct

RUN go get github.com/hahwul/dalfox/v2@v2.11.3

ENV PATH="/root/go/bin:${PATH}"

CMD ["dalfox", "--version"]
