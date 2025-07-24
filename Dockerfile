FROM python:3.11-slim

# تثبيت أدوات النظام الأساسية
RUN apt-get update && apt-get install -y \
    git curl golang && \
    apt-get clean

# تثبيت Flask
RUN python3 -m pip install --break-system-packages Flask

# تثبيت Dalfox
RUN go install github.com/hahwul/dalfox/v2@latest
ENV PATH="/root/go/bin:${PATH}"

# نسخ الملفات
COPY . /app
WORKDIR /app

# تشغيل التطبيق
CMD ["python3", "app.py"]
