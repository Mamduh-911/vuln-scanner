FROM golang:1.20

# تثبيت git + أدوات البناء
RUN apt-get update && apt-get install -y git build-essential

# إنشاء مجلد العمل
WORKDIR /app

# جلب كود Dalfox من GitHub
RUN git clone https://github.com/hahwul/dalfox.git . && \
    git checkout v2.11.3 && \
    go install .

# إضافة المسار إلى PATH
ENV PATH="/go/bin:${PATH}"

# اختبار النسخة
CMD ["dalfox", "--version"]
