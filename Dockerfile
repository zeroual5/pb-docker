FROM golang:1.22-alpine

WORKDIR /app

# نسخ المشروع
COPY . .

# بناء PocketBase
RUN go build -tags netgo -ldflags "-s -w" -o app

# جعل الملف قابل للتنفيذ
RUN chmod +x app

# إنشاء مجلد البيانات
RUN mkdir -p /pb_data

EXPOSE 8080

CMD ["./app", "serve", "--http=0.0.0.0:8080", "--dir=/pb_data"]
