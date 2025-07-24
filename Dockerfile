FROM golang:1.20

RUN apt-get update && apt-get install -y git build-essential

WORKDIR /app

# نسخ Dalfox وتثبيته من مصدره الرسمي بإصدار متوافق
RUN git clone https://github.com/hahwul/dalfox.git . && \
    git checkout tags/v2.11.0 && \
    go install ./cmd/dalfox

ENV PATH="/go/bin:${PATH}"

CMD ["dalfox", "--version"]
