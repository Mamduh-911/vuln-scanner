FROM golang:1.20-alpine

RUN apk add --no-cache git

ENV GO111MODULE=on
ENV GOPROXY=https://proxy.golang.org,direct

RUN go install github.com/hahwul/dalfox/v2@latest

ENV PATH="/root/go/bin:${PATH}"

CMD ["dalfox", "--version"]
