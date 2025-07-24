# استخدم صورة Go الرسمية كاملة (1.19)
FROM golang:1.19

# تحديث الحزم وتثبيت git
RUN apt-get update && apt-get install -y git

# تفعيل موديلات Go
ENV GO111MODULE=on

# تعيين بروكسي Go لتحميل الحزم بسلاسة
ENV GOPROXY=https://proxy.golang.org,direct

# تثبيت Dalfox الإصدار 2.11.3 باستخدام go install (الطريقة الحديثة)
RUN go install github.com/hahwul/dalfox/v2@v2.11.3

# إضافة مسار أدوات Go إلى PATH
ENV PATH="/go/bin:${PATH}"

# افحص نسخة Dalfox للتأكد من التثبيت الصحيح عند تشغيل الحاوية
CMD ["dalfox", "--version"]
