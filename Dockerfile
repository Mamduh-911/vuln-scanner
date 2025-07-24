FROM golang:1.19

RUN apt-get update && apt-get install -y git build-essential

ENV GO111MODULE=on
ENV GOPROXY=https://proxy.golang.org,direct

RUN go install github.com/hahwul/dalfox/v2@v2.11.3

ENV PATH="/go/bin:${PATH}"

CMD ["dalfox", "--version"]
