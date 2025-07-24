FROM python:3.9-slim

# تثبيت go
RUN apt update && apt install -y golang git curl unzip

# تثبيت nuclei
RUN go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
ENV PATH="/root/go/bin:${PATH}"

# نسخ الملفات
WORKDIR /app
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "app.py"]
