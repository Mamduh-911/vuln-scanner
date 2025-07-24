FROM python:3.11-slim

# تثبيت الأدوات
RUN apt-get update && apt-get install -y \
    git curl golang && \
    apt-get clean

# تثبيت Flask
RUN python3 -m pip install --break-system-packages Flask

# تثبيت Dalfox بإصدار متوافق
RUN go install github.com/hahwul/dalfox/v2@v2.11.3
ENV PATH="/root/go/bin:${PATH}"

# نسخ ملفات المشروع
COPY . /app
WORKDIR /app

# تشغيل التطبيق
CMD ["python3", "app.py"]
