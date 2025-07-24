FROM debian:bullseye

# تثبيت المتطلبات
RUN apt-get update && apt-get install -y \
    curl git unzip python3 python3-pip golang

# dalfox (طريقة يدوية بدون go install)
RUN curl -LO https://github.com/hahwul/dalfox/releases/latest/download/dalfox-linux-amd64 && \
    chmod +x dalfox-linux-amd64 && mv dalfox-linux-amd64 /usr/local/bin/dalfox

# nuclei
RUN curl -sSfL https://raw.githubusercontent.com/projectdiscovery/nuclei/v3/install.sh | sh
ENV PATH="/root/.nuclei:$PATH"

# نسخ ملفات المشروع
WORKDIR /app
COPY . .

# تثبيت مكتبات بايثون
RUN pip3 install -r requirements.txt

# تشغيل السيرفر
CMD ["python3", "main.py"]
