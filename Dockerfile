FROM golang:1.20

# تثبيت git + أدوات البناء C (ضروري لـ Dalfox)
RUN apt-get update && apt-get install -y git build-essential

ENV GO111MODULE=on
ENV GOPROXY=https://proxy.golang.org,direct

RUN go install github.com/hahwul/dalfox/v2@latest

ENV PATH="/go/bin:${PATH}"

CMD ["dalfox", "--version"]
