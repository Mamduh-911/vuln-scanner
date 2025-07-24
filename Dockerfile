FROM debian:bullseye

# تثبيت المتطلبات
RUN apt-get update && apt-get install -y \
    curl git unzip python3 python3-pip golang

# dalfox باستخدام Go Modules (حل المشكلة)
ENV PATH=$PATH:/root/go/bin
ENV GO111MODULE=on
RUN go install github.com/hahwul/dalfox/v2@latest

# nuclei
RUN curl -sSfL https://raw.githubusercontent.com/projectdiscovery/nuclei/v3/install.sh | sh
ENV PATH="/root/.nuclei:$PATH"

# نسخ ملفات المشروع
WORKDIR /app
COPY . .

# تثبيت مكتبات Python
RUN pip3 install -r requirements.txt

# تشغيل السيرفر
CMD ["python3", "main.py"]
