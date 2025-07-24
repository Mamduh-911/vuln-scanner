FROM debian:bullseye

# تثبيت المتطلبات
RUN apt-get update && apt-get install -y \
    curl git unzip python3 python3-pip golang

# إعداد مسار go
ENV GOPATH=/go
ENV PATH=$GOPATH/bin:$PATH

# تثبيت dalfox
RUN go install github.com/hahwul/dalfox/v2@latest

# تثبيت nuclei
RUN curl -sSfL https://raw.githubusercontent.com/projectdiscovery/nuclei/v3/install.sh | sh
ENV PATH="/root/.nuclei:$PATH"

# نسخ ملفات المشروع
WORKDIR /app
COPY . .

# تثبيت البايثون
RUN pip3 install -r requirements.txt

# تشغيل السيرفر
CMD ["python3", "main.py"]
