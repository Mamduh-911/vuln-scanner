# استخدم إصدار Go مستقر وحديث (1.20) على Alpine خفيف
FROM golang:1.20-alpine

# ثبت git (مطلوب لتحميل الحزم)
RUN apk add --no-cache git

# حدد متغير بيئة لتفعيل موديلات Go
ENV GO111MODULE=on

# ثبت Dalfox الإصدار 2.11.3 عبر go install (يجب أن ينجح الآن)
RUN go install github.com/hahwul/dalfox/v2@v2.11.3

# أضف مسار تثبيت الأدوات إلى PATH
ENV PATH="/root/go/bin:${PATH}"

# افحص إصدار Dalfox للتأكد من التثبيت
CMD ["dalfox", "--version"]
