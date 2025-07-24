FROM golang:1.20-alpine

RUN apk add --no-cache python3 py3-pip git bash curl

# Flask
RUN pip install Flask

# Dalfox
RUN go install github.com/hahwul/dalfox/v2@latest
ENV PATH="/root/go/bin:${PATH}"

COPY . /app
WORKDIR /app

CMD ["python3", "app.py"]
