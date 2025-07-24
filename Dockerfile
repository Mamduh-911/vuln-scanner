FROM golang:1.20

RUN apt-get update && apt-get install -y git build-essential

WORKDIR /app

RUN git clone https://github.com/hahwul/dalfox.git . && \
    git checkout v2.12.0 && \
    go install .

ENV PATH="/go/bin:${PATH}"

CMD ["dalfox", "--version"]
